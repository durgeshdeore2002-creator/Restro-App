import 'package:flutter/material.dart';
import 'package:restro_code/Custom/customTextField';
import 'package:restro_code/Custom/custombutton.dart';


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController billController = TextEditingController(text: "2");
  final TextEditingController tableController = TextEditingController(text: "none");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController discountController = TextEditingController(text: "0.0");
  final TextEditingController serviceChargeController = TextEditingController(text: "0.0");

  String discountType = "Percentage";
  String paymentType = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Bill number (disabled)
              const Text("Bill Number"),
              const SizedBox(height: 5),
              CustomtextFiled(
                width: MediaQuery.of(context).size.width,
                controller: billController,
                color: Colors.blue,
                textcolor: Colors.grey,
                validatortext: "",
              ),
              const SizedBox(height: 16),

              // Table number
              const Text("Table Number"),
              const SizedBox(height: 5),
              CustomtextFiled(
                width: MediaQuery.of(context).size.width,
                controller: tableController,
                color: Colors.blue,
                hint: "1",
                validatortext: "Enter table number",
              ),
              const SizedBox(height: 16),

              // Customer name
              const Text("Customer Name"),
              const SizedBox(height: 5),
              CustomtextFiled(
                width: MediaQuery.of(context).size.width,
                controller: nameController,
                color: Colors.blue,
                hint: "Tap To Enter",
                validatortext: "Enter customer name",
              ),
              const SizedBox(height: 16),

              // Phone number
              const Text("Phone Number"),
              const SizedBox(height: 5),
              CustomtextFiled(
                width: MediaQuery.of(context).size.width,
                controller: phoneController,
                color: Colors.blue,
                hint: "Tap To Enter",
                validatortext: "Enter phone number",
              ),
              const SizedBox(height: 16),

              // Discount with dropdown
              const Text("Discount"),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: CustomtextFiled(
                      width: MediaQuery.of(context).size.width,
                      controller: discountController,
                      color: Colors.blue,
                      hint: "0.0",
                      validatortext: "",
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("%"),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: discountType,
                    underline: const SizedBox(),
                    items: ["Percentage", "Flat"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        discountType = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Service charge
              const Text("Service Charge"),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: CustomtextFiled(
                      controller: serviceChargeController,
                      color: Colors.blue,
                      hint: "0.0",
                      validatortext: "",
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text("%"),
                ],
              ),
              const SizedBox(height: 16),

              // Payment method
              const Text("Payment Received In"),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: paymentType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                items: ["Cash", "Card", "UPI"]
                    .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    paymentType = value!;
                  });
                },
              ),
              const SizedBox(height: 32),

              // Save button
              CustomButton(
                text: "Save Order Details",
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // ✅ Save logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order details saved!")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
