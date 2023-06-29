import 'package:flutter/material.dart';
import 'package:hello_flutter/goto.dart';

class GotoattackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return attackPageState();
  }
}

class attackPageState extends State {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF1),

      body: Center(

        child: Column(
          //　均等に分ける　＝ spaceBetween
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 60,right:450)
              ,child:ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("戻る")),),

            Padding(padding: const EdgeInsets.only(top: 0),child:Image.asset('images/太陽.png'),),

            Container(
                alignment: Alignment.topCenter,
                child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Text('必要',
                style: TextStyle(
                  fontSize: 36,
                )),
              ElevatedButton( child: const Text('OFF'),
                // 押したときにエフェクトのみ色が変わる
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[300],
                  onPrimary: Colors.blueAccent,
              ),
              onPressed: () {},
            ),

            ])),
            const Text('使うタイミング',
                style: TextStyle(
                  fontSize: 36,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text('事前')),
              ElevatedButton(onPressed: () {}, child: const Text('開けた時')),
            ]),
            const Text('ブザー',
                style: TextStyle(
                  fontSize: 36,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text('ON')),
              ElevatedButton(onPressed: () {}, child: const Text('OFF')),
              ElevatedButton(onPressed: () {}, child: const Text('音量')),
            ]),
            const Text('LED',
                style: TextStyle(
                  fontSize: 36,
                )),
            Padding(padding: const EdgeInsets.only(bottom: 80)
              ,child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(onPressed: () {}, child: const Text('ON')),
                ElevatedButton(onPressed: () {}, child: const Text('OFF')),
                ElevatedButton(onPressed: () {}, child: const Text('色')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
