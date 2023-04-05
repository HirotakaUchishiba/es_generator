// second_it__question_widget.dart

import 'package:es_generator/entry_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondITQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const SecondITQuestionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final _itMotivationContents = ref.watch(extracurricularActivitiesProvider);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('学生時代頑張ったことは何ですか？'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: '回答を入力してください',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => ref
                      .read(extracurricularActivitiesProvider.notifier)
                      .state = value,
                ),
          ],
        );
      },
    );
  }
}
