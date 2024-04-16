import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/login/login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, this.title = 'LoginPage'});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Uber Clone\nEscolha um usuário",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: constraints.maxWidth * 0.07),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    store.login(0);
                    store.aninControllerM.forward(from: 0);
                    store.aninControllerM.repeat();
                  },
                  child: CircleAvatar(
                    radius: constraints.maxWidth * 0.15,
                    backgroundImage: AssetImage(store.users[0]["imageUrl"]),
                  )
                      .animate(
                        autoPlay: false,
                        onInit: (controller) =>
                            store.aninControllerM = controller,
                      )
                      .shimmer(
                        duration: const Duration(
                          seconds: 1,
                        ),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    store.login(1);
                    store.aninControllerF.forward(from: 0);
                    store.aninControllerF.repeat();
                  },
                  child: CircleAvatar(
                    radius: constraints.maxWidth * 0.15,
                    backgroundImage: AssetImage(store.users[1]["imageUrl"]),
                  )
                      .animate(
                        autoPlay: false,
                        onInit: (controller) =>
                            store.aninControllerF = controller,
                      )
                      .shimmer(
                        duration: const Duration(
                          seconds: 1,
                        ),
                      ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
