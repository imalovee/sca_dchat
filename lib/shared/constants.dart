import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sca_dchat_app/shared/colors.dart';

const style = TextStyle(
  fontSize: 14,
  color: AppColors.black,
  fontWeight: FontWeight.w400,
);

final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class AppTextInput extends StatelessWidget {
  const AppTextInput(
      {super.key,
      this.validator,
      this.controller,
      this.label,
      this.inputFormatter, 
      this.suffixIcon,  
      this.obscure = false});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon; 
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatter,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey.shade300,
        labelText: label,
        labelStyle: style.copyWith(
          color: Colors.grey.shade500,
          fontSize: 16,
          fontWeight: FontWeight.w400
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
            color: AppColors.appColor,
          ),
          borderRadius: BorderRadius.circular(8),
       
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 177, 15, 4),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.text, this.action, this.loading = false});

  final String text;
  final VoidCallback? action;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? loaderWidget()
        : InkWell(
            onTap: action,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.appColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: style.copyWith(
                      color: AppColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

Widget loaderWidget() => const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.appColor),
      ),
);

List imgs = [
  "https://plus.unsplash.com/premium_photo-1689539137236-b68e436248de?q=80&w=2971&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1445053023192-8d45cb66099d?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1664536392896-cd1743f9c02c?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"

];