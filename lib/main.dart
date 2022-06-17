import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:univect/utils/size_config.dart';

import 'views/login_page/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
                theme: ThemeData(fontFamily: 'Ubuntu'),
                debugShowCheckedModeBanner: false,
                home: LoginPage());
          },
        );
      },
    );
  }
}
