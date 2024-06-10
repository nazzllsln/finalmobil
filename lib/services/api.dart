import 'package:dio/dio.dart';

class API {
  getStaticPage() async {
    return await Future.delayed(const Duration(milliseconds: 900), () {
      return {
        "about": {
          "cover":
              "https://i0.wp.com/bdtechtalks.com/wp-content/uploads/2021/08/Programming-1.jpg",
          "slogan": "Geleceği Kodlayın",
          "subSlogan": "İnovasyonunuzun Anahtarı",
          "summary":
              "Yazılım uygulamamız, geleceği şekillendirmeniz için güçlü bir araçtır. Yenilikçi çözümler üretmek ve sınırları zorlamak için tasarlandı. Her kod satırı, dönüştürücü bir deneyimin kapılarını aralar. İlerlemenin ritmini siz belirleyin, potansiyelinizi keşfedin ve geleceği bugünden yazmaya başlayın.",
          "missions": ["Dönüşüm İçin", "Bağlantı Kurmak"],
          "visions": ["Vizyon1", "Vizyon2", "Vizyon3"]
        },
        "contact": {
          "Address": "VADI ISTABUL",
          "Phone": "+90 552 888 1212",
          "instagram": "https://instagram.com/keyvan_arasteh",
          "youtube": "https://youtube.com",
          "linkedin": "https://linkedin.com/keyvanarasteh",
          "facebook": "https://fb.com",
          "mapLink": "https://maps.google.com/",
          "emails": [
            {"title": "Satis", "email": "sales@key1.tech"},
            {"title": "Yontim", "email": "ceo@key1.tech"}
          ]
        },
        "splash": {
          "logo":
              "https://cdn.logojoy.com/wp-content/uploads/20230629132639/current-logo-600x338.png",
          "background":
              "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTEyL3Jhd3BpeGVsb2ZmaWNlMTVfZmlsbV9waG90b190aGVfMTk3MHNfb2ZfY2l0eV9uaWdodF9hZGRfbm9pc2VfYV85NzRkZTdiNi04OWRhLTQwZTItODk2Ny0wODcwN2ZiNmI4YTlfMS5qcGc.jpg",
          "backgroundColor": "FFFFFF",
          "duration": 1500
        },
      };
    });
  }

  download(String path, String savePath) async {
    try {
      Dio dio = Dio();

      await dio.download(path, savePath);
      return true;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
