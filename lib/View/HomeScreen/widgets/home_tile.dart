import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String director;
  final String starring;
  final String views;
  final String releaseDate;

  MovieTile({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.director,
    required this.starring,
    required this.views,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          Image.network(
            imageUrl,
            height: 100,
            width: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),

          // Movie Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Movie Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),

                // Genre, Director, Starring
                Text('Genre: $genre', style: TextStyle(fontSize: 12)),
                Text('Director: $director', style: TextStyle(fontSize: 12)),
                Text('Starring: $starring', style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),

                // Views, Date, and Votes
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$views views | Voted by 1 People',
                          style: TextStyle(fontSize: 12)),
                      Text('Release: $releaseDate',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(height: 8),

                // Watch Trailer Button
                ElevatedButton(
                  onPressed: () {
                    // Handle trailer button press
                  },
                  child: Text("Watch Trailer"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
