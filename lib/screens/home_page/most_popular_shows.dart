import 'package:flutter/material.dart';
import 'package:netlifx_cross/screens/fullscreen_description/fullscreen_description.dart';
import 'package:netlifx_cross/styles.dart';

class PopularShows extends StatelessWidget {
  final List tv;
  const PopularShows({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          ModifiedText(
            text: "Popular Shows",
            size: 26,
            color: Colors.white,
          ),
         
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: tv[index]['title']??'',
                                  overview: tv[index]['overview'],
                                   bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['poster_path'],
                                  vote: tv[index]['vote_average']
                                      .toString(),
                                  first_air_date: tv[index]['first_air_date']??'')));
                    },
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            child: ModifiedText(
                              text: tv[index]['original_name'] ?? 'text loading',
                              color: Colors.white,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
