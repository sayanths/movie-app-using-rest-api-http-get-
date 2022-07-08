import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netlifx_cross/screens/fullscreen_description/fullscreen_description.dart';
import 'package:netlifx_cross/styles.dart';

// class TrendingMovies extends StatelessWidget {
//   final List trending;
//   const TrendingMovies({Key? key, required this.trending}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ModifiedText(
//               text: "Trending Movies",
//               color: Color.fromARGB(255, 14, 12, 12),
//               size: 24),
//           Container(
//             child: ListView.builder(
//                 itemCount: trending.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: (){},
//                     child: Container(
//                       width: 140,
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(image: NetworkImage('http://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path']))
//                             ),
//                           ),
//                           SizedBox(
//                             child: ModifiedText(text: trending[index]['original_title'] ?? 'text loading', color: Colors.black, size: 16),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );

//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Trending Movies",
            size: 26,
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: trending[index]['title'] ?? '',
                                  overview: trending[index]['overview'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                  // ignore: prefer_interpolation_to_compose_strings
                                  posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path'],
                                  vote: trending[index]['vote_average']
                                      .toString(),
                                  first_air_date: trending[index]
                                          ['first_air_date'] ??
                                      '')));
                    },
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 160,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['backdrop_path'],
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            child: ModifiedText(
                              text: trending[index]['title'] ?? 'text loading',
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
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
