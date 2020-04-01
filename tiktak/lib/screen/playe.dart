import 'package:flutter/material.dart';

class Playe extends StatefulWidget {
  static final String id = 'playe';
  @override
  _PlayeState createState() => _PlayeState();
}

class _PlayeState extends State<Playe> {
  bool oTurn = true;
  int cont = 0;
  int o = 0;
  int x = 0;
  List<String> eXhO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tepped(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[800])),
                child: Center(
                  child: Text(
                    eXhO[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _tepped(int index) {
    setState(() {
      if (oTurn) {
        eXhO[index] = 'O';
      } else {
        eXhO[index] = 'X';
      }
      oTurn = !oTurn;
      _checkWiner();
    });
  }

  void _checkWiner() {
    if (cont != 8) {
      if (eXhO[0] == eXhO[1] && eXhO[0] == eXhO[2] && eXhO[0] != '') {
        _isWiner(eXhO[0]);
      }
      if (eXhO[3] == eXhO[4] && eXhO[3] == eXhO[5] && eXhO[3] != '') {
        _isWiner(eXhO[3]);
      }
      if (eXhO[6] == eXhO[7] && eXhO[6] == eXhO[8] && eXhO[6] != '') {
        _isWiner(eXhO[6]);
      }
      if (eXhO[0] == eXhO[3] && eXhO[0] == eXhO[6] && eXhO[0] != '') {
        _isWiner(eXhO[0]);
      }
      if (eXhO[1] == eXhO[4] && eXhO[1] == eXhO[7] && eXhO[1] != '') {
        _isWiner(eXhO[1]);
      }
      if (eXhO[2] == eXhO[5] && eXhO[2] == eXhO[8] && eXhO[2] != '') {
        _isWiner(eXhO[2]);
      }
      if (eXhO[0] == eXhO[4] && eXhO[0] == eXhO[8] && eXhO[0] != '') {
        _isWiner(eXhO[0]);
      }
      if (eXhO[2] == eXhO[4] && eXhO[2] == eXhO[6] && eXhO[2] != '') {
        _isWiner(eXhO[2]);
      }
      cont++;
      // print(cont);
    } else {
      _loser();
    }
  }

  void _isWiner(String winner) {
    if (winner == 'O') {
      o++;
      print("scor O : " + o.toString());
    } else {
      x++;
      print("scor X : "  +x.toString());
    }
    oTurn = true;
    cont = 0;
    eXhO = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }

  void _loser() {
    print('Loser');
    oTurn = true;
    cont = 0;
    eXhO = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }
}
