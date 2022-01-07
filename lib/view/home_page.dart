import 'package:flutter/material.dart';
import 'package:my_library/model/raflar_list_model.dart';
import 'package:my_library/view/istek_listesi_view.dart';
import 'package:my_library/view/kitaplar_view.dart';
import 'package:my_library/view/odunc_view.dart';
import 'package:my_library/view/raflar_view/raf_detay_view.dart';
import 'package:my_library/view/raflar_view/raflar_gorunum_view.dart';
import 'package:my_library/view/raflar_view/raflar_grid_view.dart';
import 'package:my_library/view/raflar_view/raflar_list_view.dart';
import 'package:my_library/view_model/raflar_list_add_view_model.dart';
import 'package:provider/provider.dart';


final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class HomePage extends StatefulWidget  {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool gridMi = false;
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("My Library"),
          actions: [
            IconButton(icon: const Icon(Icons.search),
              onPressed: (){},
            ),
            IconButton(icon: const Icon(Icons.swap_vert),
              onPressed: (){},
            ),
           gridMi == false ? IconButton(icon: const Icon(Icons.view_list),
              onPressed: (){
                   _navKey.currentState!.push(
                     MaterialPageRoute(
                       builder: (_) => RaflarGridView(),
                     ),
                   );
                   setState(() {
                     gridMi = true;
                   });
              },
            ) : IconButton(icon: const Icon(Icons.view_comfortable),
             onPressed: (){
               setState(() {
                 gridMi = false;
               });
               _navKey.currentState!.pop(
                 MaterialPageRoute(
                   builder: (_) => RafListesi(),
                 ),
               );

             },
           ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent),
            tabs: [
              Tab(
                child: Text("Raflar"),
              ),
              Tab(
                child: Text("Kitaplar"),
              ),
              Tab(
                child: Text("Ödünç"),
              ),
              Tab(
                child: Text("İstekler"),
              ),
            ],
          ),),
        drawer: Drawer(
          child: ListView(
          ),
        ),
        body: TabBarView(
              children:[
               Navigator(
                  key: _navKey,
                  initialRoute: '/',
                  onGenerateRoute: (settings){
                    switch(settings.name){
                      case '/' :
                        return MaterialPageRoute(builder: (context)=> RafListesi());
                      case '/detay' :
                        return MaterialPageRoute(builder: (context)=> RafDetay());
                      default :
                        return MaterialPageRoute(builder: (context)=> RafListesi());
                    }
                  },
                ),
                KitaplarView(),
                OduncView(),
                IstekListesiView(),
              ],
            ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'ISBN Tarat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add_rounded),
              label: 'Kendiniz Ekleyin',
            ),
          ],
        ),
      ),
    );
  }
}


/*class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child:  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("My Library"),
        actions: [
          IconButton(icon: const Icon(Icons.search),
          onPressed: (){},
          ),
          IconButton(icon: const Icon(Icons.swap_vert),
            onPressed: (){},
          ),
          IconButton(icon: const Icon(Icons.view_list),
            onPressed: (){

            },
          ),
        ],
        bottom: const TabBar(
        tabs: [
          Tab(
           child: Text("Raflar"),
          ),
          Tab(
            child: Text("Kitaplar"),
          ),
          Tab(
            child: Text("Ödünç"),
          ),
          Tab(
            child: Text("İstekler"),
          ),
      ],
    ),),
      drawer: Drawer(
        child: ListView(
        ),
      ),
        body: TabBarView(
          children: <Widget>[
            RaflarGorunumView(),
            KitaplarView(),
            OduncView(),
            IstekListesiView(),
          ],
        ),
    ),
    );
  }
}*/
