import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/ui/tabs/home_tab/widget/event_item.dart';
import 'package:eventlyyy/ui/tabs/home_tab/widget/event_tab_item.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // toolbarHeight: height*0.2,
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcome_back,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: height * 0.005),

                Text(
                  'Mina',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),

            Spacer(),
            ImageIcon(
              AssetImage('assets/images/sun.png'),
              size: 30,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.01),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'EN',
                style: TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        bottom: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: height * 0.095,
          title: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/map_iconnn.png'),
                  SizedBox(width: width * 0.02),
                  Text(
                    'Cairo , Egypt',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              DefaultTabController(
                length: eventsNameList.length,
                child: TabBar(
                  onTap: (index) {
                    selectedIndex = index;

                    setState(() {});
                  },
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: eventsNameList.map((eventName) {
                    return EventTabItem(
                      isSelected:
                          selectedIndex == eventsNameList.indexOf(eventName),
                      eventName: eventName,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return EventItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
