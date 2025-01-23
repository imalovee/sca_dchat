import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sca_dchat_app/shared/colors.dart';

const style = TextStyle(
  fontSize: 14,
  color: AppColors.black,
  fontWeight: FontWeight.w400,
);

class AppTextInput extends StatelessWidget {
  const AppTextInput(
      {super.key,
      this.validator,
      this.controller,
      this.label,
      this.inputFormatter});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        labelText: label,
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