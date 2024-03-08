import 'package:cash_withdraw/config/custom_colors.dart';
import 'package:cash_withdraw/modules/screens/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double boxSize = 291.0;
  double margin = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: boxSize,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                    image: const AssetImage("lib/assets/pure.jpg"),
                    height: boxSize - 50,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: boxSize - 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color.fromRGBO(235, 232, 88, 0.4),
                        Color.fromRGBO(144, 218, 65, 0.7),
                        Color.fromRGBO(64, 206, 44, 0.7),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: boxSize - 100,
                  left: margin,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SvgPicture.asset(
                      "lib/assets/icon_green_bg_logo.svg",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          fields(context),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Text("Version 1.0"),
          ),
        ],
      ),
    );
  }

  Widget fields(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sign in to AFEX Branch Service",
              style: TextStyle(fontSize: 22),
            ),
            Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 18.0, bottom: 15.0),
                  child: Text(
                    "Email or username",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 35,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft),
                          child: const Text("Forgot Password?"),
                          onPressed: () {
                            onPressForgotPassword();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      const Size.fromHeight(50)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(CustomColors.primary),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  setState(() {});
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => const TabBarPage(),
                      builder: (context) => const DashboardPage(),
                    ),
                  );
                },
                child: const Text("Sign In"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: CustomColors.primary,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                onPressed: () async {},
                child: const Text(
                  "Contact Support",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onPressForgotPassword() {}
}
