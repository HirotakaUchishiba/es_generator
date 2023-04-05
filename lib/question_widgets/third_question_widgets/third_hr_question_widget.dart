// 人材業界を選択した場合

import 'package:flutter/material.dart';

class ThirdHRQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const ThirdHRQuestionWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('あなたが人材業界を志望する理由を教えてください'),
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