import 'package:flutter/material.dart';
import 'package:netlifx_cross/api_service/api_service.dart';
import 'package:netlifx_cross/models/movie.dart';

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
      body: SizedBox(
        child: FutureBuilder<List<Movie>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie> isData = snapshot.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: isData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        
                       // Text("Trending Movies",style: TextStyle(color: Colors.white),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          isData[index].poster ?? "")),
                                ),
                                //  color: Color.fromARGB(255, 27, 12, 11),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          isData[index].title ?? "Text loading..",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator(color: Colors.white,));
          },
        ),
      ),
    );
  }
}
