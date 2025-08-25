import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:restro_code/Custom/custom_text.dart';
import 'package:restro_code/Custom/custombutton.dart';
import 'package:restro_code/controller/home_controller.dart';

class AddOrder extends StatefulWidget{

  const AddOrder({super.key});
  @override

  State createState()=> _AddOrderState();
}

class _AddOrderState extends State{
  int selectedValue = 0;
  int selectedPay = 0;

TextEditingController nameController = TextEditingController();
TextEditingController priceController = TextEditingController();

void showFormBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // makes it go higher when keyboard opens
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // avoid keyboard overlap
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // adjust height to content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Details",
             
            ),
            SizedBox(height: 16),

            // First TextField
            TextField(
              controller: nameController,
              decoration:const  InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),


            // Third TextField
            TextField(
              controller: priceController,
              decoration:const  InputDecoration(
                labelText: "Sale Price",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if(nameController.text.isNotEmpty && priceController.text.isNotEmpty){
                    homePageController.product.add(nameController.text);
                    homePageController.prices.add(int.parse(priceController.text));
                    homePageController.productPrice.add(0);

                    setState(() {});
                    Navigator.pop(context); 
                  }
                },
                child: Text("Submit"),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      );
    },
  );
}
  
  HomePageController homePageController = HomePageController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: const Icon(Icons.keyboard_arrow_left_outlined,color: Colors.black,),
        title: const Text("Add Order",style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: const Color.fromARGB(241, 255, 255, 255),
        actions: [
          const Icon(Icons.settings,color: Colors.black,),
          Padding(
            padding: const EdgeInsets.only(top:15,bottom: 15,left: 5,right: 5),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color:const Color.fromARGB(255, 240, 238, 238)),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: CustomText(text: "Add Details", fontWeight: FontWeight.bold,size:12,color: Colors.black,)),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 15),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 224, 223, 223)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color.fromARGB(255, 210, 210, 210), width: 2),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: 
            ListView.builder(
              itemCount: homePageController.verity.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedValue = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color:(selectedValue == index)?Colors.blue :Colors.black
                        )
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(
                            homePageController.verity[index],
                            style: TextStyle(
                              color: (selectedValue == index)?Colors.blue :Colors.black,
                              fontWeight: (selectedValue == index)?FontWeight.bold:FontWeight.normal
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(text: "Main Course",fontWeight: FontWeight.bold,size: 16.0,color: const Color.fromARGB(221, 158, 158, 158),),
          ),
          const SizedBox(height: 18,),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5, // horizontal gap
                mainAxisSpacing: 10,  // vertical gap
                childAspectRatio: 0.6,  
                ),
                itemCount: homePageController.prices.length+1,
               itemBuilder: ((context, index) {
                return (index == homePageController.prices.length)?
                GestureDetector(
                  onTap:(){
                    showFormBottomSheet(context);
                  },
                  child: Center(
                    child: DottedBorder(
                    color: Colors.blue, strokeWidth: 2, dashPattern: [6, 3], // 6px line, 3px gap borderType: BorderType.RRect, radius: Radius.circular(12),
                      child: Container(
                        height: 150,
                        width: 110,
                        alignment: Alignment.center,
                        child: Icon(Icons.add)
                      ),
                    ),
                  ),
                )
                :Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(  
                          color: Color.fromARGB(204, 245, 245, 247),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:5,top: 5),
                                child: Container(
                                  height: 25,
                                  width: 35,
                                  decoration: BoxDecoration(
                                  //  color: const Color.fromARGB(255, 173, 247, 176),
                                  color:const Color.fromARGB(255, 216, 215, 215),
                                    borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "₹${homePageController.prices[index].toString()}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right:5,top: 5),
                                child: SizedBox(
                                  height: 25,
                                  width: 35,
                                  child:  Center(
                                    child:Icon(Icons.image,color: Colors.white,)
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:5,top: 5,bottom: 5),
                                child:(homePageController.productPrice[index]>0)? 
                                Container(
                                   height: 30,
                                  width: 83,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(197, 14, 74, 252),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5,right: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: ()async{
                                              await homePageController.checkDataMinus(index);
                                              setState(() {});
                                            },
                                            child:const Icon(Icons.remove,color: Colors.white,size: 18)),
                                          Text(homePageController.productPrice[index].toString(),style: const TextStyle(color: Colors.white),),
                                          GestureDetector(
                                            onTap: ()async{
                                              await homePageController.checkDataPlus(index);
                                              setState(() {});
                                            },
                                            child:const Icon(Icons.add,color: Colors.white,size: 18))
                                        ],
                                      ),
                                    )
                                  ),
                                ):GestureDetector(
                                  onTap:()async{
                                     await homePageController.checkDataPlus(index);
                                     setState(() {});
                                  },
                                  child: Container(
                                    height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.add,color: Colors.blue,size: 16,),
                                    ),
                                  ),
                                )
                              )
                            ],
                          ),
                          
                        ],),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        homePageController.product[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                );
              })
            ),
          )
        ],
      ),
      bottomNavigationBar:Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: (homePageController.total >0)?10:0,),
            (homePageController.total >0)?
            SizedBox(
            height: 30,
            child: ListView.builder(
              itemCount: homePageController.paymentOptins.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedPay = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color:(selectedPay == index)?Colors.blue :Colors.black
                        )
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Text(
                            homePageController.paymentOptins[index],
                            style: TextStyle(
                              color: (selectedPay == index)?Colors.blue :Colors.black,
                              fontWeight: (selectedPay == index)?FontWeight.bold:FontWeight.normal
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ):Container(),

          (homePageController.total >0)?
          Padding(
            padding: const EdgeInsets.only(top:10,right: 20,left: 20),
            child: Container(
              height: 55,
              width: 350,
              decoration: BoxDecoration(  
               color:const Color.fromARGB(239, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromARGB(255, 221, 220, 220))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Bill Summary ", fontWeight: FontWeight.normal,color: Colors.grey,size: 13,),
                      const Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey,)
                    ],
                  ),
                   Padding(
                     padding: const EdgeInsets.only(bottom:5.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "Total Amount", fontWeight: FontWeight.normal,color: Colors.black,),
                       CustomText(text:"₹ ${homePageController.total}  ", fontWeight: FontWeight.normal)
                      ],
                                   ),
                   )
                ]),
              ),
            ),
          ):Container(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Save & Hold",
                        backgroundColor: Colors.grey.shade300,
                        textColor: Colors.black,
                        onPressed: () {
                          
                          
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        text: "Save & new",
                        backgroundColor: Colors.blue,
                        onPressed: () {
                          
                        },
                      ),
                    ),
                  ],
                ),
            ),


          

            // Padding(
            //   padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 20),
            //   child: Row(
            //   children: [
            //     Container(
            //       height: 50,
            //       width: 150,
            //       decoration: BoxDecoration(
            //         border: Border.all(color:const Color.fromARGB(255, 224, 223, 223),width: 2),
            //         borderRadius: BorderRadius.circular(10)
            //       ),
            //       child: Center(
            //         child: CustomText(text: "Save & Hold",fontWeight: FontWeight.normal,size: 16,)
            //       ),
            //     ),
            //      Padding(
            //       padding: const EdgeInsets.only(top: 10,bottom: 10,right: 0,left: 20),
            //        child: Container(
            //         height: 50,
            //         width: 150,
            //         decoration: BoxDecoration(
            //           color: Colors.blue,
            //           borderRadius: BorderRadius.circular(10)
            //         ),
            //         child: Center(
            //           child: CustomText(text: "Save & Bill",fontWeight: FontWeight.normal,size: 16,color: Colors.white,)
            //         ),
            //                  ),
            //      )
            //   ]),
            // ),
          ],
        ),
      ) ,
    );
  }
}