import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:uber_clone/app/modules/profile/profile_store.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({super.key, this.title = 'ProfilePage'});
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Modular.to.pushNamedAndRemoveUntil(
                        "/login/", ModalRoute.withName("/"));
                  },
                  child: SizedBox(
                    height: constraints.maxHeight * 0.05,
                    child: const Icon(Icons.close),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.authController.user!.name!,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.1,
                      ),
                    ),
                    CircleAvatar(
                      radius: constraints.maxWidth * 0.1,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: AssetImage(
                        store.authController.user!.imageUrl!,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black,
                          size: constraints.maxWidth * 0.04,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          store.authController.user!.star!,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: constraints.maxWidth / 5,
                              width: constraints.maxWidth / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.accessibility_new,
                                    color: Colors.black,
                                    size: constraints.maxWidth * 0.1,
                                  ),
                                  Text(
                                    "Ajuda",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.036,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: constraints.maxWidth / 5,
                              width: constraints.maxWidth / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.payments_sharp,
                                    color: Colors.black,
                                    size: constraints.maxWidth * 0.1,
                                  ),
                                  Text(
                                    "Pagamento",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.036,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: constraints.maxWidth / 5,
                              width: constraints.maxWidth / 3.5,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.approval_rounded,
                                    color: Colors.black,
                                    size: constraints.maxWidth * 0.1,
                                  ),
                                  Text(
                                    "Atividade",
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.036,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.03,
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 6,
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: constraints.maxWidth * 0.20,
                                width: constraints.maxWidth - 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Checagem de segurança",
                                            style: TextStyle(
                                                fontSize: constraints.maxWidth *
                                                    0.035),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.6,
                                            child: Text(
                                              "Use os recusos que podem ajudar a tornar as viagens seguras",
                                              style: TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.028),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CircularStepProgressIndicator(
                                        totalSteps: 6,
                                        currentStep: 4,
                                        height: constraints.maxWidth * 0.15,
                                        width: constraints.maxWidth * 0.15,
                                        roundedCap: (_, isSelected) =>
                                            isSelected,
                                        child: Center(
                                            child: Text(
                                          "4/6",
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxWidth * 0.05),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.settings,
                          ),
                          title: Text("Configurações"),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.email,
                          ),
                          title: Text("Mensagens"),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            CupertinoIcons.gift_fill,
                          ),
                          title: Text("Enviar um presente"),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text(
                              "Ganhe dinheiro dirigindo ou fazendo entregas"),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.business_center,
                          ),
                          title: Text("Configure o perfil corporativo"),
                        ),
                        const ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.favorite,
                          ),
                          title: Text("Lojas Favoritas"),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
