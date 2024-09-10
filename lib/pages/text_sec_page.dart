import 'package:ai_generative_app/constants/pallete.dart';
import 'package:ai_generative_app/pages/text_gen_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TextSecPage extends StatefulWidget {
  const TextSecPage({super.key});

  @override
  State<TextSecPage> createState() => _TextSecPageState();
}

class _TextSecPageState extends State<TextSecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secColor),
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Text',
          style: TextStyle(
            color: secColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          child: Flexible(
              child: FutureBuilder<String>(
            future: geminiAi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: Lottie.asset('assets/img_animation.json'));
              } else if (snapshot.hasError) {
                return Center(
                    child: SizedBox(
                        height: double.maxFinite,
                        child: Text('Error: ${snapshot.error}')));
              } else if (snapshot.hasData) {
                return Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SelectableText(
                      snapshot.data!,
                      // ignore: deprecated_member_use
                      toolbarOptions: const ToolbarOptions(
                        copy: true,
                        selectAll: true,
                        cut: false,
                        paste: false,
                      ),
                      style: const TextStyle(
                        color: secColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                );
              } else {
                return const Center(child: Text('No data'));
              }
            },
          )),
        ),
      ),
    );
  }
}
