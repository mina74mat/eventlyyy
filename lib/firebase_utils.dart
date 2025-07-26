import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventlyyy/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.formFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFireStore(Event event) {
    var eventsCollection = getEventsCollection();
    DocumentReference<Event> docRef = eventsCollection.doc();

    event.id = docRef.id;
    // getEventsCollection().doc().set(event);
    return docRef.set(event);
  }

  static Future<void> updateEventInFireStore(Event event) async {
    return await getEventsCollection()
        .doc(event.id)
        .update(event.toFireStore());
  }
}
