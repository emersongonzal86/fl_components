import 'package:flutter/material.dart';
import 'package:fl_components/screens/screens.dart';

import '../router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes en Flutter'),
      
        ),
        body: ListView.separated(
            itemBuilder: (context, i) => ListTile(
                  leading: Icon(menuOptions[i].icon),
                  title: Text(menuOptions[i].name),
                  onTap: () {
                    //menu desde menuOptios

                    Navigator.pushNamed(context, menuOptions[i].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
