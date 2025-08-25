import 'package:flutter/material.dart';
import 'package:restro_code/Custom/custombutton.dart';
import 'package:restro_code/View/add_order/add_order.dart';
import 'package:restro_code/View/more_option/more_option.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MoreOption()));
            },
            child: Icon(Icons.menu)
          )
        ],
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.blue),
      //         child: Text(
      //           "Menu",
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.dashboard),
      //         title: const Text("Dashboard"),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.receipt_long),
      //         title: const Text("Orders"),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.settings),
      //         title: const Text("Settings"),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: const Center(
        child: Text(
          "Welcome to Restaurant Billing App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          text: "Add Order",
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddOrder()));
          },
        ),
      ),
    );
  }
}
