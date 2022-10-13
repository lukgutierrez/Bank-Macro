import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:bank_macro/models/Image_generate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

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
  final GlobalKey _keyBoundary = GlobalKey();

  Uint8List? _memoryimage;
  Future generateImage() async {
    final currentContext = _keyBoundary.currentContext;
    final boundary =
        currentContext!.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary!.toImage(
      pixelRatio: 100.0,
    );
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    setState(() {
      _memoryimage = bytes!.buffer.asUint8List();
    });

    Directory imagepng = await getApplicationDocumentsDirectory();
    String imagePath = '${imagepng.path}/banco_macro.png';
    final file = File(imagePath);
    var path = await file.writeAsBytes(_memoryimage!);

    return path.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ui.Color(0xFFF32AFDF),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Center(
              child: GestureDetector(
                  onTap: () async {
                    var path = await generateImage();
                    Share.shareFiles([path]);
                  },
                  child: Icon(Icons.share)),
              // title: Text("Comprobante"),
              // backgroundColor: Color(0xFFF003156),
            )),
        body: ListView(
          children: [
            SizedBox(
              width: 664,
              height: 680,
              child: RepaintBoundary(
                key: _keyBoundary,
                child: ImageGenerate(
                  widget._cbu,
                  widget._dinero,
                  widget.selectedItem,
                  widget._alias,
                  widget._beneficiario,
                  widget._cuit,
                  widget._banco,
                  widget._referencia,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 40.0,
                    width: 340.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF003156))),
                      onPressed: () async {
                        // var path = generateImage();
                        // Share.shareFiles([path?]);
                      },
                      child: Text("Compartir"),
                    )))
          ],
        ));
  }
}
