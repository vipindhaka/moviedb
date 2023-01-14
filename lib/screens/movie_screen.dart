import 'package:flutter/material.dart';
import 'package:instantsy/list_item.dart';
import 'package:instantsy/repsoitory/fetch_data.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FetchData>(context);
    return FutureBuilder(
      future: data.fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView.builder(
              itemCount: movies!.length,
              itemBuilder: (context, i) {
                return MovieItem(
                    name: movies[i].originalTitle,
                    path: movies[i].posterPath,
                    overview: movies[i].overview);
              });
        }
        return Text('no data');
      },
    );
  }
}
