import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs and Forms'),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    initialValue: '',
                    textCapitalization: TextCapitalization.words,
                    onChanged: ( value ){
                      print('value: $value');
                    }
                  )
                ],
              )),
        ));
  }
}
