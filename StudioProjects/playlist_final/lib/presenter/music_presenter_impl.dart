import '../data/song.dart';
import '../repository/music_repository.dart';
import 'music_presenter.dart';
import 'package:get_it/get_it.dart';

class MusicPresenterImpl extends MusicPresenter {
  @override
  List<Song> get songs => GetIt.instance<MusicRepository>().songs;

  @override
  List<Song> get selectedSongs => songs.where((song) => song.isSelected).toList();

  @override
  int get totalDuration {
    return selectedSongs.fold(0, (sum, song) => sum + song.durationInSeconds);
  }

  @override
  String get formattedTotalDuration {
    int minutes = totalDuration ~/ 60;
    int seconds = totalDuration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void toggleSongSelection(Song song) {
    song.isSelected = !song.isSelected;
    notifyListeners();
  }

  @override
  void updateSong(Song song, String title, String artist, String album, int duration) {
    song.title = title;
    song.artist = artist;
    song.album = album;
    song.durationInSeconds = duration;
    notifyListeners();
  }

  @override
  void sortByTitle() {
    songs.sort((a, b) => a.title.compareTo(b.title));
    notifyListeners();
  }

  @override
  void sortByArtist() {
    songs.sort((a, b) => a.artist.compareTo(b.artist));
    notifyListeners();
  }

  @override
  void sortByDuration() {
    songs.sort((a, b) => a.durationInSeconds.compareTo(b.durationInSeconds));
    notifyListeners();
  }
}
