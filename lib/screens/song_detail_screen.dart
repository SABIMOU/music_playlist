import 'package:flutter/material.dart';
import '../models/song.dart';

class SongDetailScreen extends StatelessWidget {
  final Song song;

  const SongDetailScreen({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  song.albumImagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.music_note, size: 50);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: song.title),
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: TextEditingController(text: song.artist),
              decoration: InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: TextEditingController(text: song.album),
              decoration: InputDecoration(labelText: 'Album'),
            ),
            TextField(
              controller: TextEditingController(text: song.duration),
              decoration: InputDecoration(labelText: 'Duration'),
            ),
          ],
        ),
      ),
    );
  }
}
