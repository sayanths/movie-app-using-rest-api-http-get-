import 'package:flutter/material.dart';
import 'package:netlifx_cross/screens/fullscreen_description/fullscreen_description.dart';
import 'package:netlifx_cross/styles.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({Key? key, required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const SizedBox(
          height: 10,
        ),
          const ModifiedText(
            text: "Top Rated Movies",
            size: 26,
            color: Colors.white,
          ),
       
          SizedBox(
            height: 265,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: topRated[index]['title']??'',
                                  overview: topRated[index]['overview'],
                                   // ignore: prefer_interpolation_to_compose_strings
                                   bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                      topRated[index]['poster_path'],
                                  vote: topRated[index]['vote_average']
                                      .toString(),
                                  first_air_date: topRated[index]['first_air_date']??'')));
                    },
                    child: SizedBox(
                      width: 250,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 171,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          topRated[index]['backdrop_path'],
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ModifiedText(
                                text:
                                    topRated[index]['title'] ?? 'text loading',
                                color: Colors.white,
                                size: 16,
                              ),
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