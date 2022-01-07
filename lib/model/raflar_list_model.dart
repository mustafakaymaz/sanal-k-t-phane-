import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_library/model/kitaplar_model.dart';

part 'raflar_list_model.g.dart';

@HiveType(typeId: 0)
class Raflar extends HiveObject{

  @HiveField(0)
  final int rafId;

  @HiveField(1)
 final String rafAdi;

  @HiveField(2)
  final int kitapAdet;

  @HiveField(3)
  final bool okunduMu;

  @KeyEventResult.ignored
  List<Kitaplar> rafKitaplar;

  Raflar(
      {required this.rafId,
        required this.rafAdi,
       required this.kitapAdet,
       required this.okunduMu,
      required this.rafKitaplar});

}


