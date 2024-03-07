import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/const.dart';

class CustomTextField extends StatefulWidget {
  final double? containerHeight;
  final double? containerWidth;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hinttext;
  final bool isPassword;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextStyle? hinTxtstyle;
  final TextStyle? textStyle;
  final double? hintverticalPadding;
  final Widget? suffixIcon;
  final void Function(String)? onfieldSubmit;
  final TextInputType? keyboardtype;

  const CustomTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.labelText,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.containerHeight,
    this.hinttext,
    this.prefixIcon,
    this.borderRadius,
    this.hinTxtstyle,
    this.hintverticalPadding,
    this.containerWidth,
    this.textStyle,
    this.suffixIcon,
    this.keyboardtype,
    this.onfieldSubmit,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isSelected = true;

  bool isPasswordvisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widget.containerWidth ?? screenWidth * 0.8,
      height: widget.containerHeight,
      child: TextFormField(
        onFieldSubmitted: widget.onfieldSubmit,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: kblack),
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardtype,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kred,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: kred,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: kblack.withOpacity(0.5),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: widget.hinttext != null
                  ? widget.hintverticalPadding ?? 14
                  : 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
            borderSide: BorderSide(
              color: isSelected ? kred : kblack,
            ),
          ),
          hintText: widget.hinttext,
          hintStyle: widget.hinTxtstyle ??
              TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kblack.withOpacity(0.5),
                  fontSize: 12),
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: kblack.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
