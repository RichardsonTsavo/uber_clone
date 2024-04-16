import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/modules/services/services_store.dart';

class ServicesPage extends StatefulWidget {
  final String title;
  const ServicesPage({super.key, this.title = 'Serviços'});
  @override
  ServicesPageState createState() => ServicesPageState();
}

class ServicesPageState extends State<ServicesPage> {
  final ServicesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: constraints.maxWidth * 0.08),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              Text(
                "Vá a qualquer lugar",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: constraints.maxWidth / 4,
                        width: constraints.maxWidth / 3.5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/UberX.png",
                              width: constraints.maxWidth * 0.2,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.01,
                            ),
                            Text(
                              "Viagens",
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.036,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.green.shade600,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Promo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: constraints.maxWidth / 4,
                    width: constraints.maxWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/package.png",
                          width: constraints.maxWidth * 0.2,
                        ),
                        Text(
                          "Envios",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.036,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxWidth / 4,
                    width: constraints.maxWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/reserve.png",
                          width: constraints.maxWidth * 0.2,
                        ),
                        Text(
                          "Reserve",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.036,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Text(
                "Peça o que precisar",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: constraints.maxWidth / 4,
                    width: constraints.maxWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/shopping-bag.png",
                          width: constraints.maxWidth * 0.13,
                        ),
                        Text(
                          "Mercado",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.036,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxWidth / 4,
                    width: constraints.maxWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon_3.png",
                          width: constraints.maxWidth * 0.13,
                        ),
                        Text(
                          "Pet",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.036,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxWidth / 4,
                    width: constraints.maxWidth / 3.5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon_2.png",
                          width: constraints.maxWidth * 0.13,
                        ),
                        Text(
                          "Lojas",
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.036,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
