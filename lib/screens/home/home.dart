import 'package:flutter/material.dart';
import 'package:telkomsel_app/screens/home/components/card_info_home_1.dart';
import 'package:telkomsel_app/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget headerContent(String icon, String text) {
      return Container(
        margin: EdgeInsets.only(top: 15, right: 5),
        padding: EdgeInsets.fromLTRB(8, 5, 2, 5),
        decoration: BoxDecoration(
          color: darkRedColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            Image.asset(icon, width: 10),
            SizedBox(width: 7),
            Text(text, style: boldText13.copyWith(color: whiteColor)),
            Icon(Icons.chevron_right_rounded, color: whiteColor),
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hi Saiful',
                  style: boldText15.copyWith(color: whiteColor),
                ),
                Spacer(),
                Icon(Icons.qr_code_rounded, color: whiteColor, size: 28),
                SizedBox(width: 12),
                Image.asset('assets/icons/icon-email.png', width: 32),
                SizedBox(width: 12),
                Image.asset('assets/icons/icon-help.png', width: 25),
              ],
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  '083762988221',
                  style: boldText15.copyWith(color: whiteColor),
                ),
                SizedBox(width: 7),
                Image.asset('assets/icons/icon-plus.png', width: 14),
              ],
            ),
            Row(
              children: [
                headerContent('assets/icons/icon-love.png', '19 Poin'),
                headerContent('assets/icons/icon-star.png', 'Daily Check In'),
              ],
            ),
          ],
        ),
      );
    }

    Widget cardInfo() {
      return Column(children: [CardInfoHome()]);
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.topRight,
            stops: [0.1, 0.9],
            colors: [redColor, yellowColor],
          ),
        ),
        child: ListView(children: [header(), cardInfo()]),
      ),
    );
  }
}
