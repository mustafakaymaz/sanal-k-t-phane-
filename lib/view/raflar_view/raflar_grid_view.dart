import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';
import 'package:my_library/model/raflar_list_model.dart';

class RaflarGridView extends StatelessWidget {
  TextEditingController tec = TextEditingController();
  var tf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<RaflarListAdd>(context, listen: false).getRaflars();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>RafListesi()));
            // Navigator.pop(context)
          },
          icon: const Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        /*title:listeSeciliMi == false ? Consumer<RaflarListAdd>(builder: (context, rafad, child){
          Raflar currentRaflar = rafad.getActiveRaflar();
          return Text(" > ${currentRaflar.rafAdi}", style: TextStyle(color:  Colors.black54),);
        },) : null,*/
        actions: [
          Center(
            child: Row(
              children: [
                Consumer<RaflarListAdd>(
                  builder: (contex, rafSayi, child) {
                    return Text(
                      "0/" + rafSayi.raflarCount.toString(),
                      style: TextStyle(color: Colors.black),
                    );
                  },
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 2,
          ),
          itemCount: Provider.of<RaflarListAdd>(context).raflarCount,
          itemBuilder: (context, index) {
            return Consumer<RaflarListAdd>(
              builder: (context, raflist, child) {
                Raflar currentRaflar = raflist.getRaflar(index);
                return GestureDetector(
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text("Yeniden Adlandır"),
                                        content: TextField(
                                          controller: tf,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(width: 1.0)),
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('İptal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Provider.of<RaflarListAdd>(
                                                      context,
                                                      listen: false)
                                                  .editRaflar(
                                                      raflar: Raflar(
                                                          rafId: 1,
                                                          rafAdi: tf.text,
                                                          kitapAdet: 1,
                                                          okunduMu: true,
                                                          rafKitaplar: []),
                                                      rafKey:
                                                          currentRaflar.key);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Güncelle'),
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text("Rafı Sil"),
                                        content:
                                            Text("Silinmesinden emin misiniz?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('İptal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Provider.of<RaflarListAdd>(
                                                      context,
                                                      listen: false)
                                                  .deleteRaflar(
                                                      currentRaflar.key);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Evet'),
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
                  onTap: () {
                    Navigator.pushNamed(context, '/detay');
                    Provider.of<RaflarListAdd>(context, listen: false)
                        .setActiveRaflar(currentRaflar.key);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("image/kitap.png")),
                              Text(
                                currentRaflar.rafAdi,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              //Text("${film.filmFiyat} ₺", style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          semanticContainer: true,
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          top: 5,
                          right: 3,
                          child: Container(
                            height: 50,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green,
                            ),
                            child:RotatedBox(
                              quarterTurns: 3,
                              child:  Center(child: Text("Kitap : 0",style: TextStyle(),)),
                            ),
                          )),
                    ],
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
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
                child: Text('Tamam'),
              ),
            ],
          ),
        ),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }

  void _addRaf(context) {
    Provider.of<RaflarListAdd>(context, listen: false).addRaflar(
      Raflar(
          rafAdi: tec.text,
          kitapAdet: 0,
          okunduMu: false,
          rafId: 1,
          rafKitaplar: []),
    );
  }
}
