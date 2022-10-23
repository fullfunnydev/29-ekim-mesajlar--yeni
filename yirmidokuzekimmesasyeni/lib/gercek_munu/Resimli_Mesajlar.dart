// ignore_for_file: prefer_const_constructors

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yirmidokuzekimmesasyeni/buton/sesOynatma.dart';
import 'package:yirmidokuzekimmesasyeni/buton/yazili_ekran_buton.dart';
import 'package:yirmidokuzekimmesasyeni/resimlerin_pathleri/resim_path.dart';

class Resimli_Mesajlar_Gosterim_Ekrani extends StatefulWidget {
  const Resimli_Mesajlar_Gosterim_Ekrani({Key? key}) : super(key: key);

  @override
  State<Resimli_Mesajlar_Gosterim_Ekrani> createState() =>
      _Resimli_Mesajlar_Gosterim_EkraniState();
}

class _Resimli_Mesajlar_Gosterim_EkraniState
    extends State<Resimli_Mesajlar_Gosterim_Ekrani> {
  int resimindex = 0;
  //---------------------------------------
  resimindexArtis() {
    setState(() {
      resimindex++;
    });
  }

  resimindexAzalis() {
    setState(() {
      resimindex--;
    });
  }

  //----------------------------------

  late InterstitialAd interstitialyazibir;
  bool isLoadyazibir = false;

  initAddyazibir() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3853518386312922/9577150387',
        //ca-app-pub-3940256099942544/1033173712
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoadeyazibir, onAdFailedToLoad: (error) {}));
  }

  onAdLoadeyazibir(InterstitialAd ad) {
    interstitialyazibir = ad;
    isLoadyazibir = true;
  }

  reklamGoster(int reklam_NO) {
    if (isLoadyazibir) {
      switch (reklam_NO) {
        case 30:
          return interstitialyazibir.show();
        case 60:
          return interstitialyazibir.show();
        case 90:
          return interstitialyazibir.show();
      }
    }
  }

//-------------------------------------------------------
  Future<void> resimi_paylas_method() async {
    try {
      final ByteData bytes =
          await rootBundle.load(Bayram_29_Kutlama_Mesajlari[resimindex]);
      await Share.file('Bu Resmi Paylaş', 'esys.png',
          bytes.buffer.asUint8List(), 'image/png',
          text: '29 Ekim Cumhuriyet Bayramımız Kutlu Olsun');
    } catch (e) {
      print('error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.teal,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Text(
                        "${resimindex + 1}/${Bayram_29_Kutlama_Mesajlari.length}",
                        style: GoogleFonts.dosis(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20.sp),
                width: double.infinity,
                height: 800.sp,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.sp),
                    image: DecorationImage(
                        image:
                            AssetImage(Bayram_29_Kutlama_Mesajlari[resimindex]),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: EdgeInsets.all(14.sp),
                child: Container(
                  width: double.infinity,
                  height: 110.sp,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      yazili_mesajlar_ekrani_cirle_butonlar(
                        butonIcon: "resim/arrowleft.gif",
                        on_Presed: () {
                          sesleri_oynat.ses_CAL("resim/resimilerigeri.mp3");
                          resimindexAzalis();
                          if (resimindex == -1) {
                            resimindex = Bayram_29_Kutlama_Mesajlari.length - 1;
                          }
                          initAddyazibir();
                          reklamGoster(resimindex);
                          print("resim index -------->${resimindex}");
                          print("arrow left");
                        },
                      ),
                      yazili_mesajlar_ekrani_cirle_butonlar(
                        butonIcon: "resim/share.png",
                        on_Presed: () {
                          sesleri_oynat.ses_CAL("resim/paylas.mp3");
                          print("resim index -------->${resimindex}");
                          print("arrow left");
                          resimi_paylas_method();
                        },
                      ),
                      yazili_mesajlar_ekrani_cirle_butonlar(
                        butonIcon: "resim/arrowright.gif",
                        on_Presed: () {
                          sesleri_oynat.ses_CAL("resim/resimilerigeri.mp3");
                          resimindexArtis();
                          if (resimindex ==
                              Bayram_29_Kutlama_Mesajlari.length) {
                            resimindex = 0;
                          }
                          initAddyazibir();
                          reklamGoster(resimindex);
                          print("resim index -------->${resimindex}");
                          print("arrow left");
                        },
                      )
                    ],
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
