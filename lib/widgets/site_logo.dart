import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Text('AK', style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: CustomColors.red,
                ),);
  }
}