import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double slideValue = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        //lam mat duong vien do bong
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Your Control',
            style: AppStyles.h3.copyWith(
              color: AppColors.textColor,
              fontSize: 36,
            ),
          ),
        ),
        leading: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              child: Text(
                'How much a number word at once',
                style: AppStyles.h4.copyWith(
                    color: AppColors.lightGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Text(
              '${slideValue.toInt()}',
              style: AppStyles.h1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 150,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
                value: slideValue,
                min: 5,
                max: 100,
                divisions: 95,
                activeColor: AppColors.primaryColor,
                inactiveColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    slideValue = value;
                  });
                }),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                'Slide to set',
                style: AppStyles.h5.copyWith(
                  color: AppColors.textColor,

                  //ontWeight: FontWeight.bold
                ),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
