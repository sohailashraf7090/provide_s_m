import 'package:flutter/material.dart';
import 'package:provide_s_m/provider/example._two_provider.dart';
import 'package:provider/provider.dart';

class ExampleTwoo extends StatefulWidget {
  const ExampleTwoo({super.key});

  @override
  State<ExampleTwoo> createState() => _ExampleTwooState();
}

class _ExampleTwooState extends State<ExampleTwoo> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleTwoProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("ExampeTwo"))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: ((val) {
                  provider.setValue(val);
                }));
          }),
          Consumer(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.yellow.withOpacity(provider.value),
                    child: const Center(child: Text("Container 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(provider.value),
                    child: const Center(child: Text("Container 2")),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
