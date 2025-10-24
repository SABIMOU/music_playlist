import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(PlaylistApp());
}

class Song {
  final String title;
  final String artist;
  final String album;
  final String duration;
  final String albumImagePath;
  bool isSelected;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.albumImagePath,
    this.isSelected = false,
  });
}

class PlaylistApp extends StatelessWidget {
  final List<Song> songs = [
    Song(title: "Wish you were here", artist: "Pink Floyd", album: "Wish You Were Here", duration: "5:30", albumImagePath: "assets/images/note.png"),
    Song(title: "Gimme shelter", artist: "Rolling Stones", album: "Let It Bleed", duration: "4:31", albumImagePath: "assets/images/LetitbleedRS.jpg"),
    Song(title: "Come Together", artist: "The Beatles", album: "Abbey Road", duration: "4:19", albumImagePath: "assets/images/note.png"),
    Song(title: "Have you ever seen the rain", artist: "CCR", album: "Pendulum", duration: "2:38", albumImagePath: "assets/images/note.png"),
    Song(title: "Shape Of My Heart", artist: "Sting", album: "Ten Summoner's Tales", duration: "4:39", albumImagePath: "assets/images/note.png"),
    Song(title: "Cornflake Girl", artist: "Tori Amos", album: "Under the Pink", duration: "5:05", albumImagePath: "assets/images/note.png"),
    Song(title: "Master Blaster", artist: "Stevie Wonder", album: "Hotter Than July", duration: "4:49", albumImagePath: "assets/images/note.png"),
    Song(title: "So Sorry", artist: "Feist", album: "The Reminder", duration: "3:12", albumImagePath: "assets/images/note.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playlist App',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: PlaylistHomeScreen(songs: songs),
    );
  }
}

class PlaylistHomeScreen extends StatefulWidget {
  final List<Song> songs;

  const PlaylistHomeScreen({super.key, required this.songs});

  @override
  _PlaylistHomeScreenState createState() => _PlaylistHomeScreenState();
}

class _PlaylistHomeScreenState extends State<PlaylistHomeScreen> {
  List<Song> get selectedSongs => widget.songs.where((song) => song.isSelected).toList();

  int get totalDuration {
    int total = 0;
    for (var song in selectedSongs) {
      var parts = song.duration.split(':');
      if (parts.length == 2) {
        total += int.parse(parts[0]) * 60 + int.parse(parts[1]);
      }
    }
    return total;
  }

  void _navigateToSongDetail(Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongDetailScreen(song: song)),
    );
  }

  void _navigateToPlaylistSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaylistSummaryScreen(selectedSongs: selectedSongs)),
    );
  }

  void _sortSongs(String type) {
    setState(() {
      switch (type) {
        case 'title':
          widget.songs.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'artist':
          widget.songs.sort((a, b) => a.artist.compareTo(b.artist));
          break;
        case 'duration':
          widget.songs.sort((a, b) {
            int aDuration = _parseDuration(a.duration);
            int bDuration = _parseDuration(b.duration);
            return aDuration.compareTo(bDuration);
          });
          break;
      }
    });
  }

  int _parseDuration(String duration) {
    var parts = duration.split(':');
    if (parts.length == 2) {
      return int.parse(parts[0]) * 60 + int.parse(parts[1]);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose your playlist'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Sort by', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => _sortSongs('title'),
                      child: const Text('title'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _sortSongs('artist'),
                      child: const Text('artist'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _sortSongs('duration'),
                      child: const Text('duration'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: widget.songs.length,
              itemBuilder: (context, index) {
                final song = widget.songs[index];
                return ListTile(
                  leading: Checkbox(
                    value: song.isSelected,
                    onChanged: (value) {
                      setState(() {
                        song.isSelected = value ?? false;
                      });
                    },
                  ),
                  title: Text('${song.title} - ${song.artist}'),
                  subtitle: Text(song.duration),
                  onTap: () => _navigateToSongDetail(song),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Total duration ${totalDuration ~/ 60} minutes ${totalDuration % 60} seconds'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedSongs.isEmpty ? null : _navigateToPlaylistSummary,
                  child: const Text("Let's go"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongDetailScreen extends StatelessWidget {
  final Song song;

  const SongDetailScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(song.title),
      ),
      body: SingleChildScrollView(
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
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  song.albumImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: song.title),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: TextEditingController(text: song.artist),
              decoration: const InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: TextEditingController(text: song.album),
              decoration: const InputDecoration(labelText: 'Album'),
            ),
            TextField(
              controller: TextEditingController(text: song.duration),
              decoration: const InputDecoration(labelText: 'Duration'),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistSummaryScreen extends StatelessWidget {
  final List<Song> selectedSongs;

  const PlaylistSummaryScreen({super.key, required this.selectedSongs});

  void _sharePlaylist() {
    String playlistText = "🎵 Ma Playlist 🎵\n\n";
    for (var song in selectedSongs) {
      playlistText += "• ${song.title} - ${song.artist} (${song.duration})\n";
    }
    
    Share.share(playlistText, subject: 'Ma Playlist Partagée');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
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
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Playlist créée:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedSongs.length,
                itemBuilder: (context, index) {
                  final song = selectedSongs[index];
                  return ListTile(
                    leading: const Icon(Icons.music_note),
                    title: Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${song.artist} - ${song.duration}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _sharePlaylist,
                icon: const Icon(Icons.share),
                label: const Text('Send to music app'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
