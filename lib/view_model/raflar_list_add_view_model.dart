import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_library/model/raflar_list_model.dart';

class RaflarListAdd extends ChangeNotifier{

  static const String _kutuAdi = "raflarBox";

   List<Raflar> _raflar = [];

   late Raflar _activeRaflar;



   void getRaflars() async {
     var box = await Hive.openBox<Raflar>(_kutuAdi);
     _raflar = box.values.toList();
     notifyListeners();
   }

   Raflar getRaflar(index){
     return _raflar[index];
   }

   void addRaflar(Raflar raflar) async{
     var box = await Hive.openBox<Raflar>(_kutuAdi);
     await box.add(raflar);
     _raflar = box.values.toList();
     notifyListeners();
   }

   void deleteRaflar(key) async {
     var box = await Hive.openBox<Raflar>(_kutuAdi);
     await box.delete(key);
     _raflar = box.values.toList();
     notifyListeners();

   }
   void editRaflar({required Raflar raflar, required int rafKey })async{
     var box = await Hive.openBox<Raflar>(_kutuAdi);
      await box.put(rafKey, raflar);
      _raflar = box.values.toList();
      _activeRaflar= box.get(rafKey)!;
      notifyListeners();
   }

    setActiveRaflar(key)async{
     var box = await Hive.openBox<Raflar>(_kutuAdi);
     _activeRaflar =  box.get(key)!;
     notifyListeners();
   }

   Raflar getActiveRaflar(){
     return _activeRaflar;
   }

  int get raflarCount {
     return _raflar.length;
  }


}