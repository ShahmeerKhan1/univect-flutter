import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:univect/utils/size_config.dart';

class Containertile extends StatelessWidget {
  String? title;
  String? subTitle;
  String? icon;
  bool? isborder;
  Containertile(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.isborder});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5 * SizeConfig.heightMultiplier,
      width: 28 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        border: isborder! ? Border.all(color: Color(0xFF636873), width: 1.2) : null,
        borderRadius: BorderRadius.circular(14),
        color: isborder!
            ?
            // null
            // : Color(0xFF40434A)
         Color(0xFF28292D)
       // // Colors.black12
             : Color(0xFF40434A)
      //   const Color(
      //   0xff303136,
      // )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 4 * SizeConfig.heightMultiplier,
              width: 8 * SizeConfig.widthMultiplier,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isborder! ? Color(0xFF40434A) : Color(0xFF2C2E33)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon!),
              ),
            ),
            SizedBox(
              width: 2 * SizeConfig.widthMultiplier,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white54,
                      fontSize: 1.22 * SizeConfig.textMultiplier),
                ),
                SizedBox(
                  height: 0.2 * SizeConfig.heightMultiplier,
                ),
                Text(
                  subTitle!,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 1.2 * SizeConfig.textMultiplier,
                        color: Colors.white,
                    fontWeight: FontWeight.bold
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
