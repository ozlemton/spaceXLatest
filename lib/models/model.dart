
class SpaceX {
  String? id;
  String? name;
  String? details;
  Map? links;
  Map? patch;
  String? wikiLink;
  String? youtubeId;
  int? flightNumber;
  List? crewNumbers;

  SpaceX(
      {this.id,
      this.name,
      this.details,
      this.links,
      this.patch,
      this.wikiLink,
      this.youtubeId,
      this.flightNumber,
      this.crewNumbers});

  SpaceX.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    links = json['links'];
    patch = json['links']['patch'];
    wikiLink = json['links']['wikipedia'];
    youtubeId = json['links']['youtube_id'];
    flightNumber = json['flight_number'];
    crewNumbers = json['crew'];
  }
}
