// A. マテリアルデザインのコンポーネントをimport
// https://flutter.dev/docs/development/ui/widgets/material
import 'package:flutter/material.dart';


// B. main関数）最初に呼ばれるmain
void main() {
  // C. runApp関数
  // print('Hello');
  // WidgetsFlutterBinding.ensureInitialized()
  // ..scheduleAttachRootWidget(app)
  // ..scheduleWarmUpFrame();
  runApp(MyApp());
}
// () =>でも同じ意味


// D. StatelessWidgetを継承したクラス＿ステートレスウィジェットを継承extendsしたパーツ（クラス）の組み合わせでUIを構築する
class MyApp extends StatelessWidget {
  @override
  // build()メソッドでUIに必要なものを組合わせてreturnで返す
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // N-1. Theme。テーマはデザインを決める
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// E. StatefulWidgetを継承したクラス
class MyHomePage extends StatefulWidget {
  // コンストラクター
  MyHomePage({Key key, this.title}) : super(key: key);

  // 受け取った文字列の入れ物
  final String title;
  @override
  // State<StatefulWidget> createState() => _MyHomePageState();
  _MyHomePageState createState() => _MyHomePageState();
}
// クラス名やフィールド名の先頭の _ (アンダ)=private キーワードに相当し、外部からのアクセスを制限
// Rubyでcreateする前にprivate通したり、pythonで
// Dartの場合、基本的に1ファイル = 1ライブラリとなっていて、 _ を使うことでファイル外(ライブラリ外)からアクセスできない

// F. Stateを継承したクラス
class _MyHomePageState extends State<MyHomePage> {
  // G. 状態の保持と更新
  // フィールドの定義
  int _counter = 0;
  // メソッド定義しておき、呼ばれたら++をかけてく。ただしUIに渡すためにsetState()で囲むルール
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // H. _MyHomePageStateのbuildメソッド
  // 同様にbuildメソッドでWidgetツリーを返している
  @override
  Widget build(BuildContext context) {
    // K. ページはScaffoldで組む。ページ毎にscaffoldで囲む。マテリアルデザインならscaffold必須
    return Scaffold(
      // L. flutterのAppBarとは、iOSのナビゲーションバーのこと
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // M. bodyで、ページの中身bodyをレイアウト
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // I. _counterの表示。表示はテキストメソッドtext()で可能
            Text(
              '$_counter',
              // N-2. Theme。テーマでデザインを決めつ
              // style: Theme.of(context).textTheme.display1,
              style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Enjoy Flutter!"
            ),
          ],
        ),
      ),
      // J. ボタン操作に応じて_counterを増やす
      // onPressedボタン押下したら実行のJS的メソッド
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        // onPressed: () => _incrementCounter(),
        onPressed: () {
          _incrementCounter();
        },
        // 書き方は上記３パターン。。シンプル、()=>、メソッド風
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}