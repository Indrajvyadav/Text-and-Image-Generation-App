import 'dart:convert';

import 'package:ai_generative_app/pages/image_sec_page.dart';
import 'package:ai_generative_app/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<dynamic> convertTextToImage(
  String prompt,
  BuildContext context,
) async {
  Uint8List imageData = Uint8List(0);

  const baseUrl = 'https://api.stability.ai';
  final url = Uri.parse(
      '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-1/text-to-image');

  // Make the HTTP POST request to the Stability Platform APIp
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          //add ypur secreat key here
          'Bearer sk-JgvQ5MbtO0hwwqZUUtRimX80w4nubxAcv1RI3ng3LE92HTUT',
      'Accept': 'image/png',
    },
    body: jsonEncode({
      'cfg_scale': 15,
      'clip_guidance_preset': 'FAST_BLUE',
      'height': 512,
      'width': 512,
      'samples': 1,
      'steps': 150,
      'seed': 0,
      'style_preset': "3d-model",
      'text_prompts': [
        {
          'text': prompt,
          'weight': 1,
        }
      ],
    }),
  );

  if (response.statusCode == 200) {
    try {
      imageData = (response.bodyBytes);
      Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ImageSecPage(image: imageData),
          ));
      return response.bodyBytes;
    } on Exception {
      // ignore: use_build_context_synchronously
      return showErrorDialog('Failed to generate image', context);
    }
  } else {
    // ignore: use_build_context_synchronously
    return showErrorDialog('Failed to generate image', context);
  }
}
