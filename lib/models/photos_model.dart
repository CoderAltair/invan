class Photos {
  final int albumId;
  final int id;
  final String title;
  final String thumbnailUrl;

  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });
  static List<Photos> fromJsonToList(List<dynamic> list) =>
      list.map((item) => Photos.fromJson(item)).toList();

  Photos.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        thumbnailUrl = json['thumbnailUrl'];

  Map<String, dynamic> toJson() => {
        'albumId': albumId,
        'thumbnailUrl': thumbnailUrl,
        'title': title,
        'id': id,
      };
}
