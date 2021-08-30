import 'package:flutter/material.dart';
import 'package:flutter_ecomerience_21/values/app_asserts.dart';
import 'package:flutter_ecomerience_21/values/app_colors.dart';
import 'package:flutter_ecomerience_21/values/app_styles.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        //lam mat duong vien do bong
        elevation: 0,
        title: Text(
          'Your Control',
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
    );
  }
}
