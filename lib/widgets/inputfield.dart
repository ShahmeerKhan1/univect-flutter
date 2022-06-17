import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/size_config.dart';

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  bool isPass;
  final IconData sufixIcon;
  final Function validator;
  final bool isSufix;
  final bool isCircular;
  final String icon;
  Function(String)? onChanged;

  final TextInputType textInputType;
  InputField(
      {Key? key,
      required this.controller,
      required this.isSufix,
      required this.validator,
      this.textInputType = TextInputType.text,
      this.isPass = false,
      required this.sufixIcon,
      required this.label,
      required this.hint,
      this.isCircular = false,
      required this.icon,
      this.onChanged})
      : super(key: key);

  @override
  _MyInputFieldState createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<InputField> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isCircular
          ? 6.4 * SizeConfig.heightMultiplier
          : 6.4 * SizeConfig.heightMultiplier,
      decoration: widget.isCircular
          ? BoxDecoration(
        color:
        Color(0xFF28292D),
     //   Color(0xFF28292D).withOpacity(0.2),
              border: Border.all(color: Color(0xFF807B99), width: 1.2),
              // color: widget.isCircular ? const Color(0xffF4F6F9) : Colors.white,
              borderRadius: BorderRadius.circular(10))
          : const BoxDecoration(
        color: Color(0xFF353440)
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 2 * SizeConfig.widthMultiplier, vertical: 0),
        child: TextFormField(
          onChanged: widget.onChanged!,
          //maxLines: 8,
          cursorColor: Colors.white,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.isPass,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          // maxLines: 3,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                widget.icon,
              ),
            ),
            contentPadding: EdgeInsets.only(
                top: 1.7 * SizeConfig.heightMultiplier, left: 10.0),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintStyle: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );
  }
}
