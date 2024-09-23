import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/registration_controller.dart';
import 'package:multi_shop/models/registration.dart';
import 'package:multi_shop/view/auth/widgets/email_text_field.dart';
import 'package:multi_shop/view/auth/widgets/password_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: true,
        title: const Text(
          "R E G I S T R A T I O N",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: kWhite),
        ),
      ),
      body: BackgroundContainer(
        color: kWhite,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Lottie.asset("assets/anime/delivery.json"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: "User Name",
                      prefixIcon: Icon(
                        Ionicons.person,
                        color: kGrayLight,
                        size: 20.h,
                      ),
                      controller: _userNameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    EmailTextField(
                      hintText: "Email",
                      prefixIcon: Icon(
                        AntDesign.mail,
                        color: kGrayLight,
                        size: 20.h,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextField(
                      Pcontroller: _passwordController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      color: kSecondary,
                      text: "R E G I S T E R",
                      onTap: () {
                        if (_userNameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          Registration model = Registration(
                              username: _userNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                         String data = registrationToJson(model);
                         controller.registrationFunction(data);
                         print( data);
                        }
                      },
                      btnHeight: 35.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
