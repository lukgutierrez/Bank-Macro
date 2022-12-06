import 'package:bank_macro/database/models/datamoney.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveData {
  const HiveData();
  Future<int> saveDataMoney(DataMoney dataMoney) async {
    final Box<DataMoney> box = await Hive.openBox<DataMoney>('datamoney');
    return box.add(dataMoney);
  }

  Future<int> deleteDataMoney(DataMoney dataMoney) async {
    final Box<DataMoney> box = await Hive.openBox<DataMoney>('datamoney');
    return box.clear();
  }

  Future<void> deleteDataMoneyIndex(int index) async {
    final Box<DataMoney> box = await Hive.openBox<DataMoney>('datamoney');
    return box.deleteAt(index);
  }

  Future<List<DataMoney>> get contact async {
    final Box<DataMoney> box = await Hive.openBox<DataMoney>('datamoney');
    return box.values.toList();
  }
}
