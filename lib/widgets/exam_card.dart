import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam_model.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: isPast ? Colors.grey.shade50 : Colors.purple.shade50,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isPast ? Colors.grey : Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      exam.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isPast
                            ? Colors.grey.shade600
                            : Colors.purple.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16, color: Colors.purple),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${dateFormat.format(exam.dateTime)} - ${timeFormat.format(exam.dateTime)}',
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.purple),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          exam.rooms.join(', '),
                          style: const TextStyle(fontSize: 13),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      isPast ? Icons.check_circle : Icons.access_time,
                      color: isPast ? Colors.green : Colors.orange,
                      size: 18,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
