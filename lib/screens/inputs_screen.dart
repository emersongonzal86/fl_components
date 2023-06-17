import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Emerson',
      'last_name': 'Gonzalez',
      'email': 'emerson@google.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('Inputs and Forms'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: myFormKey,
                child: Column(
                  children: [
                    const CustomInputField(
                        labelText: 'Nombre', hintText: 'Nombre del Usuario'),
                    const SizedBox(height: 30),
                    const CustomInputField(
                        labelText: 'Apellido',
                        hintText: 'Apellido del Usuario'),
                    const SizedBox(height: 30),
                    const CustomInputField(
                      labelText: 'Correo',
                      hintText: 'Correo del Usuario',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 30),
                    const CustomInputField(
                      labelText: 'Contraseña',
                      hintText: 'Contraseña del Usuario',
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Guardar'))
                          ),
                      onPressed: () {
                        if ( !myFormKey.currentState!.validate() ){

                            FocusScope.of(context).requestFocus( FocusNode());

                          print('Formulario no válido');
                          return;
                        }
                        //* imprimir valores del formulario
                        print(formValues);
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
