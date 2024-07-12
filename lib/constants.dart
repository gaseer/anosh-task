import 'package:flutter/material.dart';

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(colors: [Colors.blueGrey, Colors.blue]),
  borderRadius: BorderRadius.circular(30),
);

final kInnerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(30),
  color: const Color(0xFF222323),
  border: Border.all(color: Colors.white),
);

const customTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
);
