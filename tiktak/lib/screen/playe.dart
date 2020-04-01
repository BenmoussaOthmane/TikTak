import 'package:flutter/material.dart';
import 'package:tiktak/screen/onboarding.dart';

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 5,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: ()=> Navigator.pushReplacementNamed(context,Onboarding.id)),
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[900],
                            offset: Offset(5.0, 5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.grey[800],
                            offset: Offset(-5.0, -5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                  ),
                  Text(
                    'TikTak',
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Color(0xffcff1ef),
                        fontFamily: 'calibri',
                        fontSize:30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 5,
                    child: IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: ()=>_clear()),
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[900],
                            offset: Offset(5.0, 5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Colors.grey[800],
                            offset: Offset(-5.0, -5.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tepped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[800])),
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
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'X =  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    x.toString(),
                    style: TextStyle(
                      color: Color(0xffcff1ef),
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/3,),
                  Text(
                    'O =  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    o.toString(),
                    style: TextStyle(
                      color: Color(0xffcff1ef),
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
          ),
          ),
        ],
      ),
    );
  }

  void _tepped(int index) {
    setState(() {
      if (oTurn && eXhO[index] == '') {
        eXhO[index] = 'X';
        cont++;
      } else {
        if (!oTurn && eXhO[index] == '') {
          eXhO[index] = 'O';
          cont++;
        }
      }
      oTurn = !oTurn;
      _checkWiner();
    });
  }

  void _checkWiner() {
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
    if (cont == 9) {
      _loser();
    }
  }

  void _isWiner(String winner) {
    if (winner == 'O') {
      o++;
      // print("scor O : " + o.toString());
    } else {
      x++;
      // print("scor X : " + x.toString());
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
    // print('Loser');
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
    _showDialog();
  }
  void _showDialog(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(
            'Khsarto fi zouj ',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'calibri',
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Play Again',
                style: TextStyle(
                  color: Color(0xff84a9ac),
                  fontSize: 20
                ),
              ),
              onPressed:()=> Navigator.pop(context),
            )
          ],
        );
      }
    );
  }
  void _clear(){
    o=0;
    x=0;
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
