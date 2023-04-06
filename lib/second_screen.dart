import 'package:app_buttons/component/button.dart';
import 'package:app_buttons/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/label.txt"))!;
    print("Model Status $res");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleButton(
                text: 'upload video',
                onTap: () {},
              ),
              const SizedBox(
                height: 10.0,
              ),
              CircleButton(
                text: 'Detect',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThirdScreen(),
                      ));
                },
              ),
            ]),
      ),
    );
  }
}
