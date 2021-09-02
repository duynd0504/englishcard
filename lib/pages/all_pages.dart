import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/models/englishtoday.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';

class AllWords extends StatelessWidget {
  final List<EnglishToday> words;
  const AllWords({Key? key, required this.words}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.pop(context);
            },
            child: Image.asset(AppAssets.leftArrow),
          ),
        ),
        body: ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? AppColors.primaryColor
                      : AppColors.secondColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(
                    words[index].noun!,
                    style: index % 2 == 0
                        ? AppStyles.h4
                        : AppStyles.h4.copyWith(color: AppColors.textColor),
                  ),
                  subtitle: Text(
                    words[index].quote ??
                        'Think of all the beauty still left around you and be happy',
                    style: index % 2 == 0
                        ? AppStyles.h5
                        : AppStyles.h5.copyWith(color: AppColors.textColor),
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: words[index].isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              );
            }));
  }
}
