import 'package:flutter/material.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.cancel),
        title: Text('Signup', style: style.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.w700
        ),),
        actions: [
          TextButton
          (onPressed: (){}, 
          child: Text('Login', style: style.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.appColor
          ),))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
           
          )
        ],
      ),
      ),
    );
  }
}