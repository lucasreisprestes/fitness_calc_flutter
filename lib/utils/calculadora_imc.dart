class CalculadoraIMC {
  static double? calcular(double? peso, double? altura) {
    if (peso == null || altura == null || altura <= 0) {
      return null;
    }
    
    double alturaEmMetros = altura / 100;
    return peso / (alturaEmMetros * alturaEmMetros);
  }
}