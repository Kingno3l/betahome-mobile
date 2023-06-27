import 'package:flutter/material.dart';

class Vision extends StatelessWidget {
  const Vision({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Our Vision",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
              "  •	We aim to create value-chain opportunities through our platform for different sectors of the economy ranging from art and creative industry, interior designers, technicians, artisan, carpenter and furniture-makers, real-estate marketers and developers, semi-skilled person and vendors who produce or sell the raw materials needed to help every Nigerian home/office realized and achieve their dreams of living and working in a serene environ, even with their limited budget and spending power,  Hereby becoming  a global one-stop service powered community for hiring or sourcing professionally qualified artisans for all works."),
        ],
      ),
    );
  }
}
