class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.shortName,
    required this.capacity,
    required this.attendance,
    required this.googlePlaceId,
  });

  final int? id;
  final String? name;
  final String? shortName;
  final int? capacity;
  final int? attendance;
  final String? googlePlaceId;

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"],
      name: json["name"],
      shortName: json["shortName"],
      capacity: json["capacity"],
      attendance: json["attendance"],
      googlePlaceId: json["googlePlaceId"],
    );
  }
}
