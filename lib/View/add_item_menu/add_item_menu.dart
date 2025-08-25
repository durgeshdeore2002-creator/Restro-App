// import 'package:flutter/material.dart';
// import 'package:restro_code/Custom/customTextField'; // your CustomtextFiled
// import 'package:restro_code/Custom/custombutton.dart'; // your CustomButton
// import 'package:restro_code/Custom/customdropfield.dart'; // your DropdownTextField

// class AddMenuItemScreen extends StatefulWidget {
//   const AddMenuItemScreen({super.key});

//   @override
//   State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
// }

// class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();

//   String? category;
//   String? tax;

//   bool defaultFirmTax = true;
//   bool favourite = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Menu Item"),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// Item Name
//               CustomtextFiled(
//                 controller: nameController,
//                 labelText: "Item Name",
//                 hint: "Tap to Enter",
//                 color: Colors.blue,
//                 validatortext: "Item name is required",
//                 width: MediaQuery.of(context).size.width,
//               ),
//               const SizedBox(height: 16),

//               /// Item Image
//               Container(
//                 height: 150,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade400),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.image_outlined, size: 40, color: Colors.grey),
//                       SizedBox(height: 8),
//                       Text(
//                         "Upload Item Image",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),

//               /// Item Category
//               DropdownWithAddOption(
//                 label: "Item Category",
//                 isRequired: false,
//                 options: ["None","Food", "Drinks", "Desserts"],
//                 value: category,
//                 onChanged: (val) {
//                   setState(() {
//                     category = val;
//                   });
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// Sale Price
//               CustomtextFiled(
//                 controller: priceController,
//                 labelText: "Sale Price",
//                 hint: "Tap to Enter",
//                 color: Colors.blue,
//                 validatortext: "Sale price is required",
//                 width: MediaQuery.of(context).size.width,
//               ),
//               const SizedBox(height: 16),

//               /// Tax Percentage
             

//               DropdownTextField(
//                 label: "Tax Percentage",
//                 options: ["None", "5%", "10%", "15%"],
//                 value: tax,
//                 onChanged: (val) {
//                   setState(() {
//                     tax = val;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),

//               /// Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: CustomButton(
//                       text: "Save & New",
//                       backgroundColor: Colors.grey.shade300,
//                       textColor: Colors.black,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // Save & reset form
//                           nameController.clear();
//                           priceController.clear();
//                           setState(() {
//                             category = null;
//                             tax = null;
//                             favourite = false;
//                             defaultFirmTax = true;
//                           });
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Item saved & new")),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: CustomButton(
//                       text: "Save Item",
//                       backgroundColor: Colors.blue,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("Item saved")),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


















import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restro_code/Custom/customTextField';
import 'package:restro_code/Custom/custombutton.dart'; 
import 'package:restro_code/Custom/customdropfield.dart'; 

class AddMenuItemScreen extends StatefulWidget {
  const AddMenuItemScreen({super.key});

  @override
  State<AddMenuItemScreen> createState() => _AddMenuItemScreenState();
}

class _AddMenuItemScreenState extends State<AddMenuItemScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String? category;
  String? tax;

  bool defaultFirmTax = true;
  bool favourite = false;

  File? _itemImage; // 👈 store picked image

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take Photo"),
              onTap: () async {
                final XFile? pickedFile =
                    await picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() => _itemImage = File(pickedFile.path));
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () async {
                final XFile? pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() => _itemImage = File(pickedFile.path));
                }
                Navigator.pop(context);
              },
            ),
            if (_itemImage != null)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Remove Image"),
                onTap: () {
                  setState(() => _itemImage = null);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Menu Item"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Item Name
              CustomtextFiled(
                controller: nameController,
                labelText: "Item Name",
                hint: "Tap to Enter",
                color: Colors.blue,
                validatortext: "Item name is required",
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 16),

              /// ✅ Item Image Picker
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: _itemImage == null
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined,
                                  size: 40, color: Colors.grey),
                              SizedBox(height: 8),
                              Text(
                                "Upload Item Image",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _itemImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),

              /// Item Category
              DropdownWithAddOption(
                label: "Item Category",
                isRequired: false,
                options: ["None", "Food", "Drinks", "Desserts"],
                value: category,
                onChanged: (val) {
                  setState(() {
                    category = val;
                  });
                },
              ),

              const SizedBox(height: 16),

              /// Sale Price
              CustomtextFiled(
                controller: priceController,
                labelText: "Sale Price",
                hint: "Tap to Enter",
                color: Colors.blue,
                validatortext: "Sale price is required",
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 16),

              /// Tax Percentage
              DropdownTextField(
                label: "Tax Percentage",
                options: ["None", "5%", "10%", "15%"],
                value: tax,
                onChanged: (val) {
                  setState(() {
                    tax = val;
                  });
                },
              ),
              const SizedBox(height: 16),

              /// Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Save & New",
                      backgroundColor: Colors.grey.shade300,
                      textColor: Colors.black,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Save & reset form
                          nameController.clear();
                          priceController.clear();
                          setState(() {
                            category = null;
                            tax = null;
                            favourite = false;
                            defaultFirmTax = true;
                            _itemImage = null; // reset image
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item saved & new")),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      text: "Save Item",
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Item name: ${nameController.text}");
                          print("Price: ${priceController.text}");
                          print("Category: $category");
                          print("Tax: $tax");
                          print("Image: ${_itemImage?.path}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item saved")),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
