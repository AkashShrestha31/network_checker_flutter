import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  final String? message;
  final IconData? icon;
  final Color? color;
  const TextIconWidget({Key? key, required this.message, required this.icon, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width,
        color: color!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.04,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Text(
              message!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textScaleFactor: 1.1,
            ),
          ],
        ));
  }
}
