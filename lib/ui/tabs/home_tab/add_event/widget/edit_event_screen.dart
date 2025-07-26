import 'package:eventlyyy/firebase_utils.dart';
import 'package:eventlyyy/model/event.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_elevated_button.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/event_list_provider.dart';
import 'date_or_time.dart';

class EditEventScreen extends StatefulWidget {
  final Event event;

  const EditEventScreen({super.key, required this.event});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.event.title);
    descriptionController = TextEditingController(
      text: widget.event.description,
    );
    selectedDate = DateTime(
      widget.event.dateTime.year,
      widget.event.dateTime.month,
      widget.event.dateTime.day,
    );
    selectedTime = TimeOfDay(
      hour: widget.event.dateTime.hour,
      minute: widget.event.dateTime.minute,
    );
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Event',
          style: TextStyle(
            color: AppColors.primaryLight,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.primaryLight),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.008),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(widget.event.image),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: width*0.03),
            //   child: SizedBox(height: height*0.06,
            //     child: ListView.separated(
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           return InkWell(
            //             onTap: (){
            //               selectedIndex =index;
            //               setState(() {
            //
            //               });
            //             },
            //             child: EventTabItem(
            //                 selectedTextStyle: Theme.of(context).textTheme.headlineSmall!,
            //                 unSelectedTextStyle: Theme.of(context).textTheme.headlineMedium!,
            //                 selectedBgColor:  AppColors.primaryLight,
            //                 isSelected: selectedIndex == index,
            //                 borderColor: AppColors.primaryLight,
            //                 eventName: eventsNameList[index]
            //
            //             ),
            //           ) ;
            //         },
            //         separatorBuilder: (context, index) {
            //           return SizedBox(width: width*0.01,);
            //         },
            //         itemCount: eventsNameList.length
            //
            //
            //     ),),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text(
                'Title',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: height * 0.01),

            CustomTextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) return "Please enter title";
                return null;
              },
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextFormField(
              controller: descriptionController,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return "Please enter description";
                return null;
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DateOrTime(
                iconDateOrTime: 'assets/images/icon_date.png',
                eventDateOrTime: '${selectedDate.toLocal()}'.split(' ')[0],
                chooseDateOrTime: 'Choose Date',
                onChooseDateOrTimeClicked: pickDate,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DateOrTime(
                iconDateOrTime: 'assets/images/icon_time.png',
                eventDateOrTime: selectedTime.format(context),
                chooseDateOrTime: 'Choose Time',
                onChooseDateOrTimeClicked: pickTime,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    DateTime newDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );

                    Event updatedEvent = widget.event.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                      dateTime: newDateTime,
                    );

                    await FirebaseUtils.updateEventInFireStore(updatedEvent);
                    Provider.of<EventListProvider>(
                      context,
                      listen: false,
                    ).updateEvent(updatedEvent);

                    Fluttertoast.showToast(
                      msg: "Event Updated Successfully",
                      backgroundColor: AppColors.primaryLight,
                      textColor: Colors.white,
                    );
                    Navigator.pop(context, updatedEvent);
                  }
                },
                text: 'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}
