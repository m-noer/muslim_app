import 'package:flutter/material.dart';
import 'package:muslim_app/provider/audio_provider.dart';
import 'package:muslim_app/provider/aya_provider.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class AyaPage extends StatefulWidget {
  const AyaPage({Key key, this.ayaName, this.ayaNumber, this.surahNumber})
      : super(key: key);

  final String ayaName;
  final int ayaNumber;
  final int surahNumber;

  @override
  _AyaPageState createState() => _AyaPageState();
}

class _AyaPageState extends State<AyaPage> {
  bool loading = true;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        loading = true;
      });

      Provider.of<AyaProvider>(context, listen: false)
          .getAya(widget.surahNumber, widget.ayaNumber)
          .then((_) {
        setState(() {
          loading = false;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final aya = Provider.of<AyaProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.ayaName),
      ),
      body: loading
          ? Text('loading')
          : Container(
              child: Consumer<AyaProvider>(
                builder: (ctx, data, _) => ListView.builder(
                    itemCount: data.items.length,
                    itemBuilder: (ctx, i) {
                      if ((i + 1) % 2 == 0) {
                        return CardAya(
                          id: data.items[i].ayaNumber,
                          ayaCount: widget.ayaNumber,
                          ayaText: data.items[i].ayaText,
                          translation: data.items[i].translation,
                          color: Colors.grey[100],
                          surahNumber: widget.surahNumber,
                        );
                      }
                      return CardAya(
                        id: data.items[i].ayaNumber,
                        ayaCount: widget.ayaNumber,
                        ayaText: data.items[i].ayaText,
                        translation: data.items[i].translation,
                        color: Colors.white,
                        surahNumber: widget.surahNumber,
                      );
                    }),
              ),
            ),
    );
  }
}

class CardAya extends StatelessWidget {
  CardAya({
    Key key,
    this.ayaCount,
    this.ayaText,
    this.translation,
    this.color,
    this.id,
    this.surahNumber,
  }) : super(key: key);

  AudioPlayer audioPlayer = AudioPlayer();

  play(url) async {
    int result = await audioPlayer.play(url);
    if (result == 1) {
      // success
    }
  }

  final int ayaCount;
  final String ayaText;
  final String translation;
  final Color color;
  final int id;
  final int surahNumber;

  @override
  Widget build(BuildContext context) {
    final audio = Provider.of<AudioProvider>(context);

    return InkWell(
      onTap: () {
        audio.getAudio(surahNumber, id).then((_) {
          play(audio.item['data']['audio']);
        });
      },
      child: Container(
        color: color,
        width: double.infinity,
        // height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              ayaText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'TimesNewRoman',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '$id. $translation',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
