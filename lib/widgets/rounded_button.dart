import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback onPressed;
  final bool darkMode;
  const RoundedButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    required this.darkMode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                darkMode == true ? const Color(0xFF374352) : Colors.grey[300],
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
          child: text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                  ),
                )
              : Icon(
                  icon,
                  color: iconColor,
                  size: 35,
                ),
        ),
      ),
    );
  }
}
