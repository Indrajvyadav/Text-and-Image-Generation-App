import 'package:ai_generative_app/constants/pallete.dart';
import 'package:ai_generative_app/pages/text_sec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class TextGenPage extends StatefulWidget {
  const TextGenPage({super.key});

  @override
  State<TextGenPage> createState() => _TextGenPageState();
}

Future<String> geminiAi() async {
  Gemini.init(apiKey: 'AIzaSyCBmxBxxwFm_QbiIUBH9ESFItIFX8Ch2xw');

  final gemini = Gemini.instance;

  try {
    final response = await gemini.text(aiEditingController.text);
    return response?.output ?? 'No output from Gemini';
  } catch (e) {
    return 'Error: $e';
  }
}

final TextEditingController aiEditingController = TextEditingController();

final _focusNode = FocusNode();

class _TextGenPageState extends State<TextGenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secColor),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Text Sage',
          style: TextStyle(fontWeight: FontWeight.bold, color: secColor),
        ),
      ),
      body: GestureDetector(
        onTap: () => _focusNode.unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24)),
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  focusNode: _focusNode,
                  controller: aiEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusColor: Colors.grey[200],
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      hintMaxLines: 2,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: secColor,
                      ),
                      hintText:
                          "Let's create magic together! What's on your mind today?",
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TextSecPage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.search_rounded,
                          color: textColor,
                        ),
                      )),
                ),
              ),
              Flexible(
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
