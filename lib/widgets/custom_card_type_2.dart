import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  //propiedades
  final String imageUrl;
  final String? name;

  const CustomCardType2({super.key, required this.imageUrl, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 30,
        shadowColor: AppTheme.primary.withOpacity(0.5),
        child: Column(
          children: [
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),

            // con el if puedo validar si es nulo, esto funciona en Dart se puede cambiar  el  child: Text( name ?? 'No Title' )
            // por child: Text( name ) genera error pero se le cooca (name!) indicandole a flutter que no es un error
            if (name != null)
              Container(
                  alignment: AlignmentDirectional.centerEnd,
                  padding:
                      const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  child: Text(name ?? 'No Title'))
          ],
        ));
  }
}
