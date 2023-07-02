import 'package:flutter/material.dart';
import 'package:hello_flutter/peace.dart';
import 'package:hello_flutter/attack.dart';
import 'package:hello_flutter/in_the_room_page.dart';

class GotoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoPageState();
  }
}

class GoPageState extends State {
  final TextEditingController controller = TextEditingController();

  // 選択中フッターメニューのインデックスを一時保存する用変数
  int selectedIndex = 0;

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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'images/太陽２.png',
                width: 260,
                height: 260,
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('必要',
                          style: TextStyle(
                            fontSize: 36,
                          )),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('OFF')),
                    ])),
            const Text('使うタイミング',
                style: TextStyle(
                  fontSize: 36,
                )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(onPressed: () {}, child: const Text('事前')),
              ElevatedButton(onPressed: () {}, child: const Text('開けた時')),
            ]),
            const Text('嫌がらせ',
                style: TextStyle(
                  fontSize: 36,
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttackPage()));
                        },
                        child: const Text('ON')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeacePage()));
                        },
                        child: const Text('OFF')),
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
