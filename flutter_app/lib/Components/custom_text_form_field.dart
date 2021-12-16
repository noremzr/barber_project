import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final double width;
  final String iconPath;
  final Color? backGroundColor;
  final Color? svgIconColor;
  final double borderRadius;
  final String placeholder;
  final double height;
  final bool passwordTextType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    required this.placeholder,
    required this.width,
    required this.iconPath,
    this.height = 30,
    this.passwordTextType = false,
    this.svgIconColor = Colors.transparent,
    this.backGroundColor = Colors.transparent,
    this.borderRadius = 0,
    this.validator,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: passwordTextType,
        decoration: InputDecoration(
          filled: backGroundColor != null ? true : false,
          fillColor: backGroundColor,
          prefixIcon: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                iconPath,
                color: svgIconColor,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
          labelText: placeholder,
        ),
        validator: validator,
      ),
    );
  }
}
// border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(borderRadius),
//             ),
//           ),