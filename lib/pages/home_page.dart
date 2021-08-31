import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/models/englishtoday.dart';
import 'package:flutter_ecomerience_21/packages/quote/quote.dart';
import 'package:flutter_ecomerience_21/packages/quote/quote_model.dart';
import 'package:flutter_ecomerience_21/pages/all_words_page.dart';
import 'package:flutter_ecomerience_21/pages/control_page.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_fonts.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';
import 'package:flutter_ecomerience_21/values/shared_key.dart';
import 'package:flutter_ecomerience_21/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  late List<EnglishToday> words = [];
  String quote_firstheader = Quotes().getRandom().content!;

  List<int> fixedListRandom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();

    int count = 1;

    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  //lay danh sach

  EnglishToday getQuotes(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(noun: noun, quote: quote?.content, id: quote?.id);
  }

  final GlobalKey<ScaffoldState> _scafolKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
    getEnglishToday();
  }

  getEnglishToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int len = prefs.getInt(SharedKey.counterControl) ?? 5;
    List<String> newList = [];
    List<int> rans = fixedListRandom(len: len, max: nouns.length);
    rans.forEach((index) {
      newList.add(nouns[index]);
    });
    setState(() {
      words = newList.map((e) => getQuotes(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scafolKey,
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        //lam mat duong vien do bong
        elevation: 0,
        title: Text(
          'English Today',
          style: AppStyles.h3.copyWith(
            color: AppColors.textColor,
            fontSize: 36,
          ),
        ),
        leading: InkWell(
          onTap: () {
            _scafolKey.currentState?.openDrawer();
          },
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24),
              height: size.height * 1 / 10,
              //padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                '"$quote_firstheader"',
                style: AppStyles.h5.copyWith(
                  fontSize: 12.0,
                  color: AppColors.textColor,
                ),
              ),
            ),
            Container(
              height: size.height * 2 / 3,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    String firstLetter =
                        words[index].noun != null ? words[index].noun! : '';
                    firstLetter = firstLetter.substring(0, 1);

                    String leftLetter =
                        words[index].noun != null ? words[index].noun! : '';
                    leftLetter = leftLetter.substring(1, leftLetter.length);

                    String quotedefault =
                        "Think of all the beauty still left around you and be happy";
                    String quote = words[index].quote != null
                        ? words[index].quote!
                        : quotedefault;
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            //tạo bóng cho nền item page view
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                offset: Offset(3, 6),
                                blurRadius: 6,
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: Image.asset(AppAssets.heart),
                            ),
                            RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: firstLetter,
                                style: TextStyle(
                                  fontFamily: FontFamily.sen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 80,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(3, 6),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                children: [
                                  TextSpan(
                                    text: leftLetter,
                                    style: TextStyle(
                                      fontFamily: FontFamily.sen,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: AutoSizeText(
                                '"$quote"',
                                maxFontSize: 25,
                                minFontSize: 12,
                                style: AppStyles.h4.copyWith(
                                  letterSpacing: 1,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            //indicator
            _currentIndex >= 5
                ? buildShowMore(context)
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: size.height * 1 / 12,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return buildIndicator(
                                  index == _currentIndex, size);
                            }),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            setState(() {
              getEnglishToday();
              quote_firstheader = Quotes().getRandom().content!;
            });
          },
          child: Container(child: Image.asset(AppAssets.exchange))),
      drawer: Drawer(
        child: Container(
          color: AppColors.lightBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 16),
                child: Text(
                  'Your mind',
                  style: AppStyles.h3.copyWith(color: AppColors.textColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AppButton(
                    lable: 'Favorites',
                    onTap: () {
                      print('favorites');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: AppButton(
                    lable: 'Your Control',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ControlPage()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildIndicator(bool isActive, Size size) {
  return AnimatedContainer(
    duration: Duration(microseconds: 300),
    curve: Curves.bounceInOut,
    height: 11,
    margin: const EdgeInsets.symmetric(horizontal: 12),
    width: isActive ? size.width * 1 / 5 : 35,
    decoration: BoxDecoration(
        color: isActive ? AppColors.lightBlue : AppColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ]),
  );
}

Widget buildShowMore(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    alignment: Alignment.centerLeft,
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      elevation: 4,
      color: AppColors.primaryColor,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AllWordPage(
                      words: [],
                    )),
          );
        },
        splashColor: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(24)),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              'Show more',
              style: AppStyles.h5,
            )),
      ),
    ),
  );
}
