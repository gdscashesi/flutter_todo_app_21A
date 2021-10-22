

import 'package:flutter/material.dart';
import 'package:todo/utils/constants.dart';

class BackgroundPainter extends CustomPainter{
  late double circleSize;

  BackgroundPainter(this.circleSize);



  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;


    Paint paint1 = Paint()
    ..color = primaryColor;

    Paint paint2 = Paint()
      ..color = secondaryColor;


    //drawing first circle at the back
    canvas.drawCircle(Offset(width, height * 0.12), width * 0.7, paint1);


    canvas.drawCircle(Offset(width * 0.2, height * 0.16), width * circleSize, paint2);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}