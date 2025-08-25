import 'package:flutter/material.dart';
import 'package:restro_code/Custom/customTextField';
import 'package:restro_code/Custom/custombutton.dart';
import 'package:restro_code/Custom/customdropfield.dart';

class BusinessDetailsPage extends StatefulWidget {
  const BusinessDetailsPage({super.key});

  @override
  State<BusinessDetailsPage> createState() => _BusinessDetailsPageState();
}

class _BusinessDetailsPageState extends State<BusinessDetailsPage> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController upiController = TextEditingController();
  final TextEditingController fssaiController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController footerMsgController =
      TextEditingController(text: "Thank you for doing business with us.");
  final TextEditingController addressController = TextEditingController();

  String? selectedTaxSlab;
  String? selectedBusinessType;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Business Name
            CustomtextFiled(
              controller: businessNameController,
              labelText: "Business name",
              hint: "Tap to Enter",
              validatortext: "Business name is required",
              color: Colors.blue,
            ),
            const SizedBox(height: 16),

            /// Phone
            CustomtextFiled(
              controller: phoneController,
              labelText: "Phone Number *",
              hint: "+91",
              validatortext: "Phone number is required",
              color: Colors.blue,
            ),
            const SizedBox(height: 16),

            /// Upload Logo
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: const [
                  Icon(Icons.upload_file, size: 40, color: Colors.grey),
                  SizedBox(height: 8),
                  Text("Upload Business Logo",
                      style: TextStyle(color: Colors.black54)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// UPI ID
            CustomtextFiled(
              controller: upiController,
              labelText: "UPI ID",
              hint: "Tap to Enter",
              color: Colors.blue,
            ),
            const SizedBox(height: 4),
            const Text("ℹ This will be used to print QR on bills",
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 16),

            /// Tax Slab Dropdown
            DropdownWithAddOption(
              label: "Tax Slab",
              options: ["None", "5%", "12%", "18%", "28%"],
              value: selectedTaxSlab,
              onChanged: (val) => setState(() => selectedTaxSlab = val),
            ),
            const SizedBox(height: 16),

            /// FSSAI Number
            CustomtextFiled(
              controller: fssaiController,
              labelText: "FSSAI Number",
              hint: "Tap to Enter",
              color: Colors.blue,
            ),
            const SizedBox(height: 16),

            /// GST Number
            CustomtextFiled(
              controller: gstController,
              labelText: "GSTIN Number",
              hint: "Tap to Enter",
              color: Colors.blue,
            ),
            const SizedBox(height: 16),

            /// Footer Message
            CustomtextFiled(
              controller: footerMsgController,
              labelText: "Custom Footer Message on Bills",
              color: Colors.blue,
              maxLines: 2,
            ),
            const SizedBox(height: 16),

            /// Business Address
            CustomtextFiled(
              controller: addressController,
              labelText: "Business Address",
              hint: "Tap to Enter",
              color: Colors.blue,
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            /// Business Type Dropdown
            DropdownWithAddOption(
              label: "Business Type",
              options: ["None", "Retail", "Restaurant", "Services"],
              value: selectedBusinessType,
              onChanged: (val) => setState(() => selectedBusinessType = val),
            ),
            const SizedBox(height: 16),

            /// Business Category Dropdown
            DropdownWithAddOption(
              label: "What is your business category?",
              options: ["Food", "Clothing", "Electronics", "Other"],
              value: selectedCategory,
              onChanged: (val) => setState(() => selectedCategory = val),
            ),
            const SizedBox(height: 24),

            /// Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Cancel",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    hasBorder: true,
                    borderColor: Colors.black26,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: "Update Details",
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      // save logic
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
