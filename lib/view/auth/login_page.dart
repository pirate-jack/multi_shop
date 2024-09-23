import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/login_controller.dart';
import 'package:multi_shop/models/login.dart';
import 'package:multi_shop/view/auth/registration_page.dart';
import 'package:multi_shop/view/auth/widgets/email_text_field.dart';
import 'package:multi_shop/view/auth/widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final FocusNode _passwordFocusNode = FocusNode();

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: true,
        title: const Text(
          "L O G I N",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RegistrationPage(),
                                transition: Transition.fadeIn,
                                duration: Duration(milliseconds: 800),
                              );
                            },
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomButton(
                      color: kSecondary,
                      text: "L O G I N",
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          LoginRequest model = LoginRequest(
                              email: _emailController.text,
                              password: _passwordController.text);
                       String data = loginRequestToJson(model);
                       controller.loginFunction(data);

                       print(data);
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
