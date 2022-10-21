import 'package:air_shop/presentation/main/cart/cart_page.dart';
import 'package:air_shop/presentation/main/categories/cat_page.dart';
import 'package:air_shop/presentation/main/favorites/favoraites_page.dart';
import 'package:air_shop/presentation/main/home/home_page.dart';
import 'package:air_shop/presentation/main/settings_page.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/icons_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<Widget> pages =[
    HomePage(),
    CategoriesPage(),
    FavoritesPage(),
    CartPage(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteOpacity70,
      appBar: AppBar(
        leading: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p12),
            child: Text(
              AppStrings.appName,
              style: TextStyle(
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s18
              ),
            ),
          ),
        ),
        leadingWidth: 100,
        backgroundColor: ColorManager.primary,
        elevation: AppSize.s1_5,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                IconBroken.Search,
                color: ColorManager.black,
              ),
          ),
          IconButton(
              onPressed: (){},
              icon: Icon(
                IconBroken.Notification,
                color: ColorManager.black,
              ),
          ),
        ],
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: ColorManager.primary,
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(IconBroken.Home),
            title: Text(AppStrings.home),
            activeColor: ColorManager.white,
            inactiveColor: ColorManager.black
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Category),
              title: Text(AppStrings.categories),
              activeColor: ColorManager.white,
              inactiveColor: ColorManager.black
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Heart),
              title: Text(AppStrings.favorites),
              activeColor: ColorManager.white,
              inactiveColor: ColorManager.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text(AppStrings.card),
              activeColor: ColorManager.white,
              inactiveColor: ColorManager.black
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Setting),
              title: Text(AppStrings.settings),
              activeColor: ColorManager.white,
              inactiveColor: ColorManager.black
          ),
        ],
      ),
    );
  }
}