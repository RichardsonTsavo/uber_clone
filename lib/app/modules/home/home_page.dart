import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uber_clone/app/shared/widgets/banners_card/banners_card_widget.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, this.title = 'Home'});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final HomeStore store;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    store = Modular.get<HomeStore>();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/UberX.png",
                        width: constraints.maxWidth * 0.15,
                      ),
                      Text(
                        'Viagens',
                        style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Image.asset(
                          "assets/icon_1.png",
                          width: constraints.maxWidth * 0.1,
                        ),
                      ),
                      Text(
                        'Mercado',
                        style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              pageA(constraints: constraints),
              pageB(constraints: constraints)
            ],
          ),
        ),
      );
    });
  }

  Widget pageA({required BoxConstraints constraints}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed("/map/");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: constraints.maxWidth * 0.08,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.04,
                          ),
                          Text(
                            "Para onde?",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: constraints.maxWidth * 0.05),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Agora",
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Modular.to.pushNamed("/map/", arguments: "Mid");
              },
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.location_on_rounded),
              ),
              title: const Text("Midway Mall"),
              subtitle: const Text(
                "Av. Nevaldo Rocha, 3775 - Tirol, Natal",
                style: TextStyle(color: Colors.black54),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Modular.to.pushNamed("/map/", arguments: "Aero");
              },
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.location_on_rounded),
              ),
              title: const Text("Aeroporto Internacional de Natal"),
              subtitle: const Text(
                "Av. Dr. Ruy Pereira dos Santos, 3100",
                style: TextStyle(color: Colors.black54),
              ),
              trailing: const Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
            ),
            SizedBox(
              height: constraints.minHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sujestões",
                  style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Ver todas"),
                )
              ],
            ),
            SizedBox(
              height: constraints.maxHeight * 0.02,
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
                          const Text("Viagens")
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
                      const Text("Envios")
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
                      const Text("Reserve")
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Economize todos os dias",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.29,
              width: constraints.maxWidth,
              child: ListView.separated(
                itemCount: store.slides.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BannersCardWidget(
                  constraints: constraints,
                  url: store.slides[index]['url'],
                  titleDescription: store.slides[index]['title'],
                  subtitleDescription: store.slides[index]['subtitle'],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reserve com antecedência",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.29,
              width: constraints.maxWidth,
              child: ListView.separated(
                itemCount: store.banners.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BannersCardWidget(
                  constraints: constraints,
                  url: store.banners[index]['url'],
                  titleDescription: store.banners[index]['title'],
                  subtitleDescription: store.banners[index]['subtitle'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pageB({required BoxConstraints constraints}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Entregar agora",
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Row(
              children: [
                Text(
                  "${store.authController.user!.position!.adressName!.split(",")[0]},${store.authController.user!.position!.adressName!.split(",")[1]}",
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: constraints.maxWidth * 0.08,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.02,
                        ),
                        Text(
                          "Mercado, farmácia, etc.",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: constraints.maxWidth * 0.04),
                        )
                      ],
                    ),
                    Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: Colors.black,
                      size: constraints.maxWidth * 0.08,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/shopping-bag.png",
                        width: constraints.maxWidth * 0.15,
                      ),
                      Text(
                        "Mercado",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.036,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icon_3.png",
                        width: constraints.maxWidth * 0.15,
                      ),
                      Text(
                        "Pet",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.036,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icon_2.png",
                        width: constraints.maxWidth * 0.15,
                      ),
                      Text(
                        "Lojas",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.036,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lojas em destaque",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.23,
              width: constraints.maxWidth,
              child: ListView.separated(
                itemCount: store.stores.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: constraints.maxWidth * 0.36,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade100,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.1,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(store.stores[index]["url"]),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              store.stores[index]["title"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: constraints.maxWidth * 0.035,
                              ),
                            ),
                            Text(
                              store.stores[index]["time"],
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: constraints.maxWidth * 0.033,
                              ),
                            ),
                            Text(
                              "Ofertas disponiveis",
                              style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: constraints.maxWidth * 0.033,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ofertas diárias",
                style: TextStyle(fontSize: constraints.maxWidth * 0.05),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.3,
              width: constraints.maxWidth,
              child: ListView.separated(
                itemCount: store.bannerStore.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => BannersCardWidget(
                  constraints: constraints,
                  url: store.bannerStore[index]['url'],
                  titleDescription: store.bannerStore[index]['title'],
                  subtitleDescription: store.bannerStore[index]['time'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
