/// Modèle représentant une chanson avec ses propriétés
/// Correspond aux données de base de l'application
class Song {
  String title;
  String artist; 
  String album;
  int durationInSeconds;
  bool isSelected;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.durationInSeconds,
    this.isSelected = false, // Par défaut, non sélectionnée
  });

  /// Convertit la durée en secondes vers le format MM:SS
  /// Exemple: 245 secondes → "04:05"
  String get formattedDuration {
    int minutes = durationInSeconds ~/ 60;
    int seconds = durationInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
