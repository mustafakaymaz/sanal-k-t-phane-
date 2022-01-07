import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/model/raflar_list_model.dart';
import 'package:my_library/view/raflar_view/raf_detay_view.dart';
import 'package:my_library/view/raflar_view/raflar_gorunum_view.dart';
import 'package:my_library/view/raflar_view/raflar_listtile.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';


final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class RafListesi extends StatefulWidget {
  bool listeSeciliMi = false;

  @override
  _RafListesiState createState() => _RafListesiState();
}
class _RafListesiState extends State<RafListesi> {
  var tf = TextEditingController();
  bool listeSeciliMi = false;
  TextEditingController tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<RaflarListAdd>(context, listen: false).getRaflars();
    var ekranYuksekligi = MediaQuery.of(context).size.height;
    var ekranGenisligi = MediaQuery.of(context).size.width;
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 40,
      elevation: 1,
      leading: IconButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>RafListesi()));
          // Navigator.pop(context)

        },
        icon: const Icon(Icons.home, color: Colors.black,),
      ),
       /*title:listeSeciliMi == false ? Consumer<RaflarListAdd>(builder: (context, rafad, child){
          Raflar currentRaflar = rafad.getActiveRaflar();
          return Text(" > ${currentRaflar.rafAdi}", style: TextStyle(color:  Colors.black54),);
        },) : null,*/
      actions: [
        Center(
          child: Row(
            children: [
              Consumer<RaflarListAdd>(builder: (contex, rafSayi, child){
              return Text("0/"+rafSayi.raflarCount.toString(),style: TextStyle(color: Colors.black),);
    },),
            ],
          ),
        ),
        IconButton(icon: const Icon(Icons.filter_list, color: Colors.black),
          onPressed: (){},
        ),
      ],
      backgroundColor: Colors.white,
    ),
      body: ListView.builder(
            itemCount: Provider.of<RaflarListAdd>(context).raflarCount,
            itemBuilder: (context, index) {
              return  Consumer<RaflarListAdd>(
                  builder: (context, raflarAdd, child){
                    Raflar currentRaflar = raflarAdd.getRaflar(index);
                    return ListTile(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>RafDetay()));
                        /*_navKey.currentState!.push(
                          MaterialPageRoute(
                            builder: (_) => RafDetay(),
                          ),
                        );*/
                        Navigator.pushNamed(context, '/detay');
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
                          color: Colors.grey,
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
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>  showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Raf Ekle'),
            content: TextField(
              controller: tec,
              decoration: InputDecoration(
                label: Text("İsim:"),
              ),
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('İptal'),
              ),
              TextButton(
                onPressed: () {
                  _addRaf(context);
                  Navigator.pop(context);
                },
                child:Text('Tamam'),
              ),
            ],
          ),
        ),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
  void _addRaf(context){
    Provider.of<RaflarListAdd>(context, listen: false).addRaflar(
      Raflar(
          rafAdi: tec.text,
          kitapAdet: 0,
          okunduMu: false, rafId:1, rafKitaplar: []),
    );
  }
}


class RaflarTile extends StatelessWidget {

  var tf = TextEditingController();
  final int titleIndex;
  RaflarTile({Key? key, required this.titleIndex,});

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}





