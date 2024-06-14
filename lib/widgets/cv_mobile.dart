import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';
import 'package:flutter_portfolio/widgets/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CvMobile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  
  const CvMobile({required this.isFirst, required this.isLast, required this.isPast, this.eventCard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,

        // decoration
        beforeLineStyle: LineStyle(
          color: CustomColors.red,
        ),
        indicatorStyle: IndicatorStyle(
          width: 35,
          color: CustomColors.red
        ),
        endChild:  EventCard(child: eventCard)
      )


    );
    
  }
}