import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong2/latlong.dart';
import 'package:uber_clone/app/modules/historic/historic_store.dart';

class HistoricPage extends StatefulWidget {
  final String title;
  const HistoricPage({super.key, this.title = 'Atividade'});
  @override
  HistoricPageState createState() => HistoricPageState();
}

class HistoricPageState extends State<HistoricPage> {
  final HistoricStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: constraints.maxWidth * 0.08),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anteriores",
                      style: TextStyle(fontSize: constraints.maxWidth * 0.05),
                    ),
                    CircleAvatar(
                      radius: constraints.maxWidth * 0.05,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: Colors.black,
                        size: constraints.maxWidth * 0.06,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(15),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: FlutterMap(
                            options: MapOptions(
                              initialZoom: 15,
                              initialCenter: store.getCenter(),
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
                              PolylineLayer(polylines: [
                                Polyline(
                                  points: (store.dataPaths
                                      .getInfo(
                                          "car1To${store.authController.userType}")
                                      .map(
                                    (e) {
                                      return LatLng(
                                          e["location"][0], e["location"][1]);
                                    },
                                  ).toList()),
                                  color: Colors.black,
                                  strokeWidth: 5,
                                )
                              ]),
                              MarkerLayer(markers: [
                                Marker(
                                  point: (store.dataPaths
                                          .getInfo(
                                              "car1To${store.authController.userType}")
                                          .map(
                                    (e) {
                                      return LatLng(
                                          e["location"][0], e["location"][1]);
                                    },
                                  ).toList())
                                      .first,
                                  child: const Icon(Icons.adjust_rounded),
                                ),
                                Marker(
                                  point: (store.dataPaths
                                          .getInfo(
                                              "car1To${store.authController.userType}")
                                          .map(
                                    (e) {
                                      return LatLng(
                                          e["location"][0], e["location"][1]);
                                    },
                                  ).toList())
                                      .last,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        color: Colors.black,
                                        width: constraints.maxWidth * 0.04,
                                        height: constraints.maxWidth * 0.04,
                                      ),
                                      Container(
                                        color: Colors.white,
                                        width: constraints.maxWidth * 0.015,
                                        height: constraints.maxWidth * 0.015,
                                      )
                                    ],
                                  ),
                                )
                              ])
                            ],
                          ),
                        ),
                      ),
                      Text(
                        store.authController.userType == "M"
                            ? "Rua Pedro Fonseca Filho"
                            : "Rua Itororós",
                        style: TextStyle(
                          fontSize: constraints.maxWidth * 0.05,
                        ),
                      ),
                      Text(
                        "13 de abr * 19:27",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: constraints.maxWidth * 0.03,
                        ),
                      ),
                      Text(
                        "R\$19,96",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: constraints.maxWidth * 0.03,
                        ),
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
                              Icons.refresh,
                              size: constraints.maxWidth * 0.04,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Reagendar",
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.035),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey.shade200,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 15,
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: constraints.maxWidth * 0.17,
                        width: constraints.maxWidth * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/UberX.png",
                          width: constraints.maxWidth * 0.2,
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Av. Nevaldo Rocha, 3775 - Tirol, Natal",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.04,
                              ),
                            ),
                            Text(
                              "13 de abr * 19:27",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: constraints.maxWidth * 0.03,
                              ),
                            ),
                            Text(
                              "R\$19,96",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: constraints.maxWidth * 0.03,
                              ),
                            ),
                          ],
                        ),
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
                              Icons.refresh,
                              size: constraints.maxWidth * 0.04,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Reagendar",
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * 0.035),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
