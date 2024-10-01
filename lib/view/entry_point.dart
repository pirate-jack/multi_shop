import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/tab_index_contoller.dart';
import 'package:multi_shop/view/cart/cart_page.dart';
import 'package:multi_shop/view/home/home_page.dart';
import 'package:multi_shop/view/profile/profile_page.dart';
import 'package:multi_shop/view/search/search_page.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(TabIndexContoller());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              pageList[contoller.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: kPrimary),
                    //------ Bottom Navigation Theme Data -----//
                    child: SizedBox(
                      child: BottomNavigationBar(
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        unselectedIconTheme:
                            IconThemeData(color: Colors.black38),
                        onTap: (value) {
                          contoller.setTabIndex = value;
                        },
                        currentIndex: contoller.tabIndex,
                        items: const [
                          BottomNavigationBarItem(
                              icon: Icon(AntDesign.home), label: 'Home'),
                          BottomNavigationBarItem(
                              icon: Icon(FontAwesome.search), label: 'search'),
                          BottomNavigationBarItem(
                              icon: Badge(
                                /*label: Text('1'),*/
                                child: Icon(FontAwesome.opencart),
                              ),
                              label: 'cart'),
                          BottomNavigationBarItem(
                              icon: Icon(FontAwesome.user_circle_o),
                              label: 'profile'),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
