import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
                imageUrl:
                    'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography-960x640.jpg'),
            SizedBox(height: 20),
            CustomCardType2(
              name: null,
              imageUrl:
                  'https://images.pexels.com/photos/388415/pexels-photo-388415.jpeg',
            ),
            SizedBox(height: 20),
            CustomCardType2(
              name: 'Un hermoso paisaje',
              imageUrl:
                  'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
            SizedBox(height: 100),
          ],
        ));
  }
}
