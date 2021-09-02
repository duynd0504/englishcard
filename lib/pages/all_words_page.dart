import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/models/englishtoday.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';

class AllWordsPage extends StatelessWidget {
  final List<EnglishToday> words;
  AllWordsPage({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: InkWell(
        onTap: () {
          //return widgets not define , i will define later
          print(words.map((e) => e.quote).toList());
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            children: words
                .map((e) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 3),
                                blurRadius: 3)
                          ],
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: AutoSizeText(
                        e.noun ?? '',
                        style: AppStyles.h3.copyWith(shadows: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2, 3),
                            blurRadius: 4,
                          ),
                        ]),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
