import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientAppBarView extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100.0);
  bool automaticallyImplyLeading = true;
  GradientAppBarView({
    super.key,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(152.0),
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        toolbarHeight: 100,
        titleSpacing: 30,
        title: SvgPicture.asset(
          "lib/assets/icon_white_bg_logo.svg",
          height: 55,
          width: 55,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                Color.fromRGBO(235, 232, 88, 1),
                Color.fromRGBO(144, 218, 65, 1),
                Color.fromRGBO(64, 206, 44, 0.8784313725490196),
              ],
            ),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}
