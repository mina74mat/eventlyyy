import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DateOrTime extends StatelessWidget {
  String iconDateOrTime;
  String eventDateOrTime;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTimeClicked;
  String? errorMessage;

  DateOrTime({
    super.key,
    required this.iconDateOrTime,
    required this.eventDateOrTime,
    required this.chooseDateOrTime,
    required this.onChooseDateOrTimeClicked,
    this.errorMessage,
  });

  //
  //   @override
  //   Widget build(BuildContext context) {
  //     var width = MediaQuery.of(context).size.width;
  //     return Row(
  //       children: [
  //         Image.asset(iconDateOrTime),
  //         SizedBox(width: width*0.02,),
  //         Text(eventDateOrTime,
  //         style:Theme.of(context).textTheme.titleLarge),
  //         Spacer(),
  //         TextButton(onPressed: (){
  //           onChooseDateOrTimeClicked();
  //         },
  //             child: Text(chooseDateOrTime,
  //             style:  TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 16,
  //               color: AppColors.primaryLight
  //             ),))
  //       ],
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(iconDateOrTime),
            SizedBox(width: width * 0.02),
            Text(
              eventDateOrTime,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                print('Pressed: $chooseDateOrTime');
                onChooseDateOrTimeClicked();
              },
              child: Text(
                chooseDateOrTime,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.primaryLight,
                ),
              ),
            ),
          ],
        ),
        if (errorMessage != null)
          Padding(
            padding: EdgeInsets.only(left: width * 0.01),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
      ],
    );
  }
}
