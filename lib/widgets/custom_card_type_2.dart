import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        child: Column(
          children: const [
            FadeInImage(
              image: NetworkImage(
                  'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography-960x640.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
            )
          ],
        ));
  }
}
