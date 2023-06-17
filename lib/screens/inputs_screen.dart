import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs and Forms'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  CustomInputField(
                      labelText: 'Nombre', hintText: 'Nombre del Usuario'),
                  SizedBox(height: 30),
                  CustomInputField(
                      labelText: 'Apellido', hintText: 'Apellido del Usuario'),
                  SizedBox(height: 30),
                  CustomInputField(
                    labelText: 'Correo',
                    hintText: 'Correo del Usuario',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30),
                  CustomInputField(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña del Usuario',
                    obscureText: true,
                  ),
                  SizedBox(height: 30)
                ],
              )),
        ));
  }
}
