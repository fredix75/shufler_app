import 'package:flutter/material.dart';
import 'package:test_yt/vimeoFrame.dart';
import 'youtubeFrame.dart';

void main() {
  runApp(ShuflerApp());
}

class ShuflerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shufler',
      home: VideosList(),
      theme: ThemeData(
        useMaterial3: true,
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          // ···
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}

class VideosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/shufler_logo.png', height: 25,),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mes Cartes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Image en tête
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
//                                    builder: (context) => YoutubeFrame())
                                    builder: (context) => VimeoFrame())
                            );
                          },
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                            child: Image.network(
                              'https://img.youtube.com/vi/fhzkeFiXfPI/0.jpg',
                              // Remplacez par votre URL d'image
                              width: 150, // Largeur de l'image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Contenu texte
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text('genre', textAlign: TextAlign.right,),
                              Text(
                                'Carte ${index + 1}', // Texte de la carte
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
