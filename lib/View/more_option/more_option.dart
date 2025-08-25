import 'package:flutter/material.dart';
import 'package:restro_code/View/add_item_menu/add_item_menu.dart';
import 'package:restro_code/View/shop_details/shop_details.dart';

class MoreOption extends StatefulWidget {
  const MoreOption({super.key});

  @override
  State<MoreOption> createState() => _MoreOptionState();
}

class _MoreOptionState extends State<MoreOption> {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Column(
        children: [


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessDetailsPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), // 👈 curved edges
                  border: Border.all(width: 0.5,color: Colors.grey)
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text("A"),
                  ),
                  title: const Text("Restaurant Name"),
                  subtitle: const Text("+91 8830076548"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                ),
              ),
            ),
          ),






          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(top: 17,bottom: 17),
          //       child: GestureDetector(

          //         child: Container(
          //           height: size.height*0.10,
          //           width: size.width*0.9,
          //           //color: Colors.amber,
          //           decoration: BoxDecoration(
          //             border: Border.all(width: 0.5,color: Colors.grey),
          //             borderRadius: BorderRadius.all(Radius.circular(15))
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.only(left:17),
          //             child: Row(
          //               children: [
          //                 Container(
          //                   height: 60,
          //                   width: 45,
          //                   decoration: BoxDecoration(
          //                     shape: BoxShape.circle,
          //                     border: Border.all(width: 0.5,color: Colors.black),
          //                   ),
          //                 ),
                  
          //                 const SizedBox(width: 15,),
                  
          //                 Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text("Enter Restaurant Name"),
          //                     Text("+91 8830076548")
          //                   ],
          //                 ),
                  
          //                 const Spacer(),
                  
          //                 Icon(Icons.arrow_forward_ios,size: 15,)
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),






          // 🔹 Profile Section (Clickable)
          // InkWell(
          //   onTap: () {
          //     print("Profile Clicked");
          //   },
          //   child: Container(
          //     padding: const EdgeInsets.all(16),
          //     child: Row(
          //       children: [
          //         const CircleAvatar(
          //           child: Text("E"),
          //         ),
          //         const SizedBox(width: 12),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             Text(
          //               "Enter Restaurant Name",
          //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               "+91 8830076548",
          //               style: TextStyle(color: Colors.grey),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          const Divider(),

          // 🔹 Menu Rows
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: const Text("Items"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMenuItemScreen())),
                ),

                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text("Regular Customers"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () => print("Regular Customers Clicked"),
                ),

                ListTile(
                  leading: const Icon(Icons.campaign),
                  title: const Text("Advertising Booster"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () => print("Marketing Tools Clicked"),
                ),

                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text("Reports"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () => print("Reports Clicked"),
                ),

                ListTile(
                  leading: const Icon(Icons.print),
                  title: const Text("Printer"),
                  trailing: IntrinsicWidth(   // 👈 makes Row take minimum width
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Not Connected",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 8), // spacing
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                  onTap: () => print("Printer Clicked"),
                ),

                ListTile(
                  leading: const Icon(Icons.headset_mic),
                  title: const Text("Support"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () => print("Support Clicked"),
                ),
              ],
            ),
          ),

          // 🔹 Bottom Banner Button
          Container(
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                print("Buy Zaayka Gold Clicked");
              },
              child: const Text(
                "Buy Apna Pack",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


















// import 'package:flutter/material.dart';

// class MoreOption extends StatefulWidget{
//   const MoreOption({super.key});

//   @override

//   State createState ()=> _MoreOptionState();
// }

// class _MoreOptionState extends State{
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_outlined),
//         title: Text("Menu"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         shape: Border(
//           bottom: BorderSide(
//             color: Colors.grey,
//             width: 1,
//           ),
//         ),
//       ),

//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 17,bottom: 17),
//                 child: Container(
//                   height: size.height*0.10,
//                   width: size.width*0.9,
//                   //color: Colors.amber,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 0.5,color: Colors.grey),
//                     borderRadius: BorderRadius.all(Radius.circular(15))
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:17),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 60,
//                           width: 45,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 0.5,color: Colors.black),
//                           ),
//                         ),

//                         const SizedBox(width: 15,),

//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Enter Restaurant Name"),
//                             Text("+91 8830076548")
//                           ],
//                         ),

//                         const Spacer(),

//                         IconButton(
//                           onPressed: (){
                    
//                           }, 
//                           icon: Icon(Icons.arrow_forward_ios,size: 15,)
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//         ],
//       ),
//     );
//   }
// }