import '../data/song.dart';
import 'music_repository.dart';

/// Implémentation concrète du repository avec des données codées en dur
/// Correspond au TP avec les 8 chansons demandées
class MusicRepositoryImpl implements MusicRepository {
  @override
  List<Song> songs = [
    Song(
      title: "Wish you were here",
      artist: "Pink Floyd", 
      album: "Wish You Were Here",
      durationInSeconds: 330, // 5:30
    ),
    Song(
      title: "Gimme shelter",
      artist: "Rolling Stones",
      album: "Let It Bleed", 
      durationInSeconds: 271, // 4:31
    ),
    Song(
      title: "Come Together",
      artist: "The Beatles",
      album: "Abbey Road",
      durationInSeconds: 259, // 4:19  
    ),
    Song(
      title: "Have you ever seen the rain",
      artist: "CCR",
      album: "Pendulum",
      durationInSeconds: 158, // 2:38
    ),
    Song(
      title: "Shape Of My Heart", 
      artist: "Sting",
      album: "Ten Summoner's Tales",
      durationInSeconds: 279, // 4:39
    ),
    Song(
      title: "Cornflake Girl",
      artist: "Tori Amos",
      album: "Under the Pink",
      durationInSeconds: 305, // 5:05
    ),
    Song(
      title: "Master Blaster",
      artist: "Stevie Wonder", 
      album: "Hotter than July",
      durationInSeconds: 289, // 4:49
    ),
    Song(
      title: "So Sorry",
      artist: "Feist",
      album: "The Reminder", 
      durationInSeconds: 192, // 3:12
    ),
  ];
}
