import 'package:flutter/material.dart';
import 'package:my_library/model/raflar_list_model.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';

class RafDetay extends StatelessWidget {

  bool listeSeciliMi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            print("geri tıklandı");
           // Navigator.pushNamed(context, '/liste');
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home, color: Colors.black,),
        ),
         title:listeSeciliMi == false ? Consumer<RaflarListAdd>(builder: (context, rafad, child){
          Raflar currentRaflar = rafad.getActiveRaflar();
          return Text(" > ${currentRaflar.rafAdi}", style: TextStyle(color:  Colors.black54),);
        },) : null,
        actions: [
          const Center(child:
          Text("1/1",style: TextStyle(color: Colors.black),)),
          IconButton(icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: (){},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body:
    Container( height:  100,width:  250,color: Colors.blue,));

  }
}
