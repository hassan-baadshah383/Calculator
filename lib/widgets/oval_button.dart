import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool darkMode;
  const OvalButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.darkMode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 70,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                darkMode == true ? const Color(0xFF374352) : Colors.grey[400],
            boxShadow: [
              BoxShadow(
                color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                offset: const Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                  color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                  offset: const Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)
            ]),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: darkMode == true ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
