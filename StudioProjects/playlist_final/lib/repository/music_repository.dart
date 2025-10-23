import '../data/song.dart';

/// Contrat définissant comment accéder aux données des chansons
/// Permet de changer l'implémentation sans affecter le reste de l'app
abstract class MusicRepository {
  List<Song> get songs; // Liste de toutes les chansons disponibles
}
