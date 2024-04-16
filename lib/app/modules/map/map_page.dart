import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:interactive_bottom_sheet/interactive_bottom_sheet.dart';
import 'package:uber_clone/app/modules/map/map_store.dart';

import '../../shared/utils/utils.dart';

class MapPage extends StatefulWidget {
  final String title;
  final String? pathSelected;
  const MapPage({super.key, this.title = 'MapPage', this.pathSelected});
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final MapStore store = Modular.get();

  @override
  void initState() {
    store.currentMarkes.clear();
    if (widget.pathSelected != null) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        store.changeBottomSheetStage(1);
        store.pathSelected = widget.pathSelected!;
        Future.delayed(const Duration(seconds: 2)).then(
          (value) => store.changeBottomSheetStage(2),
        );
      });
    } else {
      store.iniData();
    }

    super.initState();
  }

  @override
  void dispose() {
    store.currentMarkes.clear();
    store.currentPolyline = Polyline(
      points: [],
      color: Colors.black,
    );
    store.pathSelected = "";
    store.containBottomSheet = true;
    store.bottomSheetStage = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              FlutterMap(
                mapController: store.mapController,
                options: MapOptions(
                  initialZoom: 17,
                  initialCenter: store.authController.user!.position!.latLng!,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                    subdomains: const [
                      'mt0',
                      'mt1',
                      'mt2',
                      'mt3',
                    ],
                  ),
                  Observer(builder: (_) {
                    return PolylineLayer(polylines: [store.currentPolyline]);
                  }),
                  Observer(builder: (_) {
                    return MarkerLayer(markers: store.currentMarkes);
                  })
                ],
              ),
              Positioned(
                top: constraints.maxHeight * 0.05,
                left: constraints.maxWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: CircleAvatar(
                    radius: constraints.maxWidth * 0.05,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: constraints.maxWidth * 0.06,
                    ),
                  ),
                ),
              )
            ],
          ),
          bottomSheet: Observer(
            builder: (context) => store.containBottomSheet
                ? InteractiveBottomSheet(
                    draggableAreaOptions: DraggableAreaOptions(
                      topBorderRadius: 15,
                      shadows: [],
                      indicatorColor: Colors.grey.shade300,
                    ),
                    options: const InteractiveBottomSheetOptions(
                      maxSize: 0.97,
                      initialSize: 0.35,
                      minimumSize: 0.35,
                      snapList: [0.35, 0.97],
                      snap: true,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Observer(builder: (context) {
                        return store.bottomSheetStage == 0
                            ? Column(children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Center(
                                    child: Text(
                                      'Planeje sua proxima viagem',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: constraints.maxWidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        visualDensity: VisualDensity.compact,
                                        backgroundColor: Colors.grey.shade200,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.access_time_filled,
                                            size: constraints.maxWidth * 0.04,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Partir agora",
                                            style: TextStyle(
                                                fontSize: constraints.maxWidth *
                                                    0.035),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: constraints.maxWidth * 0.04,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        visualDensity: VisualDensity.compact,
                                        backgroundColor: Colors.grey.shade200,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: constraints.maxWidth * 0.04,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Para mim",
                                            style: TextStyle(
                                                fontSize: constraints.maxWidth *
                                                    0.035),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: constraints.maxWidth * 0.04,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: constraints.maxHeight * 0.1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Icon(
                                                      Icons.adjust_rounded),
                                                  Expanded(
                                                    child: Container(
                                                      color: Colors.black,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        color: Colors.black,
                                                        width: constraints
                                                                .maxWidth *
                                                            0.04,
                                                        height: constraints
                                                                .maxWidth *
                                                            0.04,
                                                      ),
                                                      Container(
                                                        color: Colors.white,
                                                        width: constraints
                                                                .maxWidth *
                                                            0.015,
                                                        height: constraints
                                                                .maxWidth *
                                                            0.015,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 25,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.6,
                                                  ),
                                                  const Divider(),
                                                  SizedBox(
                                                    height: 25,
                                                    width:
                                                        constraints.maxWidth *
                                                            0.6,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: CircleAvatar(
                                        radius: constraints.maxWidth * 0.05,
                                        backgroundColor: Colors.grey.shade400,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: constraints.maxWidth * 0.06,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  onTap: () {
                                    store.changeBottomSheetStage(1);
                                    store.pathSelected = "Mid";
                                    Future.delayed(const Duration(seconds: 2))
                                        .then(
                                      (value) =>
                                          store.changeBottomSheetStage(2),
                                    );
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    child:
                                        const Icon(Icons.location_on_rounded),
                                  ),
                                  title: const Text("Midway Mall"),
                                  subtitle: const Text(
                                    "Av. Nevaldo Rocha, 3775 - Tirol, Natal",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                                const Divider(),
                                ListTile(
                                  onTap: () {
                                    store.changeBottomSheetStage(1);
                                    store.pathSelected = "Aero";
                                    Future.delayed(const Duration(seconds: 2))
                                        .then(
                                      (value) =>
                                          store.changeBottomSheetStage(2),
                                    );
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    child:
                                        const Icon(Icons.location_on_rounded),
                                  ),
                                  title: const Text(
                                      "Aeroporto Internacional de Natal"),
                                  subtitle: const Text(
                                    "Av. Dr. Ruy Pereira dos Santos, 3100",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ])
                            : store.bottomSheetStage == 1
                                ? Column(children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Center(
                                        child: Text(
                                          'Procurando opções',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                constraints.maxWidth * 0.05,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const LinearProgressIndicator(),
                                    ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        color: Colors.grey.shade200,
                                      ),
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: 15,
                                      itemBuilder: (context, index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: constraints.maxWidth * 0.17,
                                            width: constraints.maxWidth * 0.18,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Builder(builder: (context) {
                                              return Image.asset(
                                                "assets/UberX.png",
                                                width:
                                                    constraints.maxWidth * 0.2,
                                                color: Colors.grey.shade200,
                                              )
                                                  .animate(
                                                    onInit: (controller) async {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  300));
                                                      controller.repeat(
                                                          period:
                                                              const Duration(
                                                                  seconds: 1));
                                                    },
                                                    autoPlay: false,
                                                  )
                                                  .shimmer(color: Colors.black);
                                            }),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 10,
                                                  width: constraints.maxWidth *
                                                      0.35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                )
                                                    .animate(
                                                      onInit:
                                                          (controller) async {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    300));
                                                        controller.repeat(
                                                            period:
                                                                const Duration(
                                                                    seconds:
                                                                        1));
                                                      },
                                                      autoPlay: false,
                                                    )
                                                    .shimmer(
                                                        color: Colors.black),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: constraints.maxWidth *
                                                      0.25,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                )
                                                    .animate(
                                                      onInit:
                                                          (controller) async {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    300));
                                                        controller.repeat(
                                                            period:
                                                                const Duration(
                                                                    seconds:
                                                                        1));
                                                      },
                                                      autoPlay: false,
                                                    )
                                                    .shimmer(
                                                        color: Colors.black),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: constraints.maxWidth *
                                                      0.13,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                  ),
                                                )
                                                    .animate(
                                                      onInit:
                                                          (controller) async {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    300));
                                                        controller.repeat(
                                                            period:
                                                                const Duration(
                                                                    seconds:
                                                                        1));
                                                      },
                                                      autoPlay: false,
                                                    )
                                                    .shimmer(
                                                        color: Colors.black),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                            ),
                                            child: SizedBox(
                                              width: constraints.maxWidth * 0.2,
                                            ),
                                          )
                                              .animate(
                                                onInit: (controller) async {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 300));
                                                  controller.repeat(
                                                      period: const Duration(
                                                          seconds: 1));
                                                },
                                                autoPlay: false,
                                              )
                                              .shimmer(color: Colors.black)
                                        ],
                                      ),
                                    ),
                                  ])
                                : Column(children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: IconButton(
                                        style: IconButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          store.changeBottomSheetStage(0);
                                        },
                                        icon: const Icon(
                                            Icons.arrow_back_ios_new),
                                      ),
                                      title: Text(
                                        'Planeje sua proxima viagem',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: constraints.maxWidth * 0.05,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        store.callScript();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: constraints.maxWidth * 0.17,
                                            width: constraints.maxWidth * 0.18,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.asset(
                                              "assets/UberX.png",
                                              width: constraints.maxWidth * 0.2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Uber X",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "${Utils.dateToString(
                                                    DateTime.now(),
                                                  )} - 5 min de distancia",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.03,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                            child: Text(
                                              "R\$ 17,80",
                                              style: TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.05),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        store.callScript();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: constraints.maxWidth * 0.17,
                                            width: constraints.maxWidth * 0.18,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.asset(
                                              "assets/Comfort.png",
                                              width: constraints.maxWidth * 0.2,
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Uber Confort",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "${Utils.dateToString(
                                                    DateTime.now(),
                                                  )} - 5 min de distancia",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.03,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                            child: Text(
                                              "R\$ 20,30",
                                              style: TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.05),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ]);
                      }),
                    ),
                  )
                : const SizedBox(),
          ));
    });
  }
}
