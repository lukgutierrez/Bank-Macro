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
    String FechaActual = DateFormat("dd/MM/yyyy HH:mm", 'es_ES').format(now);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: Image(image: AssetImage("assets/fondo.png")),
        ),
        Column(
          children: [
            Divider(
              height: 75,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FechaActual,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("03473", style: TextStyle(fontSize: 16))
              ],
            ),
            Divider(
              height: 60,
              color: Colors.transparent,
            ),
            Row(
              children: [
                SizedBox(
                  width: 202,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ALIAS************************************
                    Text(
                      widget._referencia,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      height: 09,
                      color: Colors.transparent,
                    ),
                    //CBU***************************************
                    Text(
                      widget._cbu,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      height: 18,
                      color: Colors.transparent,
                    ),
                    //BENEFICIARIO******************************
                    Text(
                      widget._beneficiario,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      height: 16,
                      color: Colors.transparent,
                    ),
                    //CUIT/CUIT*********************************

                    Text(
                      widget._alias,
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      height: 64,
                      color: Colors.transparent,
                    ),
                    //BANCO************************************

                    Text(
                      widget._banco,
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      height: 06,
                      color: Colors.transparent,
                    ),
                    //CONCEPTO*********************************

                    Text(
                      widget.selectedItem,
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      height: 06,
                      color: Colors.transparent,
                    ),
                    //REFERENCIA*********************************

                    Text(
                      widget._cuit,
                      style: TextStyle(fontSize: 18),
                    ),
                    Divider(
                      height: 35,
                      color: Colors.transparent,
                    ),
                    //IMPORTE************************************

                    Text(
                      widget._dinero,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
