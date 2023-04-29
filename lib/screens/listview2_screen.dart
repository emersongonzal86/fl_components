import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Listview Tipo 2')),
        //con el ListView.separated se hace carga perezosa de lso elementos de la lista no carga todos sino a medida que los va
        //necesitando
        body: ListView.separated(
          itemCount: options.length,
          // la i representan index
          itemBuilder: (context, i) => ListTile(
            title: Text(options[i]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          // se usa guin bajo cuando no se va a utilizar el argumento de la funcion y el numero de guines sera igual
          //a la posición del argumento _ uno y dos para la posicipn dos __ los guines bajos son nombres validos de argumentos

          //separatorBuilder: (context, index) => const Divider(),
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
