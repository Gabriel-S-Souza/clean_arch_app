import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final bool? enable;
  final String placeholder;
  final TextEditingController? controller;
  final String label;
  final Widget? suffix;
  final FocusNode? focus;
  final int maxLines;
  final Color bgColor;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final IconData? preffixIcon;
  final Function(String)? onChanged;
  final bool center;
  final String? errorMessageAsync;
  final void Function(String)? asyncValidate;
  final EdgeInsetsGeometry? containerPadding;
  final double? height;
  final bool readOnly;

  const TextFieldWidget({
    Key? key,
    this.errorMessageAsync,
    this.asyncValidate,
    this.enable,
    this.placeholder = '',
    this.controller,
    this.label = '',
    this.suffix,
    this.focus,
    this.center = false,
    this.maxLines = 1,
    this.bgColor = Colors.transparent,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    this.onEditingComplete,
    this.preffixIcon,
    this.onChanged, 
    this.containerPadding, 
    this.height, 
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
    inputFormatters: inputFormatters,
    controller: controller,
    keyboardType: textInputType,
    textInputAction: textInputAction,
    validator: validator,
    onChanged: onChanged,
    readOnly: readOnly,
    minLines: 1,
    textAlign: center ? TextAlign.center : TextAlign.left,
    focusNode: focus,
    textAlignVertical: TextAlignVertical.center,
    enabled: enable ?? true,
    maxLines: maxLines,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onEditingComplete: onEditingComplete,
    decoration: InputDecoration(
      contentPadding: height != null
          ? EdgeInsets.only(
            bottom: height! * 0.16)
          : null,
      hintText: placeholder,
      border: const OutlineInputBorder(borderSide: BorderSide()),
      labelText: label,
      fillColor: bgColor,
      filled: true,
      prefixIcon: preffixIcon != null 
          ? Icon(preffixIcon) 
          : null,
      suffixIcon: suffix,
      errorText: errorMessageAsync,
    ),
  );
}
