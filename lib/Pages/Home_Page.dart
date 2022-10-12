import 'package:bank_macro/models/Comprobante.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _cbu = TextEditingController(text: "");
  TextEditingController _dinero = TextEditingController(text: "");
  List<String> items = ["PIPO", "HELLO", "PEPE"];
  String? selectedItem = "HOLA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencia"),
        backgroundColor: Color(0xFFF003156),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enviar dinero a"),
              TextField(
                controller: _cbu,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Importe"),
              TextField(
                controller: _dinero,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Concepto"),
              SizedBox(
                width: 400,
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedItem,
                  items: items
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 40.0,
                  width: 340.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFF003156)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Comprobante(_cbu.text,
                                  _dinero.text, items.elementAt(3))));
                    },
                    child: Text("Continuar"),
                  )))
        ],
      ),
    );
  }
}
