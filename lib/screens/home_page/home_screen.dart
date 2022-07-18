import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlifx_cross/api_service/api_service.dart';
import 'package:netlifx_cross/models/movie.dart';
import 'package:netlifx_cross/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Service serviceApi = Service();

  late Future<List<Movie>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceApi.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
            const Text(
              "Trending Movies",
              style: TextStyle(color: white),
            ),
            Expanded(child: TrendingMovies(listData: listData)),
          ],
        ),
      ),
    );
  }
}

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final Future<List<Movie>> listData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Movie> isData = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: isData.length,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${isData[index].poster ?? ""}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${isData[index].poster ?? ""}'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      },
    );
  }
}
