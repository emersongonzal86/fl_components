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

// el init state es cuando se crea por primera y unica vez

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //vamos a ver la posicion y pixeles, tambien la posicion y la extension maxima del scroll
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      //vamos a llamar el add5 cuanto estemos 500 pixeles cerca del final del scroll

      if((scrollController.position.pixels +500)>= scrollController.position.maxScrollExtent){
        add5();
      }
    });
  }
// este codigo agrega 5 elementos mas cuando se esta llegando al final del scroll
void add5(){
  final lastId = imagesIds.last;
  imagesIds.addAll(
    [1,2,3,4,5].map((e) => lastId +e )
    );
 //una vez se agregan los 5 elementos debo hacer setstate para actualizar   el listview y se redibuje
 //solo redibuja la actualizacion
  setState(() {
    
  });  
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MediaQuery.removePadding se utiliza para remover el padding superior o inferior de la pantalla
      //es el espacio que utiliza appbar
      body: MediaQuery.removePadding(
        context: context,
        //remueve le padding superior
        removeTop: true,
        //remueve el padding inferior
        removeBottom: true,
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
    );
  }
}
