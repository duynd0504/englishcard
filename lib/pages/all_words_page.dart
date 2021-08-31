import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/models/englishtoday.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';

class AllWordPage extends StatefulWidget {
  final List<EnglishToday> words;
  const AllWordPage({Key? key, required this.words}) : super(key: key);

  @override
  _AllWordPageState createState() => _AllWordPageState();
}

class _AllWordPageState extends State<AllWordPage> {
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
      body: Container(
        child: Text('hi'),
      ),
    );
  }
}
