import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/common/custom_container.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/login_controller.dart';
import 'package:multi_shop/models/login_response.dart';
import 'package:multi_shop/view/auth/login_page.dart';
import 'package:multi_shop/view/auth/verification_page.dart';
import 'package:multi_shop/view/profile/widgets/profile_app_bar.dart';
import 'package:multi_shop/view/profile/widgets/profile_tile_widget.dart';
import 'package:multi_shop/view/profile/widgets/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null) {
      user = controller.getUserInfo();
    }
    if (token == null) {
      return LoginPage();
    }
    if (user!.verification == false) {
      return VerificationPage();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h), child: ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Column(
                children: [
                  UserInfoWidget(user: user),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 190.h,
                    decoration: BoxDecoration(color: kLightWhite),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          title: "My Orders",
                          icon: Ionicons.fast_food_outline,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "My Favorite Place",
                          icon: Ionicons.heart_outline,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "Review",
                          icon: Ionicons.chatbubble_outline,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "Coupons",
                          icon: MaterialCommunityIcons.tag_outline,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 190.h,
                    decoration: BoxDecoration(color: kLightWhite),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          title: "Shipping Address",
                          icon: Ionicons.location_outline,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "Service center",
                          icon: AntDesign.customerservice,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "Coupons",
                          icon: MaterialIcons.rss_feed,
                          onTap: () {},
                        ),
                        ProfileTileWidget(
                          title: "Settings",
                          icon: SimpleLineIcons.settings,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    onTap: () {
                      controller.logout();
                    },
                    text: "Logout",
                    radius: 0,
                    color: kRed,
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
