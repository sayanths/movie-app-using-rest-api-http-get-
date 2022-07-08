import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingListVariable =
        await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topRatedMoviesList = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingListVariable['results'];
      topratedmovies = topRatedMoviesList['results'];
      tv = tvResult['results'];
    });
    print(trendingMovies);
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          Container(
            height: 350,
            color: Colors.red,
          ),
          TopRated(topRated: topratedmovies),
        TrendingMovies(trending: trendingMovies),
        PopularShows(tv: tv),
        
        ],
      )),
    );
  }
}
