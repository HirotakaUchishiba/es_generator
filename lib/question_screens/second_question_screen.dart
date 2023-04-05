// question_screen.dart
import 'package:es_generator/entry_sheet_provider.dart';
import 'package:es_generator/question_screens/third_question_screen.dart';
import 'package:es_generator/question_widgets/second_question_widgets/second_hr_question_widgets.dart';
import 'package:es_generator/question_widgets/second_question_widgets/second_it_question_widget.dart';
import 'package:es_generator/question_widgets/second_question_widgets/second_manufacturer_question_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondQuestionScreen extends ConsumerWidget {
  const SecondQuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final industry = ref.watch(industrySelectedProvider);
    final controller = TextEditingController();

    Widget questionWidget;
    switch (industry) {
      case 'IT':
        questionWidget = SecondITQuestionWidget(controller: controller);
        break;
      case '人材':
        questionWidget = SecondHRQuestionWidget(controller: controller);
        break;
      case 'メーカー':
        questionWidget = SecondManufacturerQuestionWidget(controller: controller);
        break;
      default:
        throw Exception('Invalid industry');
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Q2',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            questionWidget,
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ElevatedButton(
                onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ThirdQuestionScreen()),
                      ),
                      style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 245, 130, 130),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                child: const Text('次へ'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
