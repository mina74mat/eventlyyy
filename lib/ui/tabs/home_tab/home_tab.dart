import 'package:eventlyyy/l10n/app_localizations.dart';
import 'package:eventlyyy/providers/event_list_provider.dart';
import 'package:eventlyyy/ui/tabs/home_tab/widget/event_item.dart';
import 'package:eventlyyy/ui/tabs/home_tab/widget/event_tab_item.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {


  @override
  Widget build(BuildContext context) {
    var eventsListProvider = Provider.of<EventListProvider>(context);
    eventsListProvider.getEventNameList(context);

    if (eventsListProvider.eventsList.isEmpty) {
      eventsListProvider.getAllEvents();
    }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


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
                length: eventsListProvider.eventsNameList.length,
                child: TabBar(
                  onTap: (index) {
                    eventsListProvider.changeSelectedIndex(index);
                  },
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: eventsListProvider.eventsNameList.map((eventName) {
                    return EventTabItem(
                      selectedTextStyle: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium!,
                      unSelectedTextStyle: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!,
                      selectedBgColor: Theme
                          .of(context)
                          .focusColor,
                      isSelected:
                      eventsListProvider.selectedIndex ==
                          eventsListProvider.eventsNameList.indexOf(eventName),
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
            child: eventsListProvider.filterEventList.isEmpty ?
            Center(child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text('No Events Found',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),),
            ),) :

            ListView.builder(
              itemCount: eventsListProvider.filterEventList.length,
              itemBuilder: (context, index) {
                return EventItem(
                  event: eventsListProvider.filterEventList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}
