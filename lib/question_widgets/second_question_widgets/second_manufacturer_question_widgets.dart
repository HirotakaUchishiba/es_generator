// 人材業界を選択した場合

import 'package:flutter/material.dart';

class SecondManufacturerQuestionWidget extends StatelessWidget {
  final TextEditingController controller;

  const SecondManufacturerQuestionWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ),
      ],
    );
  }
}
