import 'package:hive_flutter/hive_flutter.dart';

part 'datamoney.g.dart';

@HiveType(typeId: 1)
class DataMoney {
  @HiveField(0)
  final String nametitular;
  @HiveField(1)
  final String dineromenos;
  @HiveField(2)
  final String saldoactual;
  @HiveField(3)
  final String fecha;



  DataMoney({
    required this.nametitular,
    required this.dineromenos,
    required this.saldoactual,
    required this.fecha
  });
}