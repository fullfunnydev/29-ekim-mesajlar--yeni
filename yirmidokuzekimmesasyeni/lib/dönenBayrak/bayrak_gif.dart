import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bayrak_cicrle_Gif extends StatelessWidget {
  const Bayrak_cicrle_Gif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60.sp,
      child: Image.asset("resim/bayrak.gif", fit: BoxFit.fill),
    );
  }
}
