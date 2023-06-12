import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  final TextEditingController controller = TextEditingController();

  // 入力内容をここに入れる
  String inputContent = "";

  void _incrementCounter() {
    setState(() {

      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("こんにちは！"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text("piyo"),
                SizedBox(width: 6,),
                Text("piyo1"),
                Padding(padding: EdgeInsets.only(left: 20, right: 5),
                  child: Text("piyo2"),

                )
              ],
            ),
            Text("hoge"),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(inputContent),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                inputContent = controller.text;
              });
            }, child: Text("Click me!")),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Text("テキストを入力")
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.minimize),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
