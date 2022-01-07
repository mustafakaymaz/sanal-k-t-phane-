import 'package:flutter/material.dart';
class OduncView extends StatelessWidget {
  const OduncView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Center(child: Text("1", style:  TextStyle(color: Colors.black),)),
        actions: [
          IconButton(icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
            onPressed: (){},
          ),
        ],
        toolbarHeight: 40,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
    );
  }
}
