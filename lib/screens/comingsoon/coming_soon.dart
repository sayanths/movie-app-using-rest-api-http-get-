import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlifx_cross/api_service/api_service.dart';
import 'package:netlifx_cross/models/movie.dart';
import 'package:netlifx_cross/styles.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  Service serviceApi = Service();

  late Future<List<Movie>> listData;

  @override
  void initState() {
    super.initState();
    listData = serviceApi.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Everyone watching",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie> isData = snapshot.data!;
              return ListView.builder(
                  itemCount: isData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        kHeight,
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isData[index].title ?? "Text Loading..",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              kHeight,
                              Text(
                                isData[index].overview ?? "",
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              kHeight,
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage('https://image.tmdb.org/t/p/w500${isData[index].poster ?? ""}'),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                      child: const Icon(
                                        CupertinoIcons.volume_off,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          },
        ),
      ),
    );
  }
}

// class EveryOneWatching extends StatelessWidget {
//   const EveryOneWatching({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

//  return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox(
//         child: FutureBuilder<List<Movie>>(
//           future: listData,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<Movie> isData = snapshot.data!;
//               return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: isData.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: [
                        
//                        // Text("Trending Movies",style: TextStyle(color: Colors.white),),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image: NetworkImage(
//                                           isData[index].poster ?? "")),
//                                 ),
//                                 //  color: Color.fromARGB(255, 27, 12, 11),
//                                 width: MediaQuery.of(context).size.width / 2,
//                                 height: 200,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           isData[index].title ?? "Text loading..",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return const Center(child: CircularProgressIndicator(color: Colors.white,));
//           },
//         ),
//       ),
//     );