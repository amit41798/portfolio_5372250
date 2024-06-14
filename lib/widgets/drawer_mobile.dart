import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/navbar_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemPressed});
  final Function(int) onNavItemPressed;

  @override
  Widget build(BuildContext context) {
    return 
    Drawer(
        backgroundColor: CustomColors.bgDark,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: IconButton(onPressed:() {
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close,),),
              ),
            ),

            for (int i = 0; i < navbarIcons.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0),

                onTap: () {
                  onNavItemPressed(i);
                },
                leading: Icon(navbarIcons[i]),
                title: Text(navbarItems[i]),
                titleTextStyle: const TextStyle(
                  color: CustomColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              )
          ],
        ),
      );
  }
}