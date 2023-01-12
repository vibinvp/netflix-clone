import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Trending {
  @JsonKey(name: "poster_path")
  final String image;

  Trending({required this.image});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return _$TrendingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class Upcoming {
  @JsonKey(name: "poster_path")
  final String image;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "release_date")
  final String date;

  @JsonKey(name: "overview")
  final String overview;

  Upcoming({required this.image, required this.date, required this.title, required this.overview});

  factory Upcoming.fromJson(Map<String, dynamic> json) {
    return _$UpcomingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingToJson(this);
}
// class UpComing{
//   String title;
//   String image;
//   String overview;

// UpComing({required this.title, required this.image, required this.overview});

// static UpComing fromJson(Map<String,dynamic> json) {
//   return UpComing(title: json['title'], image: json['poster_path'], overview: json['overview']);
// }

// }