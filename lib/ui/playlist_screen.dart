import 'package:flutter/material.dart';
import '../data/song.dart';

class PlaylistScreen extends StatelessWidget {
  final List<Song> selectedSongs;

  const PlaylistScreen({super.key, required this.selectedSongs});

  void _simulateShare() {
    print('Playlist partagée: ${selectedSongs.map((s) => s.title).toList()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
      ),
      body: Column(
        children: [
          // Image placeholder pour la playlist
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[200],
            child: const Icon(Icons.queue_music, size: 80, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: selectedSongs.length,
              itemBuilder: (context, index) {
                final song = selectedSongs[index];
                return ListTile(
                  title: Text(
                    song.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(song.artist),
                  trailing: Text(song.formattedDuration),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _simulateShare,
              child: const Text('Send to music app'),
            ),
          ),
        ],
      ),
    );
  }
}
