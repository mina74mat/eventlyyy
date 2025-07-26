import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../firebase_utils.dart';
import '../l10n/app_localizations.dart';
import '../model/event.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> eventsList = [];
  List<Event> filterEventList = [];
  List<String> eventsNameList = [];
  List<Event> favoriteEventList = [];
  int selectedIndex = 0;

  List<String> getEventNameList(BuildContext context) {
    return eventsNameList = [
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
  }

  void getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventsCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    filterEventList = eventsList;

    filterEventList.sort(
      (event1, event2) => event1.dateTime.compareTo(event2.dateTime),
    );
    notifyListeners();
  }

  void getFilterEvents() async {
    var querySnapshot = await FirebaseUtils.getEventsCollection().get();
    eventsList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    filterEventList = eventsList.where((event) {
      return event.eventName == eventsNameList[selectedIndex];
    }).toList();
    filterEventList.sort(
      (event1, event2) => event1.dateTime.compareTo(event2.dateTime),
    );

    notifyListeners();
  }

  void updateIsFavorite(Event event) {
    FirebaseUtils.getEventsCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            Fluttertoast.showToast(
              msg: "Event Updated Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        );
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
    getAllFavoriteEvent();
    notifyListeners();
  }

  void updateEvent(Event updatedEvent) {
    final index = eventsList.indexWhere((event) => event.id == updatedEvent.id);
    if (index != -1) {
      eventsList[index] = updatedEvent;
    }

    final filterIndex = filterEventList.indexWhere(
      (event) => event.id == updatedEvent.id,
    );
    if (filterIndex != -1) {
      filterEventList[filterIndex] = updatedEvent;
    }
    final favIndex = favoriteEventList.indexWhere(
      (event) => event.id == updatedEvent.id,
    );
    if (favIndex != -1) {
      if (updatedEvent.isFavorite) {
        favoriteEventList[favIndex] = updatedEvent;
      } else {
        favoriteEventList.removeAt(favIndex);
      }
    } else {
      if (updatedEvent.isFavorite) {
        favoriteEventList.add(updatedEvent);
      }
    }

    filterEventList.sort(
      (event1, event2) => event1.dateTime.compareTo(event2.dateTime),
    );

    notifyListeners();
  }

  void getAllFavoriteEvent() async {
    var querySnapshot = await FirebaseUtils.getEventsCollection().get();
    eventsList = querySnapshot.docs.map((doc) => doc.data()).toList();

    favoriteEventList = eventsList
        .where((event) => event.isFavorite == true)
        .toList();

    notifyListeners();
  }

  void changeSelectedIndex(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    selectedIndex == 0 ? getAllEvents() : getFilterEvents();
  }
}
