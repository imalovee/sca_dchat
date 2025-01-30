import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sca_dchat_app/features/authentication/viewModel/auth_provider.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';

import '../../../shared/notification/app_route_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
    bool obscureText = false;
 
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: Text('Login', style: style.copyWith(
          fontSize: 25,
          fontWeight: FontWeight.w700
        ),),
        actions: [
          TextButton
          (onPressed: (){
             AppRouter.pushReplace(AppRouteStrings.registerScreen);
          }, 
          child: Text('Signup', style: style.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.appColor
          ),))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Consumer<AuthProvider>(
        builder: (BuildContext context, AuthProvider authProvider, Widget? child) {
          return  Form(
          key: formKey,
          child: Column(
            children: [
               AppTextInput(
                  label: 'Email Address',
                    controller: emailController,
                    validator: (a) {
                      if(!emailRegex.hasMatch(a ?? "")){
                        return 'Invalid Email';
                      }
                    },
                ),
                SizedBox(height: 12,),
                AppTextInput(
                  label: 'Password',
                    controller: passwordController,
                    inputFormatter: [
                              FilteringTextInputFormatter.deny(RegExp(r' '))
                            ],
                    validator: (a) {
                      (a ?? '').length > 6 ? null : "Invald Password";
                    },
                    obscure: obscureText,
                    suffixIcon: TextButton(onPressed: (){
                        setState(() {
                          obscureText = !obscureText;
                        });
                    }, 
                    child: Text('show', style: style.copyWith(
                      fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: AppColors.appColor
                    ),)),
                ),
                SizedBox(
                  height: 70,
                ), 
                AppButton(
                  loading: authProvider.loading,
              text: 'Login',
              action: ()async{
                if (formKey.currentState?.validate() ?? false) {
                  final req = await authProvider.login(email: emailController.text, 
                  password: passwordController.text
                  );
                  if(req.error != null){
                      AppRouter.toastMessage(req.error ?? "");
                  }else{
                       AppRouter.pushClear(AppRouteStrings.homeScreen);
                  }
                
                }
              },
              ),
               SizedBox(height: 16,),
              Text('Forgot your password?',
              style: style.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.appColor
              ),
              textAlign: TextAlign.center,
              )
            ],
          ),
        );
  }),
      ),
    );
  }
}