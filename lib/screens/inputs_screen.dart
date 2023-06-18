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
                    CustomInputField(
                        labelText: 'Nombre',
                        hintText: 'Nombre del Usuario',
                        formProperty: 'first_name',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Apellido',
                        hintText: 'Apellido del Usuario',
                        formProperty: 'last_name',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Correo',
                        hintText: 'Correo del Usuario',
                        keyboardType: TextInputType.emailAddress,
                        formProperty: 'email',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        labelText: 'Contraseña',
                        hintText: 'Contraseña del Usuario',
                        obscureText: true,
                        formProperty: 'password',
                        formValues: formValues),
                    const SizedBox(height: 30),
                    DropdownButtonFormField(
                      value: 'Admin',
                      items: const [
                      DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                      DropdownMenuItem(value: 'Superuser', child: Text('Superuser')),
                      DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                      DropdownMenuItem(value: 'Jr.Developer', child: Text('Jr.Developer')),
                    ], onChanged: (value) {
                      print(value);
                      formValues['role']= value ?? 'Admin';
                    }),
                    ElevatedButton(
                      child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text('Guardar'))),
                      onPressed: () {
                        if (!myFormKey.currentState!.validate()) {
                          //codigo para ocultar el teclado al tocar el boton
                          FocusScope.of(context).requestFocus(FocusNode());

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
