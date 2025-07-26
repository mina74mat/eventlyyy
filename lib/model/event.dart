class Event {
  static const String collectionName = 'Events';
  String id;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;

  Event({
    this.id = '',
    required this.title,
    required this.image,
    required this.description,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isFavorite = false,
  });

  Event.formFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        image: data['image'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
        eventName: data['eventName'],
        time: data['time'],
        isFavorite: data['isFavorite'],
      );

  Event copyWith({
    String? id,
    String? title,
    String? eventName,
    String? description,
    String? image,
    DateTime? dateTime,
    bool? isFavorite,
    String? time,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      eventName: eventName ?? this.eventName,
      description: description ?? this.description,
      image: image ?? this.image,
      dateTime: dateTime ?? this.dateTime,
      isFavorite: isFavorite ?? this.isFavorite,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventName': eventName,
      'image': image,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
