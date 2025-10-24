import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/song.dart';

class PlaylistSummaryScreen extends StatelessWidget {
  final List<Song> selectedSongs;

  const PlaylistSummaryScreen({Key? key, required this.selectedSongs}) : super(key: key);

  void _sharePlaylist() {
    String playlistText = "Ma Playlist:\\n";
    for (var song in selectedSongs) {
      playlistText += "• ${song.title} - ${song.artist}\\n";
    }
    
    Share.share(playlistText, subject: 'Ma Playlist Partagée');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/note.png',
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.queue_music, size: 100);
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Playlist créée:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedSongs.length,
                itemBuilder: (context, index) {
                  final song = selectedSongs[index];
                  return ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text(song.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(song.artist),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _sharePlaylist,
                icon: Icon(Icons.share),
                label: Text('Send to music app'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
