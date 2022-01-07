import 'package:flutter/material.dart';
class KitaplarView extends StatelessWidget {
  const KitaplarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.library_books, color: Colors.black,),
        ),
        actions: [
          const Center(child:
          Text("1",style: TextStyle(color: Colors.black),)),
          IconButton(icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: (){},
          ),

        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
