// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tekerleme/EkranSabitleri.dart';
import 'package:tekerleme/Tekerleme_Gosterici.dart';
import 'package:tekerleme/data.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: EkranYaziFontLink.AppBarBorderRadius,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_DMgKk1.json'),
                ),
                Text('Diksiyon Tekerlemeleri',style: TextStyle(
                  color: Colors.deepOrange,fontFamily: 'YeniYaziStilim',fontSize: 30,
                ),)
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatefulWidget {
   AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: TekerlemeListele.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (context,a,b)=>TekerlemeGostericiEkran(
                       tekerlemeler: TekerlemeListele[index],
                      ))
                  );
                },
                child: Text('${TekerlemeListele[index].Harf}',style: EkranYaziFontLink.AnaEkrandakiHarflerinYaziStili,))
          //Text('${TekerlemeListele[index].Tekerleme}'),
        ),
      );
        });
  }
}
