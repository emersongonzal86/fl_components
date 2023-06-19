import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //vamos a usar un controlador para sabre que tan cerca del final del scroll esta posicionado en este momento
//cualquier widget que tenga scroll tiene disponible el controlador este scrollcontroller esta asociado al listview
// y puedo saber en todo momento su posicion para saber su poscion hay que crea un listener
  final ScrollController scrollController = ScrollController();
// vamos acrear una variable para saber cuando esta cargando imagenes
  bool isLoading = false;

// el init state es cuando se crea por primera y unica vez

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //vamos a ver la posicion y pixeles, tambien la posicion y la extension maxima del scroll
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      //vamos a llamar el add5 cuanto estemos 500 pixeles cerca del final del scroll

      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //add5();
        fectchData();
      }
    });
  }

// creamos un future para simular tiempo de espera
  Future fectchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));

    add5();

    isLoading = false;
    setState(() {});

    //para evitar que la pantalla salta cuando esta arriba al disparar el evento animatedTo se usa este codigo
    //el cual evaluau si la posicion actual mas 100 pixeles no esta cerca de la extension maxima de la pantalla no hace nada
    //pero si esta cerca al final hace la animacion
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

//vamos amover la pantalla un poco para arriba para indicar que hay mas imagenes recien cargadas

    scrollController.animateTo(
        //el offset es la pocicion a donde debo moverme para eso voy a tomar la posicion actual y le sumo los pixles
        //a los que me quiero desplazar

        scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

// este codigo agrega 5 elementos mas cuando se esta llegando al final del scroll
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    //una vez se agregan los 5 elementos debo hacer setstate para actualizar   el listview y se redibuje
    //solo redibuja la actualizacion
    setState(() {});
  }
//creamos un metodo onRefresh para hacer el pull refresh con RefreshIndicator

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
//usamos MediaQuery para obtener informacion del dispositivo en este caso vamos a tomar el ancho del apantalla
//size sabe el ancho y alto de la pantalla
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //MediaQuery.removePadding se utiliza para remover el padding superior o inferior de la pantalla
      //es el espacio que utiliza appbar
      body: MediaQuery.removePadding(
        context: context,
        //remueve le padding superior
        removeTop: true,
        //remueve el padding inferior
        removeBottom: true,
        child: Stack(
          children: [
//vamos a usar un widget para hacer el pull to refresh RefreshIndicator envolviendo el widget que tiene el scroll

            RefreshIndicator.adaptive(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                //el siguiente codigo es para que al final se vea igual en ios y android para que pueda subir mas el scroll
                //para que no aparezca la curvatura que suele aparecer en android
                physics: const BouncingScrollPhysics(),
                //vamos a usar un controlador para sabre que tan cerca del final del scroll esta posicionado en este momento
                //cualquier widget que tenga scroll tiene disponible el controlador
                controller: scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, index) {
                  return FadeInImage(
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300?image=${imagesIds[index]}'));
                },
              ),
            ),
            //widget para colocar un widget en una pisicion especifica

            //vamos a mostrar el loading de manera condicional el if permite una instruccion inclusive permite el else pero sin llaves {}
            if (isLoading)
              Positioned(
                  bottom: 40,

                  //vamos a tomar el ancho del dispositivo y tomamos la mitad mas el ancho del widget si no le resto los 30
                  //no queda centrado la posicion unicial del widget arrancaria en el centro
                  left: size.width * 0.5 - 30,
                  child: const _LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: const CircularProgressIndicator(color: AppTheme.primary));
  }
}
