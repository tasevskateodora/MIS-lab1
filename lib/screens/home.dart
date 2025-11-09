import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Exam> get _exams => [
    Exam(name: 'Структурно програмирање', dateTime: DateTime(2025, 1, 10, 12, 0), rooms: ['Laboratorija 2', 'Laboratorija 3']),
    Exam(name: 'Објектно ориентирано програмирање', dateTime: DateTime(2026, 1, 15, 10, 0), rooms: ['Laboratorija 1', 'Laboratorija 2']),
    Exam(name: 'Алгоритми и податочни структури', dateTime: DateTime(2025, 1, 18, 9, 0), rooms: ['Laboratorija 3', 'Laboratorija 5']),
    Exam(name: 'Бази на податоци', dateTime: DateTime(2025, 1, 20, 11, 0), rooms: ['Laboratorija 1', 'Laboratorija 4']),
    Exam(name: 'Оперативни системи', dateTime: DateTime(2025, 1, 22, 13, 0), rooms: ['Laboratorija 2', 'Laboratorija 1']),
    Exam(name: 'Компјутерски мрежи', dateTime: DateTime(2026, 1, 25, 10, 30), rooms: ['Laboratorija 3', 'Laboratorija 4']),
    Exam(name: 'Вештачка интелигенција', dateTime: DateTime(2025, 1, 27, 12, 0), rooms: ['Laboratorija 1', 'Laboratorija 6']),
    Exam(name: 'Математичка логика', dateTime: DateTime(2026, 1, 29, 9, 30), rooms: ['Laboratorija 2', 'Laboratorija 4']),
    Exam(name: 'Интернет технологии', dateTime: DateTime(2026, 2, 1, 11, 0), rooms: ['Laboratorija 3', 'Laboratorija 5']),
    Exam(name: 'Софтверско инженерство', dateTime: DateTime(2025, 2, 3, 14, 0), rooms: ['Laboratorija 4', 'Laboratorija 2']),
  ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 223089'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ExamGrid(exams: _exams),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        color: Colors.purple.shade50,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, color: Colors.purple),
            const SizedBox(width: 8),
            Text(
              'Вкупно испити: ${_exams.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
