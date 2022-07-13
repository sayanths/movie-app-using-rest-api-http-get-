import 'package:flutter/material.dart';
import 'package:netlifx_cross/styles.dart';

class Description extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String name, overview, bannerUrl, posterUrl, vote, first_air_date;
  const Description(
      {Key? key,
      required this.name,
      required this.overview,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      // ignore: non_constant_identifier_names
      required this.first_air_date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(children: [
                Positioned(
                    child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerUrl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                  bottom: 10,
                    child: ModifiedText(
                        text: 'Average Rating$vote',
                        color: Colors.white,
                        size: 15)),
              ]),
            ),
            const SizedBox(height: 15,),
            Container(padding: const EdgeInsets.all(10),
            // ignore: prefer_if_null_operators, unnecessary_null_comparison
            child: ModifiedText(text: name!=null? name :'Not Loaded', color: Colors.white, size: 24),),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Releasing on -$first_air_date', color: Colors.white, size: 16),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.network(posterUrl),
                ),
                Flexible(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ModifiedText(text: overview, color: Colors.white, size: 18),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
