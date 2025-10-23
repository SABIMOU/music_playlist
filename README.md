# 🎵 Music Playlist - Application Flutter

Application mobile de création de playlists développée avec Flutter suivant l'architecture Clean Architecture.

## 📱 Fonctionnalités

- ✅ **Liste des chansons** - Affichage de 8 chansons avec titre, artiste, album et durée
- ✅ **Sélection playlist** - Case à cocher pour sélectionner/désélectionner les chansons
- ✅ **Tri intelligent** - Tri par titre, artiste ou durée
- ✅ **Calcul durée totale** - Durée totale de la playlist en temps réel
- ✅ **Navigation écrans** - Navigation entre liste, détails et playlist
- ✅ **Modification chansons** - Édition du titre, artiste, album et durée
- ✅ **Playlist récapitulative** - Affichage des chansons sélectionnées
- ✅ **Bouton partage** - Simulation du partage vers applications externes

## 🏗️ Architecture

L'application suit strictement l'**architecture Clean Architecture** enseignée en cours :

### Structure des couches :


### Technologies utilisées :

- **Flutter** - Framework de développement
- **GetIt** - Injection de dépendances (comme dans le cours)
- **Provider** - Gestion d'état avec ChangeNotifier (comme dans le cours)
- **ChangeNotifier** - Notification des changements d'état

## 🎯 Respect du cahier des charges

### Conformité au TP :
- ✅ 8 chansons exactes demandées
- ✅ Sélection avec checkboxes
- ✅ Tri par titre/artiste/durée
- ✅ Calcul durée totale
- ✅ Navigation écran détails
- ✅ Modification des chansons
- ✅ Écran playlist récapitulative
- ✅ Bouton "Send to music app"

### Conformité au cours :
- ✅ Architecture Clean Architecture
- ✅ Presenter avec ChangeNotifier
- ✅ Injection GetIt + Provider
- ✅ Séparation des responsabilités
- ✅ Navigation simple avec callbacks

## 🚀 Installation et exécution

```bash
# Cloner le repository
git clone https://github.com/SABIMOU/music_playlist_final.git

# Se positionner dans le projet
cd music_playlist_final

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
