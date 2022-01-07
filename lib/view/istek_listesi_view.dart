import 'package:flutter/material.dart';
class IstekListesiView extends StatelessWidget {
  const IstekListesiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [

        ],
      ),

    );
  }
}
