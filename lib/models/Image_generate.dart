import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ImageGenerate extends StatefulWidget {
  final String _cbu;
  final String _alias;
  final String _beneficiario;
  final String _cuit;
  final String _banco;
  final String _dinero;
  final String selectedItem;
  final String _referencia;

  ImageGenerate(this._cbu, this._dinero, this.selectedItem, this._referencia,
      this._alias, this._banco, this._beneficiario, this._cuit);
  @override
  State<ImageGenerate> createState() => _ImageGenerateState();
}

class _ImageGenerateState extends State<ImageGenerate> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String FechaActual = DateFormat("dd/MM/yyyy HH:mm:ss", 'es_ES').format(now);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Image(image: AssetImage("assets/fondo.png")),
        ),
        Column(
          children: [
            Divider(
              height: 70,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FechaActual,
                  style: TextStyle(fontSize: 15),
                ),
                Text("03473", style: TextStyle(fontSize: 15))
              ],
            ),
          ],
        )
      ],
    ));
  }
}
