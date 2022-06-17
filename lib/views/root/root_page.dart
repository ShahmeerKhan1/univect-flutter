import 'package:flutter/material.dart';
import 'package:univect/utils/size_config.dart';
import 'package:univect/views/root/component/all_content_page.dart';

import '../../widgets/cotainer_tile.dart';
import '../../widgets/inputfield.dart';
import '../../widgets/login_button.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              child: PageView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AllContent(
                          index: index,
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
