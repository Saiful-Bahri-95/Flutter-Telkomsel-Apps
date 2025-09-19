import 'package:flutter/material.dart';
import 'package:telkomsel_app/themes.dart';

// Custom widget to display info cards on the Home screen
class CardInfoHome2 extends StatelessWidget {
  const CardInfoHome2({super.key});

  @override
  Widget build(BuildContext context) {
    // Helper function to build a single info row (icon + text + subtitle + arrow)
    Widget listCardInfo(
      String icon, // asset path for the icon
      String title, // main title
      IconData? iconHelp, // optional help icon
      String subtitle, // small description below the title
      String text, // right-side text
    ) {
      return Row(
        children: [
          // Left side: main icon
          Expanded(flex: 1, child: Image.asset(icon, width: 36)),

          // Right side: text content + optional icons
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Title + optional help icon + Spacer + right text + chevron
                  Row(
                    children: [
                      Text(
                        title,
                        style: boldText13.copyWith(color: primaryTextColor),
                      ),
                      // Show help icon only if provided
                      if (iconHelp != null) Icon(iconHelp, size: 15),

                      Spacer(), // pushes the next widgets to the far right

                      Text(
                        text,
                        style: regulerText13.copyWith(color: primaryTextColor),
                      ),
                      Icon(Icons.chevron_right, color: primaryTextColor),
                    ],
                  ),

                  // Bottom row: Subtitle text
                  Text(
                    subtitle,
                    style: regulerText10.copyWith(color: primaryTextColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    // Main card container with white background and rounded corners
    return Container(
      margin: EdgeInsets.only(top: 18, left: 16, right: 16),
      padding: EdgeInsets.only(left: 17, top: 29, right: 17),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),

      // Card content: multiple listCardInfo items separated by SizedBox
      child: Column(
        children: [
          listCardInfo(
            'assets/icons/icon-phone.png',
            'Voice',
            null,
            'You have no quota',
            'Not yet purchased',
          ),
          SizedBox(height: 39),
          listCardInfo(
            'assets/icons/icon-sms.png',
            'SMS',
            null,
            'You have no quota',
            'Not yet purchased',
          ),
          SizedBox(height: 39),
          listCardInfo(
            'assets/icons/icon-wallet.png',
            'Monetary',
            Icons.help_outline_rounded,
            'You have no monetary balance',
            'Not yet purchased',
          ),
        ],
      ),
    );
  }
}
