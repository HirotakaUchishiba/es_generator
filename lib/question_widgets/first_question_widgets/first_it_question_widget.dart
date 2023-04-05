// it_question_widget.dart

import 'package:es_generator/entry_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ITQuestionWidget extends StatefulWidget {
  final TextEditingController controller;

  const ITQuestionWidget({super.key, required this.controller});

  @override
  _ITQuestionWidgetState createState() => _ITQuestionWidgetState();
}

class _ITQuestionWidgetState extends State<ITQuestionWidget> {
  final List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final bool _hasExperience = ref.watch(itExperienceProvider);
        final _selectedLanguages = ref.watch(programmingLanguagesProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('プログラミング経験'),
            Row(
              children: [
                Checkbox(
                  value: _hasExperience,
                  onChanged: (value) => ref
                      .read(itExperienceProvider.notifier)
                      .state = value!,
                ),
                const Text('経験あり'),
              ],
            ),
            if (_hasExperience) ...[
              const Text('経験したことのある言語は何ですか？'),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final language in [
                    'JavaScript',
                    'TypeScript',
                    'Java',
                    'C言語',
                    'Python',
                    'Ruby',
                    'PHP',
                    'Go言語',
                    'Swift',
                    'Kotlin',
                    'Dart',
                  ])
                    FilterChip(
                      label: Text(language),
                      selected: _selectedLanguages.contains(language),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedLanguages.add(language);
                          } else {
                            _selectedLanguages.remove(language);
                          }
                        });
                      },
                    ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
