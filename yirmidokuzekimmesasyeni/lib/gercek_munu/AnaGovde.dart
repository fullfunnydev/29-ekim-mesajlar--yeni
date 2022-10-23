// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yirmidokuzekimmesasyeni/gercek_munu/Atat%C3%BCrk_Resimleri.dart';
import 'package:yirmidokuzekimmesasyeni/gercek_munu/Resimli_Mesajlar.dart';
import 'package:yirmidokuzekimmesasyeni/gercek_munu/hakkinda_gosterim_ekrani.dart';
import 'package:yirmidokuzekimmesasyeni/gercek_munu/yazili_mesajlar.dart';

class Ana_Govde extends StatefulWidget {
  int butonindexdegeri = 0;
  Ana_Govde({Key? key, required this.butonindexdegeri}) : super(key: key);

  @override
  State<Ana_Govde> createState() => _Ana_GovdeState();
}

class _Ana_GovdeState extends State<Ana_Govde> {
  butonindexegore_Ekrani_Getir(int btnindexdegeri) {
    switch (btnindexdegeri) {
      case 0:
        return Resimli_Mesajlar_Gosterim_Ekrani();
      case 1:
        return Yazili_Mesajlar_Ekrani();
      case 2:
        return Atatrrk_Resimleri_Gosterim_Ekrani();
      case 3:
        return Hakkinda_Goster_web_wiv();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
          child: butonindexegore_Ekrani_Getir(widget.butonindexdegeri),
        )));
  }
}
