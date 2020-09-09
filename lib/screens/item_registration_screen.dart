import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: ItemRegister(),
  ),
);

class ItemRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("assets/cow.png", alignment: Alignment.center, scale: 5,),
        actions: [
          RaisedButton(
            // color: Colors.white,
            //padding: EdgeInsets.only(0.2),
            child:
            Icon(Icons.message),
            color: Colors.white,
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: Container(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OutlineButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.save_alt,
                            size: 20,
                          ),
                          label: Text("Carregar"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['Produto', 'Animal',]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['Público', 'Privado',]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: DropDownItem(['À Venda', 'Exibição',]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Descrição:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add,
          color: Colors.black,
        ),
        label: Text("Cadastrar Item",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
        ),
      ),
    );
  }
}

class DropDownItem extends StatefulWidget {
  List<String> items;

  DropDownItem(List<String> items) {
    this.items = items;
  }

  @override
  _DropDownItemState createState() => _DropDownItemState(items[0]);

}

class _DropDownItemState extends State<DropDownItem> {
  String dropdownValue;

  _DropDownItemState(String dropdownValue) {
    this.dropdownValue = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        height: 40,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5,
                style: BorderStyle.solid,
              ),
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
