import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final int index;

  const Question({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(13),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 2,
                  color: Colors.black,
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right:  width * 0.1,top:  width * 0.1),
            child: Text(
              "$index/25",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: width * 0.05, 
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
