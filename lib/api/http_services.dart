import 'dart:convert';

import 'package:http/http.dart';
import 'package:netflix_clone/api/models.dart';

class HttpServices {
  Future<List<dynamic>> getTrending(String listType) async {
    Response response = await get(Uri.parse(listType));
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      // print(decodedJson);
      List<dynamic> list = decodedJson['results']
          .map((item) => Trending.fromJson(item))
          .toList();
      return list;
    } else {
      throw 'Couldn\t get list';
    }
  }

  Future<List<dynamic>> getUpcoming(String listType) async {
    Response res = await get(Uri.parse(listType));
    if (res.statusCode == 200) {
      final decodedJson = jsonDecode(res.body);
      // print(decodedJson);
      List<dynamic> list = decodedJson['results']
          .map((item) => Upcoming.fromJson(item))
          .toList();
      return list;
    } else {
      throw 'Couldn\t get list';
    }
  }


}
// import 'dart:convert';


// import 'package:http/http.dart' as http;
// import 'package:netflix_clone/model/model.dart';

//  List releaselist = [];
// var release = Uri.parse(
//    'https://api.themoviedb.org/3/movie/upcoming?api_key=1567a7f85ee7cc55e7393d5fff815752&language=en-US&page=1');




//  Future<List<UpComing>> getUpcomingMovie() async {
//   var response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=1567a7f85ee7cc55e7393d5fff815752&language=en-US&page=1'));
//   var data = jsonDecode(response.body);
//   List<dynamic> data1 = data['results'];
//   List<UpComing> list = data1.map((e) => UpComing.fromJson(e)).toList();
//   return list;
//   }
  


//   List trendingList = [];
// var trending = Uri.parse(
//     'https://api.themoviedb.org/3/trending/all/day?api_key=c64d3d35dc7460fa948eac12b9a608ae');

//   Future getTrending() async {
//   var response = await http.get(trending);
//   Map data = json.decode(response.body);
//   trendingList = data['results'];
//   return trendingList;
// }
