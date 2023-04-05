// generated_entry_sheet_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneratedEntrySheetScreen extends StatelessWidget {
  final String generatedText;

  const GeneratedEntrySheetScreen({required this.generatedText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('エントリーシート作成完了',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('エントリーシートの内容：'),
              const SizedBox(height: 16),
              SelectableText(
                generatedText,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Container(
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
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: generatedText));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('テキストがコピーされました。')),
                    );
                  },
                  child: const Text('テキストをコピー'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
