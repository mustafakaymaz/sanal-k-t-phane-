import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_library/model/raflar_list_model.dart';
import 'package:my_library/util.dart';
import 'package:my_library/view/home_page.dart';
import 'package:my_library/view/raflar_view/raf_detay_view.dart';

import 'package:my_library/view/raflar_view/raflar_gorunum_view.dart';
import 'package:my_library/view/raflar_view/raflar_list_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.registerAdapter(RaflarAdapter());
  runApp(
    MyApp(),
  );
  /* MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => RaflarListAdd()),
    ],*/
  // child:
}

Future _initHive() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RaflarListAdd()),
        ChangeNotifierProvider(create: (_) => Util()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(
                          child: Text('Veritabanına bağlanırken hata oluştu'),
                        ),
                      );
                    } else {
                      return HomePage();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),
      ),
    );
  }
}

// Copyright 2020, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

