import 'package:flutter/material.dart';

class Comprobante extends StatefulWidget {
  final String _cbu;
  final String _dinero;
  final String selectedItem;
  final String _referencia;

  Comprobante(this._cbu, this._dinero, this.selectedItem, this._referencia);

  @override
  State<Comprobante> createState() => _ComprobanteState();
}

class _ComprobanteState extends State<Comprobante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget._cbu),
          Text(widget._dinero),
          Text(widget.selectedItem),
          Text(widget._referencia),
        ],
      )),
    );
  }
}
