import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["HOLA", "HELLO", "PEPE"];
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
              TextField(),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Importe"),
              TextField(),
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
        ],
      ),
    );
  }
}
