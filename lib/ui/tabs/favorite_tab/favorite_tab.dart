import 'package:eventlyyy/providers/event_list_provider.dart';
import 'package:eventlyyy/ui/tabs/widgets/custom_text_form_field.dart';
import 'package:eventlyyy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_tab/widget/event_item.dart';

class FavoriteTab extends StatefulWidget {
  FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  TextEditingController searchController = TextEditingController();
  late EventListProvider eventListProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventListProvider.getAllFavoriteEvent();
    },);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventListProvider = Provider.of<EventListProvider>(context);
    if (eventListProvider.favoriteEventList.isEmpty) {
      eventListProvider.getAllFavoriteEvent();
    }
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
              itemCount: eventListProvider.favoriteEventList.length,
              itemBuilder: (context, index) {
                return EventItem(
                  event: eventListProvider.favoriteEventList[index],);
              },
            ),
          ),
        ],
      ),
    );
  }
}
