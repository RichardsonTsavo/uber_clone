import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/historic/historic_module.dart';
import 'package:uber_clone/app/modules/home/home_module.dart';
import 'package:uber_clone/app/modules/profile/profile_module.dart';
import 'package:uber_clone/app/modules/services/services_module.dart';
import 'package:uber_clone/app/modules/start/start_store.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({super.key, this.title = 'StartPage'});
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: store.pageController,
          children: [
            HomeModule(),
            ServicesModule(),
            HistoricModule(),
            ProfileModule(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                  0, 3), // mudando a posição da sombra verticalmente
            ),
          ]),
          child: Observer(builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    store.changePage(0);
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: store.index == 0 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "Inicio",
                        style: TextStyle(
                          color: store.index == 0 ? Colors.black : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    store.changePage(1);
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.apps_sharp,
                        color: store.index == 1 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "Opções",
                        style: TextStyle(
                          color: store.index == 1 ? Colors.black : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    store.changePage(2);
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bookmark,
                        color: store.index == 2 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "Atividade",
                        style: TextStyle(
                          color: store.index == 2 ? Colors.black : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    store.changePage(3);
                  },
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person,
                        color: store.index == 3 ? Colors.black : Colors.grey,
                      ),
                      Text(
                        "Conta",
                        style: TextStyle(
                          color: store.index == 3 ? Colors.black : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
