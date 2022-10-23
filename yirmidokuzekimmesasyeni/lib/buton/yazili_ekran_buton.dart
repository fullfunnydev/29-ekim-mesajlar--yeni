import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class yazili_mesajlar_ekrani_cirle_butonlar extends StatelessWidget {
  Function on_Presed;
  String butonIcon;

  yazili_mesajlar_ekrani_cirle_butonlar({
    Key? key,
    required this.on_Presed,
    required this.butonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => on_Presed(),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
        radius: 35.sp,
        child: Image.asset(butonIcon, fit: BoxFit.contain),
      ),
    );
  }
}
