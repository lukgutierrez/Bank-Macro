import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Movimientos extends StatelessWidget {
  final String _cbu;
  final String _alias;
  final String _beneficiario;
  final String _cuit;
  final String _banco;
  final String _dinero;
  final String selectedItem;
  final String _referencia;
  final String _saldocuenta;
  const Movimientos(
      this._cbu,
      this._dinero,
      this.selectedItem,
      this._referencia,
      this._alias,
      this._banco,
      this._beneficiario,
      this._cuit,
      this._saldocuenta);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String FechaActual = DateFormat("dd/MM/yyyy", 'es_ES').format(now);
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              label: "",
              icon: Row(
                children: [
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Enviar por Correo")
                ],
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.white70), label: ""),
        ]),
        appBar: AppBar(
          bottom: TabBar(
              indicatorColor: Color.fromARGB(255, 255, 113, 160),
              isScrollable: true,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Movimientos",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Datos de CBU",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Detalle de Cuenta",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Alias CBU",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Cobrar con QR",
                    style: TextStyle(fontSize: 15),
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
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    r"CA....4465/$ ",
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    _saldocuenta,
                    style: TextStyle(fontSize: 13),
                  )
                ],
              )
            ],
          ),
          backgroundColor: Color(0xFFF003156),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              List(_banco, _dinero, FechaActual, _saldocuenta),
              Divider(
                color: Colors.black45,
              ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
              // Divider(
              //   color: Colors.black45,
              // ),
              // List("pepep", "-485745", "98/09/2002", "90000"),
            ],
          ),
        ),
      ),
    );
  }
}

List(titular, monto, fecha, cuentadinero) {
  return ListTile(
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 15,
      color: Color(0xFFF003156),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titular,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
        Row(
          children: [
            Text(r"$-",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
            Text(
              monto,
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(fecha, style: TextStyle(fontSize: 15, color: Colors.black54)),
        Row(
          children: [
            Text(r"Saldo $",
                style: TextStyle(fontSize: 15, color: Colors.black54)),
            Text(
              cuentadinero,
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ],
        )
      ],
    ),
  );
}
