import 'package:flutter/material.dart' show IconData, Widget;

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

//en esta opcion no importa le orden como envien los parametros pero los deben enviar todos
  MenuOption(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
