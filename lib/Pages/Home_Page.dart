import 'package:bank_macro/models/Comprobante.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _alias = TextEditingController(text: "");
  TextEditingController _cbu = TextEditingController(text: "");
  TextEditingController _beneficiario = TextEditingController(text: "");
  TextEditingController _cuit = TextEditingController(text: "");
  TextEditingController _banco = TextEditingController(text: "");
  TextEditingController _dinero = TextEditingController(text: "");
  TextEditingController _referencia = TextEditingController(text: "");
  TextEditingController _saldocuenta = TextEditingController(text: "");
  List<String> items = [
    "Varios",
    "Factura",
    "Cuota",
    "Alquiler",
    "Haberes",
    "Seguro"
  ];
  String? selectedItem = "Varios";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencia a otros"),
        backgroundColor: Color(0xFFF003156),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            //ALIAS ***************************************************
            Date("ALIAS DESTINO", TextInputType.text, _alias),
            //CBU******************************************************
            Date("CBU/CVU DESTINO", TextInputType.number, _cbu),
            //NOMBRE BENEFICIARIO**************************************
            Date("NOMBRE BENEFICIARIO", TextInputType.text, _beneficiario),
            //CUIT/CUIL/CDI*****************************************+++
            Date("CUIT/CUIL/CDI", TextInputType.number, _cuit),
            //CUIT/CUIL/CDI*****************************************+++
            Date("BANCO", TextInputType.text, _banco),
            //CONCEPTO*************************************************
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
                //REFERENCIA (OPCIONAL)*********************************************
                TextField(
                  cursorColor: Color(0xFFF003156),
                  keyboardType: TextInputType.text,
                  controller: _referencia,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF003156)),
                      //  when the TextFormField in focused
                    ),
                    hintText: "Referencia (Opcional)",
                  ),
                ),
                //IMPORTE+++++++*****************************************+++
                Date("IMPORTE", TextInputType.number, _dinero),
                Date("SALDO CUENTA", TextInputType.number, _saldocuenta)
              ],
            ),
            //BOTTOM*********************************************
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    height: 40.0,
                    width: 340.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFF003156))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Comprobante(
                                    _cbu.text,
                                    _dinero.text,
                                    selectedItem.toString(),
                                    _referencia.text,
                                    _alias.text,
                                    _beneficiario.text,
                                    _cuit.text,
                                    _banco.text,
                                    _saldocuenta.text)));
                      },
                      child: Text("Continuar"),
                    )))
          ],
        ),
      ),
    );
  }
}

Date(dato, dato2, dato3) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(dato),
      TextFormField(
        cursorColor: Color(0xFFF003156),
        keyboardType: dato2,
        textCapitalization: TextCapitalization.characters,
        controller: dato3,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF003156)),
            //  when the TextFormField in focused
          ),
        ),
      ),
    ],
  );
}
