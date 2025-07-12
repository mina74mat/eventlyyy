import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/ui/tabs/favorite_tab/favorite_tab.dart';
import 'package:eventlyyy/ui/tabs/home_tab/home_tab.dart';
import 'package:eventlyyy/ui/tabs/map_tab/map_tab.dart';
import 'package:eventlyyy/ui/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(), MapTab(), FavoriteTab(), ProfileTab()
  ];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme
            .of(context)
            .primaryColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            items: [
              builtBottomNavigationBarItem(
                selectedIconName: 'assets/images/home_selected.png',
                unSelectedIconName: 'assets/images/home_icon.png',
                label: AppLocalizations.of(context)!.home,
                index: 0,
              ),
              builtBottomNavigationBarItem(
                  index: 1,
                  selectedIconName: 'assets/images/map_selected.png',
                  unSelectedIconName: 'assets/images/map_iconnn.png',
                  label: AppLocalizations.of(context)!.map),

              builtBottomNavigationBarItem(
                  index: 2,
                  selectedIconName: 'assets/images/fav_selected.png',
                  unSelectedIconName: 'assets/images/fav_iconnn.png',
                  label: AppLocalizations.of(context)!.love),

              builtBottomNavigationBarItem(
                  index: 3,
                  selectedIconName: 'assets/images/profile_selected.png',
                  unSelectedIconName: 'assets/images/profile_icon.png',
                  label: AppLocalizations.of(context)!.profile),
            ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },

        child: Icon(Icons.add, color: Colors.white, size: 35,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      body: tabs[selectedIndex],


    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem(
      { required String selectedIconName,
        required String unSelectedIconName,
        required String label,
        required int index}) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(
          selectedIndex == index ? selectedIconName : unSelectedIconName)),
      label: label,

    );
  }
}
