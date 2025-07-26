import 'package:flutter/material.dart';

import '../../../../model/event.dart';
import '../../../../utils/app_colors.dart';
import '../add_event/widget/edit_event_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = 'event_details_screen';
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Details Screen',
          style: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.primaryLight),

        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.primaryLight),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditEventScreen(event: event),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (event.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(event.image),
                ),

              SizedBox(height: height * 0.02),

              Text(
                event.title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryLight,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: height * 0.02),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.008,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryLight,
                      ),

                      child: Image.asset(
                        'assets/images/icon_date.png',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: width * 0.02),

                    SizedBox(width: width * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${event.dateTime.day}/${event.dateTime.month}/${event.dateTime.year}",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: height * 0.006),

                        Text(
                          "${event.dateTime.hour.toString().padLeft(2, '0')}:${event.dateTime.minute.toString().padLeft(2, '0')}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    SizedBox(width: 8),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),

              Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.01),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),

                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.015,
                        horizontal: width * 0.03,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.primaryLight,
                      ),
                      child: Image.asset('assets/images/icon_location.png'),
                    ),
                    Text(
                      'Choose Event Location',
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.primaryLight,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),

              Image.asset('assets/images/frame99.png', width: double.infinity),

              SizedBox(height: height * 0.02),

              Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: height * 0.01),
              Text(
                event.description,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 16),

              if (event.isFavorite)
                Row(
                  children: [
                    Text(
                      'Favorite',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
