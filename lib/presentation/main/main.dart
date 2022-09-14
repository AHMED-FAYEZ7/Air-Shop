import 'package:air_shop/presentation/main/card_page.dart';
import 'package:air_shop/presentation/main/categories_page.dart';
import 'package:air_shop/presentation/main/favoraites_page.dart';
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
    CardPage(),
    SettingsPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        leadingWidth: 90,
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
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
            activeColor: ColorManager.primary,
            inactiveColor: ColorManager.grey
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Category),
              title: Text(AppStrings.categories),
              activeColor: ColorManager.primary,
              inactiveColor: ColorManager.grey
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Heart),
              title: Text(AppStrings.favorites),
              activeColor: ColorManager.primary,
              inactiveColor: ColorManager.grey
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Chart),
              title: Text(AppStrings.card),
              activeColor: ColorManager.primary,
              inactiveColor: ColorManager.grey
          ),
          BottomNavyBarItem(
              icon: Icon(IconBroken.Setting),
              title: Text(AppStrings.settings),
              activeColor: ColorManager.primary,
              inactiveColor: ColorManager.grey
          ),
        ],
      ),
    );
  }
}