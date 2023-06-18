import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

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
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300?image=${index + 1}'));
          },
        ),
      ),
    );
  }
}
