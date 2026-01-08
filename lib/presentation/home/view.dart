import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            children: [
              TextField(
                controller: controller.textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input String",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.countString();
                },
                child: Text("Calculate"),
              ),
              Obx(() => Text("Sum: ${controller.sum.value}")),
            ],
          ),
        ),
      ),
    );
  }
}
