import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sca_dchat_app/features/authentication/viewModel/auth_provider.dart';
import 'package:sca_dchat_app/shared/colors.dart';
import 'package:sca_dchat_app/shared/constants.dart';
import 'package:sca_dchat_app/shared/notification/app_route.dart';
import 'package:sca_dchat_app/shared/notification/app_route_strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController firstNameController = TextEditingController();
   TextEditingController lastNameController = TextEditingController();
  bool obscureText = false;
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
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
          (onPressed: (){
            AppRouter.pushReplace(AppRouteStrings.loginScreen);
          }, 
          child: Text('Login', style: style.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.appColor
          ),))
        ],
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Consumer<AuthProvider>(
        builder: (BuildContext context, AuthProvider authProvider, Widget? child) { 
          return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                     Row(
               children: [
                Expanded
                (child: AppTextInput(
                  label: 'First Name',
                  controller: firstNameController,
                  validator: (a) {
                   (a ?? "").length > 3? null : 'Invalid name';
                  },
                )),
                SizedBox(width: 12.w,),
                Expanded
                (child: AppTextInput(
                  label: 'Last Name',
                  controller: lastNameController,
                  validator: (a) {
                    (a ?? "").length > 3? null : 'Invalid name';
                  },
                ))
               ],
              ),
              SizedBox(height: 12.h,),
              AppTextInput(
                label: 'Email Address',
                  controller: emailController,
                  validator: (a) {
                    if(!emailRegex.hasMatch(a ?? "")){
                      return 'Invalid Email';
                    }
                  },
              ),
              SizedBox(height: 12.h,),
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
                    fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.appColor
                  ),)),
              ),
                ],
              ),
            ),
          
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked, 
                  onChanged: (newValue){
                      setState(() {
                        newValue = isChecked;
                      });
                  }),
                  Text('I would like to receive your newsletter \nand other promotional information.',
                  style: style.copyWith(
                    fontSize: 15,
        
                  ),)
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            AppButton(
              loading: authProvider.loading  ,
              text: 'Sign Up',
              action: ()async{
                if (formKey.currentState?.validate() ?? false) {
                  final req = await authProvider.register(
                    firstName: firstNameController.text ,
                    lastName: lastNameController.text,
                     email: emailController.text,
                      password: passwordController.text
                      );
                      if(req.error != null){
                        AppRouter.toastMessage(req.error ?? "");
                      }else{
                        AppRouter.pushClear(AppRouteStrings.loginScreen);
                      }
                }
              },
              ),
             
          ],
        );
  }),
      ),
    );
  }
}