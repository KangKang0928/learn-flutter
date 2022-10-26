import 'package:flutter/material.dart';

class AspectRatioPage extends StatefulWidget {
  const AspectRatioPage({Key? key}) : super(key: key);

  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("使用AspectRadio实现固定宽高比"),
        ),
        body: BodyPart());
  }
}

class BodyPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        color: Colors.red,
        child: RichText(text: const TextSpan(text: """
Widget build(BuildContext context) {
  return AspectRatio(
    aspectRatio: 3 / 2,
    child: Container(
      color: Colors.red,
      child: RichText(
          text: const TextSpan(
              text: "brown", style: TextStyle(fontWeight: FontWeight.bold))),
    ),
  );
}
""", style: TextStyle(fontWeight: FontWeight.bold))),
      ),
    );
  }
}
