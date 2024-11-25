class CategoriaIMC {
  final double valor;
  final String descricao;

  CategoriaIMC(this.valor, this.descricao);

  static String categorizar(double imc) {
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc >= 18.5 && imc < 25) {
      return "Normal";
    } else if (imc >= 25 && imc < 30) {
      return "Sobrepeso";
    } else {
      return "Obesidade";
    }
  }
}