import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../home_tab/widget/event_item.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: height * 0.03),
          CustomTextFormField(
            colorBorderSide: AppColors.primaryLight,
            hintText: 'Search For Event',
            hintStyle: TextStyle(color: AppColors.primaryLight),
            controller: searchController,
            prefixIcon: Image.asset('assets/images/icon_search.png'),
          ),

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
