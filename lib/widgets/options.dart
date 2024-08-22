import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onTap;  

  const Option({
    super.key,
    required this.text,
    required this.width,
    required this.onTap,  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        margin: const EdgeInsets.only(bottom: 18, left: 25, right: 25),
        width: width,
        height: width * 0.16,
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
