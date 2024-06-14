import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/constants/navbar_items.dart';
import 'package:flutter_portfolio/constants/skills_items.dart';
import 'package:flutter_portfolio/widgets/cv_mobile.dart';
import 'package:flutter_portfolio/widgets/drawer_mobile.dart';
import 'package:flutter_portfolio/widgets/header_mobile.dart';
import 'package:flutter_portfolio/widgets/site_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(navbarItems.length, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomColors.bgDark,
      endDrawer: DrawerMobile(onNavItemPressed: (int navIndex) {
        // call the function to scroll to the selected index
        scrollToSection(navIndex);
      },),
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(key: navbarKeys[0]),
            // HEADER SECTION
            HeaderMobile(
              onMenuPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
            ),
            // HERO SECTION
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0), 
              // height: ,
              constraints: const BoxConstraints(minHeight: 570.0,),color: CustomColors.bgDark,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // avatar image
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(
                          image: AssetImage("assets/profile_img.jpg"),
                          fit: BoxFit.cover,
                        ),
                        
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(170, 170)
                        ),
                        // filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                        border: Border.all(color: CustomColors.red, width: 10),
                      ),
                    ),
                  ),
                  
                  // intro text
                  const Text(
                    "Hi", style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w200,
                      color: CustomColors.white,
                    ),
                  ),
        
                  const Text(
                    "I'm Amit Khanal", style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.w500,
                    ),
        
                  ),
                  Text(
                    'A Flutter Developer'.toUpperCase(), style: TextStyle(
                      // fontStyle: uppercase,
                      fontSize: 26,
                      letterSpacing: 0.9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
    
    
                ],
              )
      
                     
            ),
            // CV SECTION
            Text("Lebensbahn", style: TextStyle(
              
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 60.0 ),
             child: Column(
                key: navbarKeys[1],
                children: [
                    CvMobile(isFirst: true, isLast: false, isPast: true, eventCard: Text("2017: Abitur in Nepal"),),
                     CvMobile(isFirst: false, isLast: false, isPast: true, eventCard: Text("2020: Studienkolleg bei der Hochschle Zittau/Görlitz"),),
                     CvMobile(isFirst: false, isLast: false, isPast: true, eventCard: Text("2021-aktuel: Bachelorstudium an der THM"),),
                  ],
                       ),
           ),
            // Tools SECTION
            Column(
              key: navbarKeys[2],
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text(
                    "What I can do".toUpperCase(), style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                ),
                Text(
                  "Tools".toUpperCase(), style: TextStyle(
                    fontSize: 20,
                    color: CustomColors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                for (int i = 0; i < toolsItems.length; i++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: CustomColors.bgLightDark,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Image.asset(
                        toolsItems[i]["img"],
                      width: 26.0
                      ),
                      title: Text(toolsItems[i]["title"]),
                   
                  )
                ),
        
                // SKILLS
                Wrap(
                  children: [
                    for (int i = 0; i < skillsItems.length; i++)
                      Container(
                        margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade200,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              skillsItems[i]["img"],
                              width: 26.0,
                            ),
                            const SizedBox(width: 5.0),
                            Text(skillsItems[i]["title"]),
                          ],
                        ),
                      )
                  ],
                )
              ],
            ),
            
          ],
        ),
      )

    );
  }

    void scrollToSection(int index) {
      final key = navbarKeys[index];
      Scrollable.ensureVisible(
        key.currentContext!, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeInOut,
      );
    }
}