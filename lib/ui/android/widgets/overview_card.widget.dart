import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewCardWidget extends StatelessWidget {
  final Color backGroundColor;
  final String title;
  final String quantity;

  const OverviewCardWidget({
    required this.backGroundColor,
    required this.title,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(4, 7))
            ],
            borderRadius: BorderRadius.circular(8),
            color: backGroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  quantity,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )
              ]),
        ));
  }
}
