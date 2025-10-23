import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'repository/music_repository.dart';
import 'repository/music_repository_impl.dart';
import 'presenter/music_presenter.dart';
import 'presenter/music_presenter_impl.dart';
import 'ui/song_list_screen.dart';

void main() {
  GetIt.instance.registerSingleton<MusicRepository>(MusicRepositoryImpl());
  
  runApp(
    ChangeNotifierProvider<MusicPresenter>(
      create: (context) => MusicPresenterImpl(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Playlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SongListScreen(),
    );
  }
}
