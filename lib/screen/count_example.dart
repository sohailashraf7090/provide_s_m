import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provide_s_m/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
    final countprovider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 0), (Timer) {
      countprovider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countprovider = Provider.of<CountProvider>(context, listen: true);
    print("build");
    return Scaffold(
      appBar: AppBar(title: const Text("CountExample")),
      body: Consumer(
        builder: (context, value, child) {
          return Center(
              child: Text(
            countprovider.count.toString(),
            style: const TextStyle(fontSize: 50),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          countprovider.setCount();
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
