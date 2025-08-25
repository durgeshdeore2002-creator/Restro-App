import 'package:flutter/material.dart';

class CustomText extends StatefulWidget{

  String text = '';
  double? size = 12;
  FontWeight fontWeight;
  Color? color = Colors.black;
  CustomText({super.key,required this.text,required this.fontWeight,this.size,this.color});

  @override
  State createState()=> _CustomTextState();
}

class _CustomTextState extends State<CustomText>{

  @override
  Widget build(BuildContext context){
    return Text(
      widget.text,
      style: TextStyle(
        fontWeight: widget.fontWeight,  
        fontSize: widget.size,
        color: widget.color
      ),
    );
  }
}