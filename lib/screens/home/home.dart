import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 18, left: 16, right: 16),
            height: 333,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: greyCardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 17, bottom: 21, top: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rp 150.999,-',
                            style: extraBoldText26.copyWith(
                              color: primaryTextColor,
                            ),
                          ),
                          Text(
                            'Active until 22 Sep 2025',
                            style: mediumText12.copyWith(color: darkGreyColor),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 7,
                                  horizontal: 19,
                                ),
                                decoration: BoxDecoration(
                                  color: redButtonColor,
                                  borderRadius: BorderRadius.circular(16.5),
                                ),
                                child: Text(
                                  'Buy Package',
                                  style: mediumText12.copyWith(
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 18),
                              Text(
                                'Top-Up',
                                style: mediumText12.copyWith(color: blueColor),
                              ),
                              SizedBox(width: 19),
                              Text(
                                'Send Gift',
                                style: mediumText12.copyWith(color: blueColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircularPercentIndicator(
                              radius: 34.0,
                              lineWidth: 7.0,
                              animation: true,
                              percent: 0,
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: lightGreyColor,
                              progressColor: orangeColor,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Internet',
                                      style: boldText13.copyWith(
                                        color: darkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
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
