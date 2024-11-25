import 'package:flutter/material.dart';

class CategoriasIMCScreen extends StatelessWidget {
  const CategoriasIMCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Your body',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'BMI catgories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            _buildCategoryItem(
              'Less than 18.5',
              'you\'re underweight.',
            ),
            const SizedBox(height: 24),
            _buildCategoryItem(
              '18.5 to 24.9',
              'you\'re normal.',
            ),
            const SizedBox(height: 24),
            _buildCategoryItem(
              '25 to 29.9',
              'you\'re overweight.',
            ),
            const SizedBox(height: 24),
            _buildCategoryItem(
              '30 or more',
              'obesity.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String range, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          range,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}