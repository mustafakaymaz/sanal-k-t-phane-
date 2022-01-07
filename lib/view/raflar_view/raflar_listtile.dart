/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/const.dart';
import 'package:my_library/model/raflar_list_model.dart';
import 'package:my_library/view/raflar_view/raf_detay_view.dart';
import 'package:my_library/view/raflar_view/raflar_gorunum_view.dart';
import 'package:my_library/view/raflar_view/raflar_list_view.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';
import '../../util.dart';

class RaflarTile extends StatelessWidget {

  var tf = TextEditingController();
  RaflarListView rlf = RaflarListView();
  final int titleIndex;
   RaflarTile({Key? key, required this.titleIndex,});


   @override
  Widget build(BuildContext context) {
    var ekranYuksekligi = MediaQuery.of(context).size.height;
    var ekranGenisligi = MediaQuery.of(context).size.width;
    return Consumer<RaflarListAdd>(
        builder: (context, raflarAdd, child){
          Raflar currentRaflar = raflarAdd.getRaflar(titleIndex);
          return ListTile(
            onTap: () {
              Provider.of<RaflarListAdd>(context, listen: false).setActiveRaflar(currentRaflar.key);
               // Navigator.push(context, MaterialPageRoute(builder: (context){return RafDetay();}));
            },
            onLongPress: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Raf Düzenle'),
                content: SizedBox(
                  height: 100,
                  width: 350,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                              showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Yeniden Adlandır"),
                                content: TextField(
                                  controller: tf,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1.0)),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('İptal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Provider.of<RaflarListAdd>(context, listen: false).editRaflar(raflar: Raflar(rafId: 1, rafAdi: tf.text, kitapAdet: 1, okunduMu: true, rafKitaplar: []), rafKey:currentRaflar.key);
                                      Navigator.pop(context);
                                    },
                                    child:Text('Güncelle'),
                                  ),
                                ],
                              ),
                            );
                            },
                            icon: Icon(Icons.edit),
                          ),
                          Text("Yeniden Adlandır"),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                              showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text("Rafı Sil"),
                                content: Text("Silinmesinden emin misiniz?"),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'Cancel'),
                                    child: const Text('İptal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Provider.of<RaflarListAdd>(context, listen: false).deleteRaflar(currentRaflar.key);
                                      Navigator.pop(context);
                                    },
                                    child:Text('Evet'),
                                  ),
                                ],
                              ),
                            );
                            },
                            icon: Icon(Icons.delete),
                          ),
                          Text("Rafı Sil"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            title: Container(
                height: ekranYuksekligi / 7,
                margin: EdgeInsets.all(2.0),
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: ekranYuksekligi / 7 * 0.9,
                        width: ekranGenisligi / 5,
                        decoration: const BoxDecoration(
                          image:
                          DecorationImage(image: AssetImage("image/kitap.png")),
                          color: Colors.cyan,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currentRaflar.rafAdi),
                          Text("0 kitap"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Okunmadı"),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
*/