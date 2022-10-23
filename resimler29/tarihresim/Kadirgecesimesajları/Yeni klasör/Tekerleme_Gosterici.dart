// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tekerleme/EkranSabitleri.dart';
import 'package:tekerleme/data.dart';

class TekerlemeGostericiEkran extends StatefulWidget {
  TumTekerlemeler tekerlemeler;
  TekerlemeGostericiEkran({required this.tekerlemeler, Key? key})
      : super(key: key);

  @override
  State<TekerlemeGostericiEkran> createState() =>
      _TekerlemeGostericiEkranState();
}

class _TekerlemeGostericiEkranState extends State<TekerlemeGostericiEkran> {
  int Sayiindex = 0;
  @override
  Widget build(BuildContext context) {
    var genislik = MediaQuery.of(context).size.width;
    var yukseklik = MediaQuery.of(context).size.height;
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
          ),
          //backgroundColor: Color(0xffac1515),
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            child: Column(
              children: [
                CircleAvatar(radius: 70,
                backgroundColor: Colors.transparent,
                child: Lottie.network('${widget.tekerlemeler.LottieLink}',options: LottieOptions(
                  enableMergePaths: true,
                )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${Sayiindex+1}/${widget.tekerlemeler.Tekerlemesi.length}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontFamily: 'YeniYaziStilim'
                    ),
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(112),
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

                    child: Text('${widget.tekerlemeler.Tekerlemesi[Sayiindex]}',style: TextStyle(color: Colors.yellowAccent,
                        fontFamily: 'YeniYaziStilim',
                    fontSize: 28
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ilerigericontainer(
                      ileriGeriFonskiyonu: (){
                        setState(() {
                          Sayiindex--;
                          if(Sayiindex==-1){
                            Sayiindex=0;
                          }
                        });
                      },
                      genislik: genislik,
                      yukseklik: yukseklik,
                      renk: EkranYaziFontLink.ContainerRenk,
                      KonteynirBorderRadius:
                      EkranYaziFontLink.ContainerBorderRadius,
                      child: Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_nM4B6n.json',),
                    ),
                    ilerigericontainer(
                        ileriGeriFonskiyonu: (){
                          setState(() {
                            Sayiindex++;
                            if(Sayiindex==widget.tekerlemeler.Tekerlemesi.length){
                              Sayiindex=0;
                            }
                          });
                        },
                        KonteynirBorderRadius: EkranYaziFontLink.ContainerBorderRadius,
                        renk: EkranYaziFontLink.ContainerRenk,
                        child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_ShJB4F.json'),
                        genislik: genislik,
                        yukseklik: yukseklik)
                  ],
                )
              ],

            ),
          ),
        ),
      ),
    );
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
      onTap: (){
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
