import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/http_services.dart';
import 'package:netflix_clone/api/models.dart';
import 'package:netflix_clone/api/tmdb_api.dart';
import 'package:netflix_clone/constants/colors/colors.dart';
import 'package:netflix_clone/constants/widgets/constant_widgets.dart';
import 'package:netflix_clone/pages/search/widgets/widgets.dart';


// ignore: unnecessary_null_in_if_null_operators


class SearchPage extends StatefulWidget {
 const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
// ignore: unnecessary_null_in_if_null_operators

String? results;
  bool search = false;
  final TextEditingController controller = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    
    String searchresult ="https://api.themoviedb.org/3/search/tv?api_key=1567a7f85ee7cc55e7393d5fff815752&language=en-US&page=1&query=$results&include_adult=false";
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: controller,
                onChanged: (value) {
                  
                  
                  setState(() {
                    
                    

                  
                    search = true;
                    results=value;
                    print("fucccccccc....................$results");
                  });
                },
                onSuffixTap: () {
                  setState(() {
                    search = false;
                    controller.clear();
                  });
                },
                backgroundColor: backgroundGrey.withOpacity(0.4),
                prefixIcon:const Icon(
                  CupertinoIcons.search,
                  color: backgroundGrey,
                ),
                suffixIcon:const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: backgroundGrey,
                ),
                style:const TextStyle(
                  color: backgroundWhite,
                ),
              ),
              Expanded(
                // child: SearchList(),
                child: search == false
                    ? FutureBuilder(
                        future: HttpServices().getUpcoming(TMDB.upComing),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> list = snapshot.data??[];
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kVerticalSpace,
                                const SearchTitle(title: 'Top Searches'),
                                kVerticalSpace,
                                Expanded(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        SearchListTile(
                                      image: '${list[index].image}',
                                      title: '${list[index].title}',
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox.fromSize(
                                      size:const Size(0, 8),
                                    ),
                                    itemCount: list.length.clamp(0, 10),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column();
                          }
                        },
                      )
                    : FutureBuilder(
                        future: HttpServices().getTrending(searchresult),
                        builder: (context, AsyncSnapshot snapshot) {
                          List<dynamic> imageList = snapshot.data??[];
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kVerticalSpace,
                                const SearchTitle(title: 'Movies & TV'),
                                kVerticalSpace,
                                Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 3,
                                    shrinkWrap: true,
                                    mainAxisSpacing: 7,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 1 / 1.5,
                                    children: List.generate(
                                      imageList.length,
                                      (index) {
                                        return SearchGridTile(
                                          image: '${imageList[index].image}',
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column();
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
