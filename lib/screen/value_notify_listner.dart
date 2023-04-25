import 'package:flutter/material.dart';

class NotifierListnerScreen extends StatelessWidget {
  NotifierListnerScreen({super.key});
  final ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Center(child: Text("Statless use as statful"))),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ValueListenableBuilder(
          valueListenable: toggle,
          builder: (context, value, child) {
            return TextFormField(
              obscureText: toggle.value,
              decoration: InputDecoration(
                  hintText: "Password",
                  suffix: InkWell(
                      onTap: (() {
                        toggle.value = !toggle.value;
                      }),
                      child: Icon(toggle.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility))),
            );
          },
        ),
        Center(
            child: ValueListenableBuilder(
                valueListenable: _count,
                builder: ((context, value, child) {
                  return Text(
                    _count.value.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                })))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _count.value++;
          print(_count.value.toString());
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
