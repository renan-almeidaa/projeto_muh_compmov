import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: ItemRegister(),
  ),
);

class ItemRegister extends StatelessWidget {
  final String fontFamily = 'Quicksand';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF0077b6),
        // backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("assets/cow.png", alignment: Alignment.center, scale: 10,),
        leading: RaisedButton(
          color: Color(0xFF0077b6),
          child: Icon(Icons.dehaze,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          RaisedButton(
            // color: Colors.white,
            //padding: EdgeInsets.only(0.2),
            child:
            Icon(Icons.chat,
              color: Colors.white,
            ),
            color: Color(0xFF0077b6),
            onPressed: () {
              // vai para as mensagens...
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("Cadastrar Item",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nome:",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Container(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                // fillColor: Colors.white,
                                fillColor: Color(0xFFEDFAFD),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                  borderSide: BorderSide.none,
                                  // borderSide: BorderSide(
                                  //   color: Colors.black,
                                  //   width: 0,
                                  // ),
                                ),
                              ),
                            ),
                          )
                        )
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Imagem:",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        RaisedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.save_alt,
                            size: 20,
                          ),
                          label: Text("Carregar",
                            style: TextStyle(
                              fontFamily: fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          elevation: 0,
                          // color: Colors.white,
                          color: Color(0xFFEDFAFD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['Produto', 'Animal',], fontFamily),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['Público', 'Privado',], fontFamily),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['À venda', 'Exibição',], fontFamily),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Descrição:",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 10 * 20.0,
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 7,
                        maxLines: 7,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: Colors.white,
                          fillColor: Color(0xFFEDFAFD),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.add,
            color: Colors.white,
            // color: Colors.black,
          ),
          label: Text("Cadastrar Item",
            style: TextStyle(
              // color: Colors.black,
              color: Colors.white,
              fontSize: 18,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
          // backgroundColor: Colors.white,
          backgroundColor: Color(0xFF0077b6),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
          ),
        ),
      )
    );
  }
}

class DropDownItem extends StatefulWidget {
  List<String> items;
  String fontFamily;

  DropDownItem(List<String> items, String fontFamily) {
    this.items = items;
    this.fontFamily = fontFamily;
  }

  @override
  _DropDownItemState createState() => _DropDownItemState(items[0], fontFamily);

}

class _DropDownItemState extends State<DropDownItem> {
  String dropdownValue;
  String fontFamily;

  _DropDownItemState(String dropdownValue, String fontFamily) {
    this.dropdownValue = dropdownValue;
    this.fontFamily = fontFamily;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 40,
        decoration: ShapeDecoration(
          // color: Colors.white,
          color: Color(0xFFEDFAFD),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(null),
              iconSize: 24,
              elevation: 0,
              underline: Container(
                height: 0,
                color: Colors.black,
              ),
              onChanged: (String newValue) {
                setState((){
                  dropdownValue = newValue;
                });
              },
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        )
    );
  }
}
