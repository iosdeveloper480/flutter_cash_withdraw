import 'dart:ui';

import 'package:cash_withdraw/modules/tab_bar_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.hardEdge,
          children: [
            const Image(
              image: AssetImage("lib/assets/pure.jpg"),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: fields(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget fields(BuildContext context) {
    return Center(
      child: shadowContainer(
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
          child: Wrap(
            runSpacing: 20,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User Name',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 1));
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabBarPage(),
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shadowContainer(Widget content) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: content,
    );
  }
}
