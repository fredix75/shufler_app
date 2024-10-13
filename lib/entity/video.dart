import 'dart:convert';
import 'dart:io';

class Video
{
  int? id;
  String? auteur;
  String? titre;
  String? lien;
  String? key;
  String? platform;
  int? categorie;
  int? genre;
  int? priorite;
  String? periode;
  String? image = 'https://img.youtube.com/vi/youtubecom/0.jpg';



  Video({this.id, this.auteur, this.titre,this.lien, this.key, this.platform, this.categorie, this.genre, this.priorite, this.periode, this.image});

  static Video fromJson(Map<String, dynamic> json) {
    const youtubeApi = 'https://img.youtube.com/vi/';
    const vimeoApi = 'https://vimeo.com/api/v2/video/';

    String lien = json['lien'];
    String key = '0';
    String image = '';
    String platform = '';

    if (lien.lastIndexOf('/') != -1) {
      key = lien.substring(lien.lastIndexOf('/') + 1);
    }

    if (lien.lastIndexOf('youtube') != -1) {
      platform = 'youtube';
      if (lien.lastIndexOf('=') != -1) {
        key = key.substring(lien.lastIndexOf('='));
      }

      //key = key.substring(1);
      image = youtubeApi + key + '/0.jpg';
      print(json['titre']);
      print(image);
    } else if (lien.indexOf('vimeo') != -1) {
      platform = 'vimeo';
      //key = key.substring(1);
      key = lien;
      print('ok vimeo' + lien);
      print(key);
      var result = File('https://vimeo.com/api/v2/video/'+ key + '.json').readAsString().then((String contents) {
        print(jsonDecode(contents));
        return jsonDecode(contents)['thubnail_medium'];
      });
      image = vimeoApi + key;
    }



    return Video(id: json['id'], auteur: json['auteur'], titre: json['titre'], lien: json['lien'], key : key, platform: platform, categorie: json['categorie'], genre: json['genre'], priorite: json['priorite'], image: image);
  }
}
