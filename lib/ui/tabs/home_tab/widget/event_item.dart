import 'package:eventlyyy/model/event.dart';
import 'package:eventlyyy/providers/event_list_provider.dart';
import 'package:eventlyyy/ui/tabs/home_tab/details/event_details_screen.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  Event event;

  EventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventListProvider = Provider.of<EventListProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EventDetailsScreen(event: event)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.045,
          vertical: height * 0.01,
        ),
        height: height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 4, color: AppColors.primaryLight),
          image: DecorationImage(
            image: AssetImage(event.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: width * 0.03, top: height * 0.015),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${event.dateTime.day}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  Text(
                    DateFormat('MMM').format(event.dateTime),
                    // '${event.dateTime.month}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${event.title}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),

                  InkWell(
                    onTap: () {
                      eventListProvider.updateIsFavorite(event);
                    },
                    child: event.isFavorite == true
                        ? ImageIcon(
                            AssetImage('assets/images/is_fav_selected.png'),
                            color: AppColors.primaryLight,
                          )
                        : ImageIcon(
                            AssetImage('assets/images/fav_iconnn.png'),
                            color: AppColors.primaryLight,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
