import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key, 
    this.onPressed, 
    this.backgroundColor, 
    required this.label, 
    this.enable}) : super(key: key);
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool? enable;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            enable != null && enable!
                ? backgroundColor
                : backgroundColor?.withAlpha(100) ?? Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color:Colors.white,
          ) 
        ),
      ),
    );
}