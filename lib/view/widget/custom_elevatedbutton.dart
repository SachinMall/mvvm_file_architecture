import 'package:flutter/material.dart';

import '../../utils/const.dart';

class CommonElevatedButton extends StatefulWidget {
  final String name;
  final double buttonwidth;
  final double? buttonheight;
  final String? preifxicon;
  final TextStyle textStyle;
  final VoidCallback ontap;
  final Color alternatecolor;
  final Color bordercolor;
  final bool isloading;
  const CommonElevatedButton(
      {super.key,
      required this.name,
      required this.buttonwidth,
      this.preifxicon,
      this.buttonheight,
      required this.textStyle,
      required this.ontap,
      this.alternatecolor = kred,
      this.bordercolor = Colors.transparent,
      this.isloading = false});

  @override
  State<CommonElevatedButton> createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: ElevatedButton(
        onPressed: widget.ontap,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          elevation: 0,
          fixedSize: Size(
              screenWidth * widget.buttonwidth, widget.buttonheight ?? 42.0),
          backgroundColor: widget.alternatecolor ?? kwhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: widget.bordercolor,
            ),
          ),
        ),
        child: 
        widget.isloading ? CircleAvatar() :
        
         Text(widget.name,
            style: widget.textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
