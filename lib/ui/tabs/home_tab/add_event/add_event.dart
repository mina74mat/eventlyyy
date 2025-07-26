import 'package:eventlyyy/firebase_utils.dart';
import 'package:eventlyyy/model/event.dart';
import 'package:eventlyyy/providers/event_list_provider.dart';
import 'package:eventlyyy/ui/tabs/home_tab/add_event/widget/date_or_time.dart';
import 'package:eventlyyy/ui/tabs/home_tab/widget/event_tab_item.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = 'add_event_screen';

  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  var formKey = GlobalKey<FormState>();
  int selectedIndex = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;

  TimeOfDay? selectedTime;
  String formatedTime = '';
  String selectedImage = '';
  String selectedEvent = '';
  late EventListProvider eventListProvider;
  String? dateErrorMessage;
  String? timeErrorMessage;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    eventListProvider = Provider.of<EventListProvider>(context);

    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.book_club,
    ];

    List<String> eventImagesList = [
      'assets/images/sport_image.png',
      'assets/images/birthday_image.png',
      'assets/images/meeting_image.png',
      'assets/images/gaming_image.png',
      'assets/images/work_shop_image.png',
      'assets/images/exhibition_image.png',
      'assets/images/holiday_image.png',
      'assets/images/eating_image.png',
      'assets/images/book_club_image.png',
    ];

    selectedImage = eventImagesList[selectedIndex];
    selectedEvent = eventsNameList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.primaryLight),
        centerTitle: true,
        title: Text(
          'Create Event',
          style: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    eventImagesList[selectedIndex],
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: SizedBox(
                  height: height * 0.06,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: EventTabItem(
                          selectedTextStyle: Theme.of(
                            context,
                          ).textTheme.headlineSmall!,
                          unSelectedTextStyle: Theme.of(
                            context,
                          ).textTheme.headlineMedium!,
                          selectedBgColor: AppColors.primaryLight,
                          isSelected: selectedIndex == index,
                          borderColor: AppColors.primaryLight,
                          eventName: eventsNameList[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.01);
                    },
                    itemCount: eventsNameList.length,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              SizedBox(height: height * 0.008),
              CustomTextFormField(
                hintText: 'Event Title',
                prefixIcon: Image.asset('assets/images/icon_event_title.png'),
                controller: titleController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter Title';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.016),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),

              SizedBox(height: height * 0.008),

              CustomTextFormField(
                maxLines: 4,
                hintText: 'Event Description',
                controller: descriptionController,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please enter Description';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.03),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: DateOrTime(
                  iconDateOrTime: 'assets/images/icon_date.png',
                  eventDateOrTime: 'Event Date',
                  chooseDateOrTime: selectedDate == null
                      ? 'Choose Date'
                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                  onChooseDateOrTimeClicked: chooseDate,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: DateOrTime(
                  key: ValueKey('time_field_${timeErrorMessage ?? 'no error'}'),
                  iconDateOrTime: 'assets/images/icon_time.png',
                  eventDateOrTime: 'Event Time',
                  chooseDateOrTime: selectedTime == null
                      ? 'Choose Time'
                      : formatedTime,
                  onChooseDateOrTimeClicked: chooseTime,
                  errorMessage: timeErrorMessage,
                ),
              ),

              SizedBox(height: height * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: height * 0.01,
                ),
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),

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

              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onPressed: () {
                    addEvent();
                  },
                  text: 'Add Event',
                ),
              ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    selectedDate = chooseDate;
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    if (selectedTime != null) {
      formatedTime = selectedTime!.format(context);

      setState(() {});
    }
  }

  void addEvent() {
    bool hasError = false;

    if (formKey.currentState?.validate() != true) return;

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Please choose a date'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (selectedTime == null) {
      timeErrorMessage = 'Please choose a time';
      hasError = true;
    } else {
      timeErrorMessage = null;
    }
    setState(() {});

    if (hasError) return;

    Event event = Event(
      title: titleController.text,
      image: selectedImage,
      description: descriptionController.text,
      eventName: selectedEvent,
      dateTime: selectedDate!,
      time: formatedTime,
    );

    FirebaseUtils.addEventToFireStore(event).timeout(
      Duration(seconds: 1),
      onTimeout: () {
        Fluttertoast.showToast(
          msg: "Event Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.primaryLight,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
    );
    eventListProvider.getAllEvents();

    Navigator.pop(context);
  }
}
