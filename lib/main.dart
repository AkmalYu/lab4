import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Общежитие №20',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Общежитие №20'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  IconData iconData = Icons.favorite_border;
  int _favCounter = 0;
  Uri phoneLaunch = Uri(scheme: 'tel', path: '+79676656512');

  _launchURL() async {
    const url = 'https://www.google.com/maps/dir//Общежитие+20,+Улица+Калинина+13,+корпус+20,+ул.+Калинина+13,+13к20,+Краснодар,+Краснодарский+край,+Россия,+350044/@45.0502933,38.9120079,15z/data=!4m17!1m7!3m6!1s0x40f04f3737bffbff:0x384537772b6bf12d!2z0J7QsdGJ0LXQttC40YLQuNC1IDIw!8m2!3d45.0502933!4d38.9207626!16s%2Fg%2F11bwqqb83z!4m8!1m0!1m5!1m1!1s0x40f04f3737bffbff:0x384537772b6bf12d!2m2!1d38.9208175!2d45.0502591!3e3';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(mode: LaunchMode.platformDefault, uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _toggleViewIcon() {
    setState(() {
      if (iconData == Icons.favorite_border) {
        iconData = Icons.favorite;
        _favCounter++;
      } else {
        iconData = Icons.favorite_border;
        _favCounter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://lh5.googleusercontent.com/p/AF1QipMzjSB9DkNXRwniHjdk21_FnRUWESZbT3vDgOln=w486-h240-k-no'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Общежитие №20',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Краснодар, ул. Калинина, 13",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: _toggleViewIcon,
                            icon: Icon(
                              iconData,
                              color: Colors.red,
                            ),
                          ),
                          Text('$_favCounter'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {

                                  launchUrl(phoneLaunch);
                                },
                                icon: const Icon(Icons.phone,
                                    color: Colors.green)),
                            const Text(
                              "ПОЗВОНИТЬ",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _launchURL();
                                },
                                icon: const Icon(Icons.near_me,
                                    color: Colors.green)),
                            const Text(
                              "МАРШРУТ",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Share.share("https://www.google.com/maps/place/Общежитие+20/@45.0502933,38.9116006,14z/data=!4m6!3m5!1s0x40f04f3737bffbff:0x384537772b6bf12d!8m2!3d45.0502933!4d38.9207626!16s%2Fg%2F11bwqqb83z");
                                },
                                icon: const Icon(Icons.share,
                                    color: Colors.green)),
                            const Text(
                              "ПОДЕЛИТЬСЯ",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Text(
                            "Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.",
                        style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
