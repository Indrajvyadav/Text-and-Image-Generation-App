import 'package:ai_generative_app/constants/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ImageSecPage extends StatefulWidget {
  final Uint8List image;
  const ImageSecPage({super.key, required this.image});

  @override
  State<ImageSecPage> createState() => _ImageSecPageState();
}

class _ImageSecPageState extends State<ImageSecPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: secColor),
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: const Text(
          'Image',
          style: TextStyle(
              color: secColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 40),
          child: Text(
            "Here's the awesome image we generated for you!",
            style: TextStyle(
              fontSize: 22,
              color: secColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: 340,
            height: 550,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.memory(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}

class RoundedContainerWithIcon extends StatelessWidget {
  final IconData icon;

  const RoundedContainerWithIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0XFF9DB2BF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 30,
          color: Colors.black, // Change the icon color as needed
        ),
      ),
    );
  }
}
