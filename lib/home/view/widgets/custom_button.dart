import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? 100,
        decoration: const BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(title, style: const TextStyle(fontSize: 18),),
        ),
      ),
    );
  }
}
