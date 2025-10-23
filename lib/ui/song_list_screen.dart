import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presenter/music_presenter.dart';
import '../data/song.dart';
import 'song_details_screen.dart';
import 'playlist_screen.dart';

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  State<SongListScreen> createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  bool _showOnlySelected = false;

  void _openSongDetails(BuildContext context, Song song) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongDetailsScreen(song: song),
      ),
    );
  }

  void _openPlaylist(BuildContext context, List<Song> selectedSongs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaylistScreen(selectedSongs: selectedSongs),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final presenter = context.watch<MusicPresenter>();
    final songsToDisplay = _showOnlySelected 
        ? presenter.selectedSongs 
        : presenter.songs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose your playlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: presenter.sortByTitle,
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: presenter.sortByArtist,
          ),
          IconButton(
            icon: const Icon(Icons.timer),
            onPressed: presenter.sortByDuration,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: songsToDisplay.length,
              itemBuilder: (context, index) {
                final song = songsToDisplay[index];
                return ListTile(
                  leading: Checkbox(
                    value: song.isSelected,
                    onChanged: (value) {
                      presenter.toggleSongSelection(song);
                    },
                  ),
                  title: Text(song.title),
                  subtitle: Text('${song.artist} - ${song.album}'),
                  trailing: Text(song.formattedDuration),
                  onTap: () {
                    _openSongDetails(context, song);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total duration: ${presenter.formattedTotalDuration}'),
                ElevatedButton(
                  onPressed: presenter.selectedSongs.isNotEmpty 
                      ? () {
                          _openPlaylist(context, presenter.selectedSongs);
                        }
                      : null,
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
