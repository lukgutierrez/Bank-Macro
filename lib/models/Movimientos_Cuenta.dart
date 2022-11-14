import 'dart:ui';

import 'package:flutter/material.dart';

class MovimientosCuenta extends StatelessWidget {
  const MovimientosCuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tab(),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: Color.fromARGB(255, 255, 113, 160),
                isScrollable: true,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Movimientos",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Datos de CBU",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Detalle de Cuenta",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Alias CBU",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Cobrar con QR",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ]),
            actions: [
              SizedBox(
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage(
                      "assets/setting.png",
                    ),
                    color: Colors.white,
                  )),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "C.sueldo/seg.social",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "CA....4465/S 780.890,50",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            backgroundColor: Color(0xFFF003156),
          ),
        ));
  }
}
