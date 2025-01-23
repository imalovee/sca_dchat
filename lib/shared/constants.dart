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