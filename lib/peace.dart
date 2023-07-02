import 'package:flutter/material.dart';
import 'package:hello_flutter/go_to.dart';
import 'package:hello_flutter/in_the_room_page.dart';


class PeacePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PeacePageState();
  }
}


class PeacePageState extends State {
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
                child: const Text('親フラ感知',
                    style: TextStyle(
                      fontSize: 36,
                    ))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text('する')),
              ElevatedButton(onPressed: () {}, child: const Text('しない')),
            ]),
            const Text('時',
                style: TextStyle(
                  fontSize: 36,
                )),
            Padding(padding: const EdgeInsets.only(bottom: 80)
            ,child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text('事前')),
              ElevatedButton(onPressed: () {}, child: const Text('開けた時')),
            ]),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ボタンの位置をセンターに
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          //backgroundColor: Theme.of(context).accentColor,
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add),

        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF7DE2DB),
          // フッターメニューのアイテム一覧
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/家1.png'),
                color: Color(0xFFE8F4F7),
                size: 40,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/太陽２.png'),
                color: Color(0xFFE8F4F7),
                size: 40,
              ),
              label: 'go',
            ),
          ],

          currentIndex: 0,
          onTap: (int index) {
            if (index == 0) {
              // Home アイコンが押されたときの処理
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RoomPage()));
              // 他の処理を追加
            } else if (index == 1) {
              // go アイコンが押されたときの処理
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GotoPage()));
              // 他の処理を追加
            }
          },
        ),
      ),
    );
  }
}
