// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tekerleme/EkranSabitleri.dart';
import 'package:tekerleme/data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class TekerlemeGostericiEkran extends StatefulWidget {
  TumTekerlemeler tekerlemeler;
  TekerlemeGostericiEkran({required this.tekerlemeler, Key? key}): super(key: key);

  @override
  State<TekerlemeGostericiEkran> createState() =>
      _TekerlemeGostericiEkranState();
}



class _TekerlemeGostericiEkranState extends State<TekerlemeGostericiEkran> {
  int Sayiindex = 0;

  late BannerAd _bannerAd;
  bool _isLoaded = false;


  @override
  void initState() {
    super.initState();
    _initBannerAd();
    initAdd();

  }

  _initBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-6944246532242899/6286315947',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {},
        ),
        request: AdRequest());
    _bannerAd.load();
  }


  late InterstitialAd interstitialAd;


  void initAdd() {
    InterstitialAd.load(
        adUnitId:'ca-app-pub-6944246532242899/3471578208',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: (error) {}));
  }



  void onAdLoaded(InterstitialAd ad) {
    interstitialAd=ad;
  }



  @override
  Widget build(BuildContext context) {
    var genislik = MediaQuery.of(context).size.width;
    var yukseklik = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          //backgroundColor: Color(0xffac1515),
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.transparent,
                  child: Lottie.network('${widget.tekerlemeler.LottieLink}',
                      options: LottieOptions(
                        enableMergePaths: true,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${Sayiindex + 1}/${widget.tekerlemeler.Tekerlemesi.length}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontFamily: 'YeniYaziStilim'),
                    ),
                  ],
                ),
                Column(

                  children: [
                    Text('Reklamsız Versiyon için Alttaki Resme Dokun',style: EkranYaziFontLink.urlYonlendirmestil),
                    Text(''),
                    GestureDetector(
                      onTap: (){
                        print('Gesture Çalşıyor');
                        urlgit('https://play.google.com/store/apps/details?id=com.diksiyontekerleme.tekerleme');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                      radius: 40,
                        child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_ZWEJL5.json'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(230),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Text('${widget.tekerlemeler.Tekerlemesi[Sayiindex]}',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontFamily: 'YeniYaziStilim',
                            fontSize: 28)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ilerigericontainer(
                      ileriGeriFonskiyonu: () {
                        setState(() {
                          Sayiindex--;
                          if (Sayiindex == -1) {
                            Sayiindex = 0;
                            interstitialAd.show();
                          }
                            print('sayi index= $Sayiindex');
                        });
                      },
                      genislik: genislik,
                      yukseklik: yukseklik,
                      renk: EkranYaziFontLink.ContainerRenk,
                      KonteynirBorderRadius:
                          EkranYaziFontLink.ContainerBorderRadius,
                      child: Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_nM4B6n.json',
                      ),
                    ),
                    ilerigericontainer(
                        ileriGeriFonskiyonu: () {
                          setState(() {
                            Sayiindex++;
                            if (Sayiindex ==
                                widget.tekerlemeler.Tekerlemesi.length) {
                              Sayiindex = 0;
                            interstitialAd.show();
                            }if(Sayiindex&2==0){

                              interstitialAd.show();
                            }
                          });
                        },
                        KonteynirBorderRadius:
                            EkranYaziFontLink.ContainerBorderRadius,
                        renk: EkranYaziFontLink.ContainerRenk,
                        child: Lottie.network(
                            'https://assets8.lottiefiles.com/packages/lf20_ShJB4F.json'),
                        genislik: genislik,
                        yukseklik: yukseklik)
                  ],
                ),
                Container(
                  color: Colors.red,
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(
                    ad: _bannerAd,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future urlgit(String link) async {
    if(await canLaunch(link)){
      launch(link);
    }else{
      throw 'Geçersiz Url';
    }

  }

}






class ilerigericontainer extends StatelessWidget {
  Widget child;
  Color renk;
  BorderRadiusGeometry KonteynirBorderRadius;
  final double genislik;
  final double yukseklik;
  Function ileriGeriFonskiyonu;
  ilerigericontainer({
    required this.ileriGeriFonskiyonu,
    required this.KonteynirBorderRadius,
    required this.renk,
    required this.child,
    required this.genislik,
    required this.yukseklik,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ileriGeriFonskiyonu();
      },
      child: Container(
        child: child,
        margin: EdgeInsets.all(20),
        width: genislik / 3,
        height: yukseklik / 10,
        decoration: BoxDecoration(
          color: renk,
          borderRadius: KonteynirBorderRadius,
        ),
      ),
    );
  }
}
