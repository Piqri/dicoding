import 'package:apps_project/widget.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo(
      {super.key,
      required this.name,
      required this.campus,
      required this.major});

  final String name;
  final String campus;
  final String major;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text(name),
              text(campus),
              text(major),
            ],
          ),
        ),
      ),
    );
  }
}
