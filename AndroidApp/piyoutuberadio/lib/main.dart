import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// アプリ全体のMyApp~MaterialApp
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PiYoutubeRadio',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: "PiYoutubeRadio"),
    );
  }
}

// メイン画面のMyApp~MaterialApp
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
          onPressed: () {/* リスト編集画面へ遷移 */},
          icon: Icon(Icons.more_vert),
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 0, bottom: 60, right: 0, left: 0),
                //color: Colors.blue,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {/* ボリュームダウン処理 */},
                        child: Text('-'),
                      ),
                      ElevatedButton(
                        onPressed: () {/* ボリュームアップ処理 */},
                        child: Text('+'),
                      )
                    ])),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              width: MediaQuery.of(context).size.width,
              height: 100,
              //color: Colors.red,
              child: Text('再生しているラジオのタイトル', textAlign: TextAlign.center),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 60, horizontal: 0),
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {/* 前のラジオへ */},
                    child: Text('<<'),
                  ),
                  ElevatedButton(
                    onPressed: () {/* 再生・停止へ */},
                    child: Text('>'),
                  ),
                  ElevatedButton(
                    onPressed: () {/* 次のラジオへ */},
                    child: Text('>>'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
