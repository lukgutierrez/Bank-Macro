import 'package:bank_macro/database/models/Pages/hive_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../database/models/datamoney.dart';

class Movimientoss extends StatefulWidget {
  final String _cbu;
  final String _alias;
  final String _beneficiario;
  final String _cuit;
  final String _banco;
  final String _dinero;
  final String selectedItem;
  final String _referencia;
  final String _saldocuenta;
  const Movimientoss(
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
  State<Movimientoss> createState() => _MovimientossState();
}

class _MovimientossState extends State<Movimientoss> {
  final HiveData hiveData = const HiveData();
  List<DataMoney> datamoney = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    datamoney = await hiveData.contact;

    setState(() {});
  }

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
                        "assets/icon.png",
                      ),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async {
                      await hiveData.saveDataMoney(DataMoney(
                          nametitular: widget._dinero,
                          dineromenos: widget._banco,
                          saldoactual: widget._saldocuenta,
                          fecha: FechaActual));
                      await getData();
                    },
                    icon: Icon(Icons.more_vert)),
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
                        r"CA....5589/$ ",
                        style: TextStyle(fontSize: 13),
                      ),
                      Text(
                        widget._saldocuenta,
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
              backgroundColor: Color.fromARGB(255, 0, 39, 68),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: datamoney.length,
                    itemBuilder: (context, index) => Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: Center(
                                child: Text(
                              "DELETE",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            )),
                          ),
                          key: UniqueKey(),
                          onDismissed: (direction) async {
                            await hiveData.deleteDataMoneyIndex(index);
                            await getData();
                          },
                          child: ListTile(
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Color(0xFFF003156),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datamoney[index].dineromenos,
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
                                      datamoney[index].nametitular,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(datamoney[index].fecha,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black54)),
                                Row(
                                  children: [
                                    Text(r"Saldo $",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54)),
                                    Text(
                                      datamoney[index].saldoactual,
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black54),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )))));
  }
}
