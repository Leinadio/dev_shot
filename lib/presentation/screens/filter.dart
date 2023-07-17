import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight - 100,
      width: double.infinity,
      child: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
