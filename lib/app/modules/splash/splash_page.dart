import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/splash/splash_store.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({super.key, this.title = 'SplashPage'});
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "U",
                style: TextStyle(
                    color: Colors.white, fontSize: constraints.maxWidth * 0.15),
              ).animate(delay: 600.ms).slideY().flipH(),
              Text(
                "b",
                style: TextStyle(
                    color: Colors.white, fontSize: constraints.maxWidth * 0.15),
              ).animate(delay: 700.ms).slideY().flipH(),
              Text(
                "e",
                style: TextStyle(
                    color: Colors.white, fontSize: constraints.maxWidth * 0.15),
              ).animate(delay: 800.ms).slideY().flipH(),
              Text(
                "r",
                style: TextStyle(
                    color: Colors.white, fontSize: constraints.maxWidth * 0.15),
              )
                  .animate(
                    delay: 900.ms,
                    onComplete: (controller) {
                      Future.delayed(const Duration(seconds: 1)).then(
                        (value) => Modular.to.pushReplacementNamed("/login/"),
                      );
                    },
                  )
                  .slideY()
                  .flipH(),
            ],
          ),
        ),
      );
    });
  }
}
