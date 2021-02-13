import 'package:flutter/material.dart';

class Utils {

  Color whatcolor(String type) {
    String typeLower = type.toLowerCase();
    switch (typeLower) {
      case "água" :
        return Colors.blue;
      case "fogo":
        return Colors.red;
      case "elétrico":
        return Colors.yellow;
      case "planta":
        return Colors.green;
      case "lutador":
        return Colors.amber[700];
      case "normal":
        return Colors.brown;
      case "gelo":
        return Colors.white;
      case "psíquico":
        return Colors.green[900];
      case "venenoso":
        return Colors.purple;
      case "noturno":
        return Colors.black;
      case "pedra":
        return Colors.grey;
      case "voador":
        return Colors.blueAccent[100];
      case "dragão":
        return Colors.orange;
      default:
        return Colors.brown;
    }
  }
}
