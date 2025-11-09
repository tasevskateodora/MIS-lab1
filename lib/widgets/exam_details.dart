import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/exam_model.dart';

class ExamDetailsWidget extends StatelessWidget {

  final Exam exam;
  const ExamDetailsWidget({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now=DateTime.now();
    final difference=exam.dateTime.difference(now);

    final remainingDays=difference.inDays;
    final remainingHours=difference.inHours.remainder(24);

    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              exam.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(Icons.calendar_month, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Text(
                'Датум: ${dateFormat.format(exam.dateTime)}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height:10),
          Row(
            children: [
              const Icon(Icons.access_time, color:Colors.deepPurple),
              const SizedBox(width:8),
              Text(
                'Време: ${timeFormat.format(exam.dateTime)}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height:10),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color:Colors.deepPurple),
              const SizedBox(width: 8),
              Expanded(
                  child:Text(
                    'Простории: ${exam.rooms.join(', ')}',
                    style: const TextStyle(fontSize: 18),
                  ),
              ),
            ],
          ),
          const Divider(height:30,thickness: 1),

          if(exam.dateTime.isBefore(now))
            Row(
              children: const[
                Icon(Icons.check_circle, color:Colors.green),
                SizedBox(width:8),
                Text(
                  'Овој испит е веќе одржан',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:const[
                    Icon(Icons.hourglass_bottom, color: Colors.orange),
                    SizedBox(width: 8),
                    Text(
                      'Преостанато време:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '$remainingDays дена, $remainingHours часа',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
        ],
      ),
    );

  }

}