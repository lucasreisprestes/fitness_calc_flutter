import 'package:flutter/material.dart';
import '../widgets/botao_genero.dart';
import '../widgets/campo_entrada.dart';
import '../models/categoria_imc.dart';
import '../utils/calculadora_imc.dart';
import './categorias_imc_screen.dart';

class CalculadoraIMCScreen extends StatefulWidget {
  const CalculadoraIMCScreen({super.key});

  @override
  State<CalculadoraIMCScreen> createState() => _CalculadoraIMCScreenState();
}

class _CalculadoraIMCScreenState extends State<CalculadoraIMCScreen> {
  double? peso;
  double? altura;
  double? imc;
  bool masculino = true;
  String? categoriaIMC;

  void calcularIMC() {
    double? imcCalculado = CalculadoraIMC.calcular(peso, altura);
    
    if (imcCalculado != null) {
      setState(() {
        imc = imcCalculado;
        categoriaIMC = CategoriaIMC.categorizar(imcCalculado);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriasIMCScreen(),
                ),
              );
            },
          ),
        ],
        title: const Text(
          'Your Body',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BotaoGenero(
                    selecionado: masculino,
                    icone: Icons.male,
                    texto: 'Masculino',
                    aoClicar: () => setState(() => masculino = true),
                  ),
                  BotaoGenero(
                    selecionado: !masculino,
                    icone: Icons.female,
                    texto: 'Feminino',
                    aoClicar: () => setState(() => masculino = false),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CampoEntrada(
                      rotulo: 'Seu peso (kg)',
                      aoMudar: (valor) {
                        setState(() {
                          peso = double.tryParse(valor);
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CampoEntrada(
                      rotulo: 'Sua altura (cm)',
                      aoMudar: (valor) {
                        setState(() {
                          altura = double.tryParse(valor);
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (imc == null)
                ElevatedButton(
                  onPressed: calcularIMC,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Calcular seu IMC'),
                )
              else
                Column(
                  children: [
                    Text(
                      'Seu IMC',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      imc!.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      categoriaIMC!,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          imc = null;
                          categoriaIMC = null;
                        });
                      },
                      child: const Text('Calcular IMC novamente'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}