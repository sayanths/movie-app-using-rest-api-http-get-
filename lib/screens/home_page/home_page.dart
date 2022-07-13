import 'package:flutter/material.dart';

import 'package:netlifx_cross/screens/home_page/most_popular_shows.dart';
import 'package:netlifx_cross/screens/home_page/top_rated.dart';
import 'package:netlifx_cross/screens/home_page/trending_movies.dart';
import 'package:netlifx_cross/styles.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingMovies = [];

  List topratedmovies = [];
  List tv = [];

  final String apiKey = '317f99eb865a587f6ec824c46f5db6a5';
  final readAcessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMTdmOTllYjg2NWE1ODdmNmVjODI0YzQ2ZjVkYjZhNSIsInN1YiI6IjYyYzQzNGE4ZjFiNTcxMWZlNWVkMDQwOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BzrsAx7-N5hVVeR5RTHiBE3LdLvKAIFVV-M5MRNsVIQ';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAcessToken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingListVariable =
        await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topRatedMoviesList = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.discover.getMovies();

    setState(() {
      trendingMovies = trendingListVariable['results'];
      topratedmovies = topRatedMoviesList['results'];
      tv = tvResult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: 350,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w780/7KsqfXDECZMryX1Rv4RKsT7SIjQ.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: white,
                            size: 30,
                          ),
                          Text(
                            "List",
                            style: TextStyle(
                                color: white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: white,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          label: const Text("Play",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                      Column(
                        children: const [
                          Icon(
                            Icons.info,
                            color: white,
                          ),
                          Text("Info",
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ]),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.2),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "https://pngimg.com/uploads/netflix/netflix_PNG15.png",
                              height: 50,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.video_call,
                            color: white,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: 30,
                              width: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "TV Shows",
                            style: style,
                          ),
                          Text(
                            "Movies",
                            style: style,
                          ),
                          Text(
                            "Categories",
                            style: style,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TopRated(topRated: topratedmovies),
          TrendingMovies(trending: trendingMovies),
          PopularShows(tv: tv),
        ],
      )),
    );
  }
}

const style = TextStyle(color: white, fontWeight: FontWeight.bold,fontSize: 20);
