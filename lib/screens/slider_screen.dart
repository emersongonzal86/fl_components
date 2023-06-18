import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders and Checks'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //adaptative es una funcion qu permite que el widget se comporte de manera natural a la plataforma en el que trabaje
              Slider.adaptive(
                  min: 50,
                  max: 400,
                  activeColor: AppTheme.primary,
                  //dividir el slider con puntos de anclaje
                  //divisions: 10,
                  value: _sliderValue,
                  onChanged: (value) {
                    _sliderValue = value;
                    setState(() {});
                  }),

              Image(
                image: const NetworkImage(
                    'https://w7.pngwing.com/pngs/10/777/png-transparent-batman-cartoon-illustration-batman-toonseum-drawing-cartoon-batman-v-superman-heroes-superhero-fictional-character-thumbnail.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
              const SizedBox(height: 50)
            ],
          ),
        ));
  }
}
