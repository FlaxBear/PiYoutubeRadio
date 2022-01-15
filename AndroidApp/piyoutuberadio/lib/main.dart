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
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(title: "PiYoutubeRadio"),
          '/ListEdit': (context) => const ListEditPage(title: "リスト編集"),
        }
        //home: const MyHomePage(title: "PiYoutubeRadio"),
        );
  }
}

class ListEditPage extends StatefulWidget {
  const ListEditPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ListEditPage> createState() => _ListEditPageState();
}

class RadioInfo {
  String radioID;
  String title;
  String url;
  bool skipFlag;

  RadioInfo(this.radioID, this.title, this.url, this.skipFlag);
}

class _ListEditPageState extends State<ListEditPage> {
  List<RadioInfo> radioInfo = [
    RadioInfo("1", "test", "test", false),
    RadioInfo("2", "test2", "test2", true),
    RadioInfo("3", "test3", "test2", true),
    RadioInfo("4", "test4", "test2", true),
    RadioInfo("5", "test5", "test2", true),
    RadioInfo("6", "test6", "test2", true),
    RadioInfo("7", "test7", "test2", true),
    RadioInfo("8", "test8", "test2", true),
    RadioInfo("9", "test9", "test2", true),
    RadioInfo("10", "test10", "test2", true),
    RadioInfo("11", "test11", "test2", true),
    RadioInfo("12", "test12", "test2", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ]),
        body: ListView.builder(
            itemCount: radioInfo.length,
            padding: EdgeInsets.all(4),
            itemBuilder: (context, index) {
              return Container(
                  //color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(3),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        //color: Colors.red,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(radioInfo[index].title,
                                  style: TextStyle(fontSize: 25)),
                              Text(radioInfo[index].url),
                            ])),
                    Container(
                        color: Colors.green,
                        child: Row(children: <Widget>[
                          ElevatedButton(
                            onPressed: () {/* 情報編集画面へ */},
                            child: Text('Info'),
                          ),
                          Checkbox(
                            activeColor: Colors.blue,
                            value: radioInfo[index].skipFlag,
                            onChanged: {}
                          ),
                        ])),
                  ]));
            }));
  }
}

///////////
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
          onPressed: () {
            Navigator.pushNamed(context, '/ListEdit');
          },
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
                      SizedBox(
                        width: 70.0,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {/* ボリュームダウン処理 */},
                          child: Text('-', style: TextStyle(fontSize: 36)),
                        ),
                      ),
                      SizedBox(
                          width: 70.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {/* ボリュームアップ処理 */},
                            child: Text('+', style: TextStyle(fontSize: 36)),
                          ))
                    ])),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              width: MediaQuery.of(context).size.width,
              height: 90,
              //color: Colors.red,
              child: Text('再生しているラジオのタイトル',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 90, horizontal: 0),
              //color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {/* 前のラジオへ */},
                    child: Text('<<', style: TextStyle(fontSize: 40)),
                  ),
                  ElevatedButton(
                    onPressed: () {/* 再生・停止へ */},
                    child: Text('>', style: TextStyle(fontSize: 40)),
                  ),
                  ElevatedButton(
                    onPressed: () {/* 次のラジオへ */},
                    child: Text('>>', style: TextStyle(fontSize: 40)),
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
////////////////////////////////////

