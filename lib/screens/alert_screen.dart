import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.indigo,
              // shape:const StadiumBorder(),
              // elevation:0
              // ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: const Text('Mostrar Alerta', style: TextStyle(fontSize: 16)),
              ),
              //onPressed: null deshabilita el; boton
              onPressed: () {

              }
              )
              ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
