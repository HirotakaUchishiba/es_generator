import 'dart:convert';

import 'package:es_generator/entry_sheet_provider.dart';
import 'package:es_generator/generated_entry_sheet_screen.dart';
import 'package:es_generator/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ThirdQuestionScreen extends ConsumerWidget {
  const ThirdQuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptPrefix = ref.watch(promptProvider);
    final industry = ref.watch(industrySelectedProvider);
    final itExperience = ref.watch(itExperienceProvider);
    final programmingLanguages = ref.watch(programmingLanguagesProvider);
    final extracurricularActivities =
        ref.watch(extracurricularActivitiesProvider);
    final hrMotivation = ref.watch(hrMotivationProvider);
    final manufacturerMotivation = ref.watch(manufacturerMotivationProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Q3',
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('IT業界を志望する動機は何ですか？'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: '回答を入力してください',
                filled: true,
                fillColor: const Color.fromARGB(255, 238, 232, 232),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()),
                  );
                  String prompt = '$promptPrefix\n';
                  prompt += '志望する業界: $industry\n';

                  switch (industry) {
                    case 'IT':
                      prompt += 'プログラミングの経験:${itExperience ? 'あり' : 'なし'} 。\n';

                      if (itExperience) {
                        prompt +=
                            '経験のあるプログラミング言語:${programmingLanguages.join(', ')}\n';
                      }
                      break;
                    case '人材':
                      prompt += '人材業界志望理由: $hrMotivation\n';
                      break;
                    case 'メーカー':
                      prompt += 'メーカー志望理由: $manufacturerMotivation\n';
                      break;
                    default:
                      throw Exception('Invalid industry');
                  }
                  prompt += '学生時代に力を入れたこと:$extracurricularActivities\n';
                  prompt += 'この業界を志望する理由:${controller.text}';
                  print(prompt);

                  final generatedText = await generateEntrySheet(prompt);
                  print(generatedText);
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratedEntrySheetScreen(
                        generatedText: generatedText,
                      ),
                    ),
                  );
                },
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
                child: const Text('ESを生成する'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> generateEntrySheet(String prompt) async {
  const apiKey = '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';
  const url = 'apikey';

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  final body = json.encode({
    'prompt': prompt,
    'max_tokens': 1000,
    'n': 1,
    'stop': null,
    'temperature': 1,
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      // UTF-8でデコード
      final generatedText =
          utf8.decode(responseData['choices'][0]['text'].trim().runes.toList());
      return generatedText;
    } else {
      print('Error response: ${response.body}');
      throw Exception('Failed to generate entry sheet');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to generate entry sheet');
  }
}
