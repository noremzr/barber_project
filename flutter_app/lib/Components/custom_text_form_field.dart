import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final double width;
  final String iconPath;
  final Color? backGroundColor;
  final Color? svgIconColor;
  final double borderRadius;
  final double marginTop;
  final double marginLeft;
  final double marginRight;
  final double marginDown;
  final String placeholder;
  final String sufixIconPath;
  final double height;
  final bool passwordTextType;
  final String? Function(String?)? validator;
  final void Function()? sufixFunction;
  final TextEditingController? controller;

  const CustomTextFormField({
    required this.placeholder,
    required this.width,
    this.iconPath = '',
    this.sufixIconPath = '',
    this.height = 30,
    this.passwordTextType = false,
    this.svgIconColor = Colors.transparent,
    this.backGroundColor = Colors.transparent,
    this.borderRadius = 0,
    this.validator,
    this.sufixFunction,
    this.controller,
    this.marginTop = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginDown = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginDown),
      child: SizedBox(
        width: width,
        height: height,
        child: TextFormField(
          controller: controller,
          obscureText: passwordTextType,
          decoration: InputDecoration(
            filled: backGroundColor != null ? true : false,
            fillColor: backGroundColor,
            suffixIcon: SizedBox(
              height: height,
              child: sufixIconPath.isNotEmpty
                  ? InkWell(
                      onTap: sufixFunction,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          sufixIconPath,
                          color: svgIconColor,
                        ),
                      ),
                    )
                  : const Padding(padding: EdgeInsets.all(0)),
            ),
            prefixIcon: SizedBox(
              height: height,
              child: iconPath.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        iconPath,
                        color: svgIconColor,
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(0),
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
      ),
    );
  }
}
