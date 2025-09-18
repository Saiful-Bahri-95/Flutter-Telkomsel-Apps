import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:telkomsel_app/screens/home/components/card_info_home_1.dart';
import 'package:telkomsel_app/screens/home/components/card_info_home_2.dart';
import 'package:telkomsel_app/screens/home/components/recommended_card.dart';
import 'package:telkomsel_app/screens/home/components/whats_new_card.dart';
import 'package:telkomsel_app/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cards = [CardInfoHome1(), CardInfoHome2()];

  int currentIndex = 0;

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

    Widget indicator(index) {
      return Container(
        width: currentIndex == index ? 18 : 5,
        height: 5,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: currentIndex == index
              ? whiteColor
              : whiteColor.withOpacity(0.7),
        ),
      );
    }

    Widget cardInfo() {
      int index = -1;
      return Column(
        children: [
          CarouselSlider(
            items: cards.map<Widget>((card) => Container(child: card)).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              height: 333,
              enableInfiniteScroll: false,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cards.map((e) {
              index += 1;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget recommendedForYou() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, top: 45, right: 16),
            child: Row(
              children: [
                Text('Recommended For You', style: extraBoldText18),
                Spacer(),
                Text(
                  'See all',
                  style: regulerText12.copyWith(color: blueColor),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                RecommendedCard(
                  title: 'Kuota Ketengan Until...',
                  date: '29 Sept 2025 08:08:34',
                  price: 'Rp 19.000',
                ),
                SizedBox(width: 16),
                RecommendedCard(
                  title: 'Kuota Ketengan Belajar',
                  date: '31 Sept 2025 18:38:34',
                  price: 'Rp 4.000',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget whatsNew() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 14),
            child: Text('What\'s New', style: extraBoldText18),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                WhatsNewCard(
                  image: 'assets/images/image-vidio.png',
                  text: 'Package',
                  title: 'Vidio Digital Premier',
                ),
                SizedBox(width: 16),
                WhatsNewCard(
                  image: 'assets/images/image-poin.png',
                  text: 'POIN',
                  title: 'Undi-Undi Heppy',
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(children: [recommendedForYou(), whatsNew()]),
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
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(children: [header(), cardInfo(), content()]),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
