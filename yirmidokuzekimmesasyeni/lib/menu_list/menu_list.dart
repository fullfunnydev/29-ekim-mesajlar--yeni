// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yirmidokuzekimmesasyeni/buton/sesOynatma.dart';

import '../gercek_munu/AnaGovde.dart';

List itemList = [
  "Resimli Mesajlar",
  "Yazılı Mesajlar",
  "Atatürk Resimleri",
  "29 Ekim Hakkında",
];

class Menuler_RYAH extends StatefulWidget {
  @override
  State<Menuler_RYAH> createState() => _Menuler_RYAHState();
}

class _Menuler_RYAHState extends State<Menuler_RYAH> {
  late InterstitialAd resimshow;
  bool isLoadyazibir = false;

  initAddyazibir() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3853518386312922/3107396217',
        //ca-app-pub-3940256099942544/1033173712
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoadeyazibir, onAdFailedToLoad: (error) {}));
  }

  onAdLoadeyazibir(InterstitialAd ad) {
    resimshow = ad;
    isLoadyazibir = true;
  }

  @override
  Widget build(BuildContext context) {
    initAddyazibir();
    double _w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(20.sp),
      child: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30.sp),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 4,
          itemBuilder: (BuildContext c, int listindex) {
            return AnimationConfiguration.staggeredList(
              position: listindex,
              delay: Duration(milliseconds: 1500),
              child: SlideAnimation(
                duration: Duration(milliseconds: 1500), //2000
                curve: Curves.easeIn,
                horizontalOffset: 30.sp,
                verticalOffset: 300.0.sp,
                child: FlipAnimation(
                  duration: Duration(milliseconds: 3000), //3500
                  curve: Curves.easeInCubic,
                  flipAxis: FlipAxis.y,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _w / 20.sp),
                    height: _w / 8.sp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(13.0.sp),
                          child: Text(itemList[listindex],
                              style: GoogleFonts.anekMalayalam(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: InkWell(
                            onTap: () {
                              initAddyazibir();
                              sesleri_oynat.ses_CAL("resim/menugecis.mp3");
                              if (isLoadyazibir) {
                                resimshow.show();
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Ana_Govde(butonindexdegeri: listindex)),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 30.sp,
                              child: Image.asset(
                                "resim/next.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.sp),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1.sp),
                          blurRadius: 40.sp,
                          spreadRadius: 10.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
