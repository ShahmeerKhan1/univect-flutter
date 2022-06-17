import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:univect/utils/size_config.dart';
import 'package:univect/widgets/cotainer_tile.dart';
import 'package:univect/widgets/inputfield.dart';
import 'package:univect/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEmailFilled = false;
  bool isPassFilled = false;

  int? index = 0;
  bool ishowContent = false;

  bool loading1 = false;
  bool loading2 = false;
  bool loading3 = false;
  bool ishowButton = true;

  void timer() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        loading1 = true;
        index = index! + 1;
      });
      Timer(const Duration(seconds: 3), () {
        setState(() {
          loading2 = true;
          index = index! + 1;
        });
        Timer(const Duration(seconds: 3), () {
          setState(() {
            loading3 = true;
            index = index! + 1;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
       // alignment: Alignment.topCenter,
        height: 100 * SizeConfig.heightMultiplier,
        width: 100 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(0xFF28292D),
                  // Color(0xFF5B5D66),

            //  Colors.black,
             // Colors.black87,
                  Color(
                      0xFF28292D
                  ),
            //
            Color(
                0xFF28292D
            ).withOpacity(0.95),

              //  Color(0xff504d5e),
            ])),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/images/Reksio_small.png', fit: BoxFit.cover),
              Positioned(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 6 * SizeConfig.heightMultiplier,
                     //   color: Colors.blue,
                      ),
                      SvgPicture.asset('assets/images/logo.svg', color: Colors.white, width: 150),
                      // Image.asset(
                      //   'assets/images/univect.png', width: 200, height: 100,
                      // ),
                      // Image.asset('assets/images/logo.svg'),
                      Container(
                        height: 5 * SizeConfig.heightMultiplier,
                      //  color: Colors.pink,
                      ),
                      discoverDiviceWidget(),
                      Container(
                      //  color: Colors.blue,
                        height: 21 * SizeConfig.heightMultiplier,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Containertile(
                            isborder: false,
                            icon: 'assets/images/wifi.svg',
                            title: 'Status',
                            subTitle: 'Connected',
                          ),
                          SizedBox(width: 3 * SizeConfig.widthMultiplier),
                          Containertile(
                            isborder: false,
                            icon: 'assets/images/battery.svg',
                            title: 'Battery',
                            subTitle: '50%',
                          ),
                          SizedBox(width: 3 * SizeConfig.widthMultiplier),
                          Containertile(
                            isborder: true,
                            icon: 'assets/images/power_off.svg',
                            title: 'Device',
                            subTitle: 'Turn off',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4 * SizeConfig.heightMultiplier,
                      ),
                      Text(
                        'Login into your Univect account',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2.8 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5 * SizeConfig.widthMultiplier),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputField(
                                  icon: 'assets/images/person.svg',
                                  isCircular: true,
                                  isPass: false,
                                  controller: emailController,
                                  isSufix: false,
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "Required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (e) {
                                    setState(() {
                                      if (e.isNotEmpty) {
                                        isEmailFilled = true;
                                      } else {
                                        isEmailFilled = false;
                                      }
                                    });
                                  },
                                  sufixIcon: Icons.abc,
                                  label: '',
                                  hint: 'Login'),
                              SizedBox(
                                height: 2.5 * SizeConfig.heightMultiplier,
                              ),
                              InputField(
                                  icon: 'assets/images/lock.svg',
                                  isCircular: true,
                                  isPass: true,
                                  controller: passwordController,
                                  isSufix: false,
                                  onChanged: (e) {
                                    setState(() {
                                      if (e.isNotEmpty) {
                                        isPassFilled = true;
                                      } else {
                                        isPassFilled = false;
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty || value == null) {
                                      return "Required";
                                    } else {
                                      return null;
                                    }
                                  },
                                  sufixIcon: Icons.abc,
                                  label: '',
                                  hint: 'Password'),
                              SizedBox(
                                height: 2.5 * SizeConfig.heightMultiplier,
                              ),

                              PrimaryButton(
                                voidCallback: () {
                                  if (isEmailFilled &&
                                      isPassFilled &&
                                      ishowContent == false) {
                                    setState(() {
                                      ishowContent = true;
                                      timer();
                                      ishowButton = false;
                                    });
                                  }
                                },
                                isborder: isEmailFilled &&
                                    isPassFilled &&
                                    ishowButton,
                              ),

                              // LoginButton(
                              //   isborder: isEmailFilled && isPassFilled,
                              //   voidCallback: () {
                              //     if (isEmailFilled && isPassFilled) {
                              //       setState(() {
                              //         ishowContent = true;
                              //         timer();
                              //       });
                              //     }
                              //     // Get.to(() => LoginPage2());
                              //   },
                              // ),
                              ishowContent
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 2.5 *
                                              SizeConfig.heightMultiplier,
                                        ),
                                        Text(
                                          'Application loading',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(color: Colors.white, fontSize: 12.0),
                                        ),
                                        SizedBox(
                                          height:
                                              1.4 * SizeConfig.heightMultiplier,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            cotainerTile1(index!),
                                            // SizedBox(
                                            //     width: 2.5 *
                                            //         SizeConfig
                                            //             .widthMultiplier),
                                            cotainerTile2(index!),
                                            cotainerTile3(index!)
                                          ],
                                        ),
                                        Container(
                                         // color: Colors.blue,
                                          height:
                                              1.3 * SizeConfig.heightMultiplier,
                                        ),
                                        Container(
                                          height:
                                              6 * SizeConfig.heightMultiplier,
                                          width:
                                              90 * SizeConfig.widthMultiplier,
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                index == 3
                                                    ? ' 3 / 3'
                                                    : ' ${index!} / 3',
                                                style: const TextStyle(
                                                    color: Colors.white54),
                                              ),
                                              Text(
                                                index == 0
                                                    ? 'Checking permissions'
                                                    : index == 1
                                                        ? 'Checking enabled properties'
                                                        : index == 2
                                                            ? 'Checking connection to server'
                                                            : 'Connection error with the server',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              index == 2
                                                  ? SvgPicture.asset(
                                                      'assets/images/done.svg')
                                                  : index == 3
                                                      ? SvgPicture.asset(
                                                          'assets/images/checking.svg')
                                                      : SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                        //  color: Colors.blue,
                                          height: 11 *
                                              SizeConfig.heightMultiplier,
                                        ),
                                        Text(
                                          'Univect 2022. All rights reserved.',
                                          style: Theme.of(context).textTheme
                                              .caption
                                              ?.copyWith(color: Colors.white70, fontSize: 10.5)
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cotainerTile1(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.6 * SizeConfig.heightMultiplier,
        width: 15 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: loading1 ? Colors.blue : Colors.white12,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget cotainerTile2(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.6 * SizeConfig.heightMultiplier,
        width: 15 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: loading2 ? Colors.blue : Colors.white12,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget cotainerTile3(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 0.6 * SizeConfig.heightMultiplier,
        width: 15 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: loading3 ? Colors.blue : Colors.white12,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget discoverDiviceWidget() {
    return Container(
      height: 7.4 * SizeConfig.heightMultiplier,
      width: 60 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Discover our device',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white),
            ),
            SvgPicture.asset('assets/images/arrow.svg'),
            // Image.asset(
            //   'assets/images/arrow.png',
            // )
          ],
        ),
      ),
    );
  }

  void inputValidation() async {
    if (_formKey.currentState!.validate()) {
    } else {}
  }
}
