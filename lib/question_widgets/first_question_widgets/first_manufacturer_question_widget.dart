// manufacturer_question_widget.dart

import 'package:flutter/material.dart';

class ManufacturerQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const ManufacturerQuestionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('なぜメーカーを志望するのですか？'),
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
