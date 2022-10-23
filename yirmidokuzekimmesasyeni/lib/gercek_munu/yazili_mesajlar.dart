// ignore_for_file: prefer_const_constructors

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yirmidokuzekimmesasyeni/AnaMenu/Ana_Menu.dart';
import 'package:yirmidokuzekimmesasyeni/buton/sesOynatma.dart';
import 'package:yirmidokuzekimmesasyeni/buton/yazili_ekran_buton.dart';

import '../resimlerin_pathleri/resim_path.dart';

class Yazili_Mesajlar_Ekrani extends StatefulWidget {
  const Yazili_Mesajlar_Ekrani({Key? key}) : super(key: key);

  @override
  State<Yazili_Mesajlar_Ekrani> createState() => _Yazili_Mesajlar_EkraniState();
}

class _Yazili_Mesajlar_EkraniState extends State<Yazili_Mesajlar_Ekrani> {
  double yazi_boyutu = 25;

  yaziArtis(int yaziindex) {
    if (yaziindex == yaziindex) {
      setState(() {
        yazi_boyutu = yazi_boyutu + 2;
      });
    }
  }

  yaziAzalis() {
    setState(() {
      yazi_boyutu--;
    });
  }

  late InterstitialAd interstitialyazibir;
  bool isLoadyazibir = false;
  initAddyazibir() {
    InterstitialAd.load(
        adUnitId:
            'ca-app-pub-3853518386312922/8551294585', //ca-app-pub-3940256099942544/1033173712
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoadeyazibir, onAdFailedToLoad: (error) {}));
  }

  onAdLoadeyazibir(InterstitialAd ad) {
    interstitialyazibir = ad;
    isLoadyazibir = true;
  }

  reklamGoster(int Resklam_NO) {
    if (isLoadyazibir) {
      switch (Resklam_NO) {
        case 15:
          return interstitialyazibir.show();
      }
    }
  }

  Future<void> _shareText(int yaziindex) async {
    try {
      Share.text('Yazılı Mesajı Paylaş',
          '${Yazili_Kutlama_Mesajlari[yaziindex]}', 'text/plain');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("state çalıştı-3");
    //initAddyazibir();
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Kutlama_Mesajlari/arkaplan.jpg"),
                  fit: BoxFit.fill)),
          child: Stack(
            children: [
              Positioned(
                top: 20.sp,
                left: 10.sp,
                right: 10.sp,
                height: 1000.sp,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.0.sp),
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: ListView.builder(
                    itemCount: Yazili_Kutlama_Mesajlari.length,
                    itemBuilder: (contex, index) {
                      reklamGoster(index);
                      if (index == 5) {
                        initAddyazibir();
                      } else {
                        initAddyazibir();
                      }

                      return Container(
                        margin: EdgeInsets.all(12.sp),
                        width: double.infinity,
                        height: 400.sp,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                yazili_mesajlar_ekrani_cirle_butonlar(
                                    on_Presed: () {
                                      sesleri_oynat
                                          .ses_CAL("resim/menugecis.mp3");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Ana_Menu_Total()),
                                      );
                                    },
                                    butonIcon: "resim/back.png"),
                                yazili_mesajlar_ekrani_cirle_butonlar(
                                  on_Presed: () {
                                    sesleri_oynat
                                        .ses_CAL("resim/fontayari.mp3");
                                    yaziArtis(index);
                                  },
                                  butonIcon: "resim/arti.png",
                                ),
                                yazili_mesajlar_ekrani_cirle_butonlar(
                                  on_Presed: () {
                                    sesleri_oynat.ses_CAL("resim/paylas.mp3");
                                    print(index);
                                    _shareText(index);
                                  },
                                  butonIcon: "resim/share.png",
                                ),
                                yazili_mesajlar_ekrani_cirle_butonlar(
                                  on_Presed: () {
                                    sesleri_oynat
                                        .ses_CAL("resim/fontayari.mp3");
                                    yaziAzalis();
                                  },
                                  butonIcon: "resim/kesi.png",
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(25.sp),
                              width: double.infinity,
                              height: 250.sp,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6.sp),
                                  borderRadius: BorderRadius.circular(25.sp),
                                  //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.sp)),
                                  border: Border.all(
                                      color: Colors.red, width: 2.sp)),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(18.sp),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      Yazili_Kutlama_Mesajlari[index],
                                      style: GoogleFonts.dosis(
                                        color: Colors.white,
                                        fontSize: yazi_boyutu.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
