

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/exam_model.dart';
import '../widgets/exam_details.dart';

class DetailsPage extends StatelessWidget{

  const DetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(exam.name.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ExamDetailsWidget(exam: exam),
          ],
        ),
      ),
    );
  }
}
