import 'package:flutter/material.dart';
import '../screens/calculadora_imc_screen.dart';
import '../screens/categorias_imc_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String categorias = '/categorias';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const CalculadoraIMCScreen(),
        categorias: (context) => const CategoriasIMCScreen(),
      };
}