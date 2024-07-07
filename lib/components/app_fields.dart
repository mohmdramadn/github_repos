import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constant_strings.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.onSearchTapped,
  });

  final bool obscureText;
  final TextEditingController controller;
  final Function()? onSearchTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        cursorHeight: 38.h,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.r)),
          suffixIcon: Padding(
            padding: EdgeInsets.all(8.spMin),
            child: ElevatedButton(
              onPressed: onSearchTapped,
              child: Text(Constant.titles.search),
            ),
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}
