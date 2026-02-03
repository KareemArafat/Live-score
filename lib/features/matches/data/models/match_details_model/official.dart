class Official {
  Official({
    required this.id,
    required this.athleteId,
    required this.countryId,
    required this.status,
    required this.name,
    required this.nameForUrl,
  });

  final int? id;
  final int? athleteId;
  final int? countryId;
  final int? status;
  final String? name;
  final String? nameForUrl;

  factory Official.fromJson(Map<String, dynamic> json) {
    return Official(
      id: json["id"],
      athleteId: json["athleteId"],
      countryId: json["countryId"],
      status: json["status"],
      name: json["name"],
      nameForUrl: json["nameForURL"],
    );
  }
}