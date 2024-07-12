import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String? value;
  const CustomContainer({
    super.key,
    required this.text,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: h * 0.0625,
          width: w * 0.135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w * 0.008),
            border: Border.all(color: Colors.white, width: h * 0.0003),
            color: Colors.white.withOpacity(.065),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: h * .02, top: h * .015),
            child: Text(
              ' $text: ${value ?? ""}',
              style: TextStyle(
                  fontSize: w * 0.011,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
