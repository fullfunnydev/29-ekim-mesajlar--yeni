import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yirmidokuzekimmesasyeni/hikaye_gster/hikaye_view.dart';
import 'package:yirmidokuzekimmesasyeni/menu_list/menu_list.dart';

import '../dönenBayrak/bayrak_gif.dart';

class Ana_Menu_Total extends StatefulWidget {
  const Ana_Menu_Total({Key? key}) : super(key: key);

  @override
  State<Ana_Menu_Total> createState() => _Ana_Menu_TotalState();
}

class _Ana_Menu_TotalState extends State<Ana_Menu_Total> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(12.sp),
              height: 350.sp,
              width: double.infinity,
              color: Colors.transparent,
              child: main_stroy_view(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                //height: 690.sp,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Bayrak_cicrle_Gif(),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(60.sp),
                          ),
                        ),
                        child: Menuler_RYAH(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
