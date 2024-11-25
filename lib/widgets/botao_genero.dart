import 'package:flutter/material.dart';

class BotaoGenero extends StatelessWidget {
  final bool selecionado;
  final IconData icone;
  final String texto;
  final VoidCallback aoClicar;

  const BotaoGenero({
    super.key,
    required this.selecionado,
    required this.icone,
    required this.texto,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selecionado ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              icone,
              size: 48,
              color: selecionado ? Colors.blue : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              texto,
              style: TextStyle(
                color: selecionado ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}