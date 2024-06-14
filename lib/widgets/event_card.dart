import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class EventCard extends StatelessWidget {
  final child;
  const EventCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(color: CustomColors.red),
      child: Text(child)
    );
  }
}