import 'package:flutter/material.dart';
import 'package:instantsy/list_item.dart';
import 'package:instantsy/repsoitory/fetch_data.dart';
import 'package:provider/provider.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({super.key});

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<FetchData>(context);
    return FutureBuilder(
      future: data.fetchShows(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final shows = snapshot.data;
          return ListView.builder(
              itemCount: shows!.length,
              itemBuilder: (context, i) {
                return MovieItem(
                  name: shows[i].name,
                  path: shows[i].posterPath,
                  overview: shows[i].overview,
                );
              });
        }
        return Text('no data');
      },
    );
  }
}
