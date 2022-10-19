import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key, 
    this.onPressed, 
    this.backgroundColor, 
    required this.label, 
    this.enable = true, 
    this.isLoading = false}) : super(key: key);
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final bool enable;
  final bool isLoading;

  bool get _enable => enable && !isLoading;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: _enable
            ? onPressed
            : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            _enable
              ? backgroundColor
              : backgroundColor?.withAlpha(60) ?? Colors.grey,
          ),
        ),
        child: !isLoading
            ? Text(
              label,
              style: const TextStyle(
                color:Colors.white,
              ) 
            )
            : const SizedBox(
              height: 28,
              width: 28,
              child: CircularProgressIndicator(),
            ),
      ),
    );
}