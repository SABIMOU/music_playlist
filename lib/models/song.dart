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
