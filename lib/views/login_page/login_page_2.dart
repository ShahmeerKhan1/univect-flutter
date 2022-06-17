import 'package:flutter/material.dart';
import 'package:univect/utils/size_config.dart';
import 'package:univect/widgets/cotainer_tile.dart';
import 'package:univect/widgets/inputfield.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LoginPage2> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Container(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black,
                Colors.black87,
                Color(
                  0xff303136,
                ),
                Color(
                  0xff303136,
                ),

                //  Color(0xff504d5e),
              ])),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Image.asset('assets/images/Reksio.png'),
                  Positioned(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5 * SizeConfig.heightMultiplier,
                          ),
                          Image.asset('assets/images/logo.png'),
                          SizedBox(
                            height: 5 * SizeConfig.heightMultiplier,
                          ),
                          discoverDiviceWidget(),
                          SizedBox(
                            height: 18 * SizeConfig.heightMultiplier,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Containertile(
                                isborder: false,
                                icon: 'assets/images/wifi.png',
                                title: 'Status',
                                subTitle: 'Connected',
                              ),
                              Containertile(
                                isborder: false,
                                icon: 'assets/images/battery.png',
                                title: 'Battery',
                                subTitle: '50%',
                              ),
                              Containertile(
                                isborder: true,
                                icon: 'assets/images/sign_out.png',
                                title: 'Device',
                                subTitle: 'Turn off',
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5 * SizeConfig.heightMultiplier,
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
                            height: 3 * SizeConfig.heightMultiplier,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5 * SizeConfig.widthMultiplier),
                            child: Column(
                              children: [
                                InputField(
                                    icon: 'assets/images/person.png',
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
                                    sufixIcon: Icons.abc,
                                    label: '',
                                    hint: 'Email'),
                                SizedBox(
                                  height: 3 * SizeConfig.heightMultiplier,
                                ),
                                InputField(
                                    icon: 'assets/images/lock.png',
                                    isCircular: true,
                                    isPass: true,
                                    controller: passwordController,
                                    isSufix: false,
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
                                  height: 3 * SizeConfig.heightMultiplier,
                                ),
                                // LoginButton(
                                //   isborder: false,
                                //   voidCallback: () {
                                //     Get.to(RootPage());
                                //   },
                                // ),
                                SizedBox(
                                  height: 0 * SizeConfig.heightMultiplier,
                                ),
                              ],
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
        ),
      ),
    );
  }

  Widget discoverDiviceWidget() {
    return Container(
      height: 7 * SizeConfig.heightMultiplier,
      width: 55 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Discover our device',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(color: Colors.white),
            ),
            Image.asset(
              'assets/images/arrow.png',
            )
          ],
        ),
      ),
    );
  }
}
