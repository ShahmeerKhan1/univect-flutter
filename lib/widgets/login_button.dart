import 'package:flutter/material.dart';
import 'package:univect/utils/size_config.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({Key? key, required this.voidCallback, required this.isborder})
      : super(key: key);
  bool? isborder;

  VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.5 * SizeConfig.heightMultiplier,
      width: 90 * SizeConfig.widthMultiplier,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: isborder == false
              ?
          Color(
              0xFF28292D
          ).withOpacity(0.2)
           //   Color(0xFF5B5D66)
        //   const Color(
        //     0xFF28292D,
        // )
              : Colors.blue, // background
          onPrimary: Colors.white,
          side: isborder == false
              ? const BorderSide(
                  width: 1.2,
                  color: Color(0xFF807B99),
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), // foreground
        ),
        onPressed: voidCallback,
        child: Text(
          'Login',
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: isborder == false ? Colors.white54 : Colors.white,
              fontWeight:
                  isborder == false ? FontWeight.w500 : FontWeight.w700,
          fontSize: 15.0),
        ),
      ),
    );
  }
}
