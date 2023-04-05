import 'package:es_generator/entry_sheet_provider.dart';
import 'package:es_generator/question_screens/first_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndustrySelectionScreen extends StatelessWidget {
  const IndustrySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('業界選択',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final entrySheet = ref.watch(industrySelectedProvider);
          return Column(
            children: [
              const LinearProgressIndicator(
                value: 0.33,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '志望する業界は何ですか？',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListTile(
                title: const Text('IT'),
                leading: Radio<String>(
                  value: 'IT',
                  groupValue: entrySheet,
                  onChanged: (value) => ref
                      .read(industrySelectedProvider.notifier)
                      .state = value!,
                ),
              ),
              ListTile(
                title: const Text('人材'),
                leading: Radio<String>(
                  value: '人材',
                  groupValue: entrySheet,
                  onChanged: (value) => ref
                      .read(industrySelectedProvider.notifier)
                      .state = value!,
                ),
              ),
              ListTile(
                title: const Text('メーカー'),
                leading: Radio<String>(
                  value: 'メーカー',
                  groupValue: entrySheet,
                  onChanged: (value) => ref
                      .read(industrySelectedProvider.notifier)
                      .state = value!,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: ElevatedButton(
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
                    onPressed: entrySheet != ""
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FirstQuestionScreen()),
                            );
                          }
                        : null,
                    child: const Text('次へ'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
