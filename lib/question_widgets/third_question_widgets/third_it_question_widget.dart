// second_it__question_widget.dart

import 'package:flutter/material.dart';

class ThirdITQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const ThirdITQuestionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('あなたがIT業界を志望する理由を教えてください'),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: '回答を入力してください',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}