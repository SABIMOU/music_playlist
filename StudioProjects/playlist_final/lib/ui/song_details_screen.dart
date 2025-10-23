import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presenter/music_presenter.dart';
import '../data/song.dart';

class SongDetailsScreen extends StatelessWidget {
  final Song song;

  const SongDetailsScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<MusicPresenter>();

    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: song.title,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                presenter.updateSong(song, value, song.artist, song.album, song.durationInSeconds);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: song.artist,
              decoration: const InputDecoration(labelText: 'Artist'),
              onChanged: (value) {
                presenter.updateSong(song, song.title, value, song.album, song.durationInSeconds);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: song.album,
              decoration: const InputDecoration(labelText: 'Album'),
              onChanged: (value) {
                presenter.updateSong(song, song.title, song.artist, value, song.durationInSeconds);
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: song.durationInSeconds.toString(),
              decoration: const InputDecoration(labelText: 'Duration (seconds)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final duration = int.tryParse(value) ?? song.durationInSeconds;
                presenter.updateSong(song, song.title, song.artist, song.album, duration);
              },
            ),
          ],
        ),
      ),
    );
  }
}
