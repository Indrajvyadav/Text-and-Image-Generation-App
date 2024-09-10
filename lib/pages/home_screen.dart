import 'package:ai_generative_app/constants/pallete.dart';
import 'package:ai_generative_app/pages/image_gen_page.dart';
import 'package:ai_generative_app/pages/text_gen_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: const BackButton(),
            title: const Text(
              'Chat Sage',
              style: TextStyle(
                fontSize: 25,
                color: secColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Lottie.asset('assets/ai animation.json'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.text_fields_rounded,
                          size: 50,
                          color: textColor,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TextGenPage(),
                              )),
                          child: Container(
                              margin: const EdgeInsets.all(12),
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: secColor),
                              child: const Center(
                                child: Text(
                                  'Text',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(children: [
                      const Icon(
                        Icons.image_search_rounded,
                        size: 50,
                        color: textColor,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImageGenPage(),
                            )),
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: secColor),
                          child: const Center(
                            child: Text(
                              'Image',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
