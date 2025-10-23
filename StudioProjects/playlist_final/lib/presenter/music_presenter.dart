import 'package:flutter/foundation.dart';
import '../data/song.dart';

abstract class MusicPresenter extends ChangeNotifier {
  List<Song> get songs;
  List<Song> get selectedSongs;
  int get totalDuration;
  String get formattedTotalDuration;
  
  void toggleSongSelection(Song song);
  void updateSong(Song song, String title, String artist, String album, int duration);
  void sortByTitle();
  void sortByArtist();
  void sortByDuration();
}
