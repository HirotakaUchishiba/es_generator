// 人材業界を選択した場合

import 'package:flutter/material.dart';

class HRQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const HRQuestionWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('なぜ人材業界を志望するのですか？'),
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
