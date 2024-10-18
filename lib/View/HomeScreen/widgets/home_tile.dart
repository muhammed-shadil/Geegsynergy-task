import 'package:flutter/material.dart';
import 'package:geeksynergy_mechine_task/Utils/constants.dart';

class MovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final String type;

  const MovieTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 120,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text('year: $year', style: const TextStyle(fontSize: 12)),
                Text('type: $type', style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: constants.white,
                    backgroundColor: constants.secodarycolor,
                  ),
                  child: const Text("Watch Trailer"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
