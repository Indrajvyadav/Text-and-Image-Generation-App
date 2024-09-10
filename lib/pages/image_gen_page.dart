import 'package:ai_generative_app/api/rest.dart';
import 'package:ai_generative_app/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImageGenPage extends StatefulWidget {
  const ImageGenPage({super.key});

  @override
  State<ImageGenPage> createState() => _ImageGenPageState();
}

class _ImageGenPageState extends State<ImageGenPage> {
  final textController = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: secColor,
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Image Sage',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: secColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          top: 50,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            TextField(
              style: const TextStyle(color: textColor),
              controller: textController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                    color: secColor, fontWeight: FontWeight.bold, fontSize: 22),
                hintText: 'Enter your prompt',
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelStyle: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: textColor,
                ),
                onPressed: () {
                  convertTextToImage(textController.text, context);
                  isLoading = true;

                  setState(() {});
                },
                child: isLoading
                    ? Lottie.asset('assets/img_animation.json', height: 60)
                    : const Text(
                        'Generate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
