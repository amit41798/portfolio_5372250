import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onMenuPressed, this.onSiteLogoPressed});
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSiteLogoPressed;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
            margin: const EdgeInsets.fromLTRB(60, 5, 20, 5),
            height: 60,
            width: double.maxFinite,
            child: Row(
              children: [
                SiteLogo(
                  onPressed: onSiteLogoPressed,
                ),
                const Spacer(),
                IconButton(
                  onPressed: onMenuPressed,
                  icon: const Icon(Icons.menu)
                )
              ],),
          );
  }
}