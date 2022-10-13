import 'package:flutter/material.dart';

class Comprobante extends StatefulWidget {
  final String _cbu;
  final String _alias;
  final String _beneficiario;
  final String _cuit;
  final String _banco;
  final String _dinero;
  final String selectedItem;
  final String _referencia;

  Comprobante(this._cbu, this._dinero, this.selectedItem, this._referencia,
      this._alias, this._banco, this._beneficiario, this._cuit);

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
          Text(widget._alias),
          Text(widget._beneficiario),
          Text(widget._cuit),
          Text(widget._banco),
          Text(widget._referencia),
        ],
      )),
    );
  }
}
