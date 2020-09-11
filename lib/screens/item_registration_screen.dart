import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
  home: ItemRegister(),
  ),
);

class ItemRegister extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF121416),
        // backgroundColor: Colors.black87,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("assets/cow.png", alignment: Alignment.center, scale: 10,),
        leading: RaisedButton(
          color: Color(0xFF121416),
          // color: Colors.black12,
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
            color: Color(0xFF121416),
            // color: Colors.black12,
            onPressed: () {
              // vai para as mensagens...
            },
          ),
        ],
      ),
      body: CustomForm(),
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      //   child: FloatingActionButton.extended(
      //     onPressed: () {},
      //     icon: Icon(Icons.add,
      //       color: Colors.white,
      //       // color: Colors.black,
      //     ),
      //     label: Text("Cadastrar Item",
      //       style: TextStyle(
      //         // color: Colors.black,
      //         color: Colors.white,
      //         fontSize: 18,
      //         fontWeight: FontWeight.w700,
      //       ),
      //     ),
      //     // backgroundColor: Colors.black87,
      //     backgroundColor: Color(0xFF121416),
      //     elevation: 0,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
      //     ),
      //   ),
      // )
    );
  }
}

// -- FORM
class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<File> image;

  pickImageFromGallery(ImageSource source) {
    setState(() {
      image = ImagePicker.pickImage(source: source);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
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
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Flexible(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                controller: _nameController,
                                validator: (field) {
                                  if (field.length < 3) return "O nome precisa ter mais de 3 letras!";
                                  return null;
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  // fillColor: Colors.white,
                                  fillColor: Color(0xFFF4F5F6),
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
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                            pickImageFromGallery(ImageSource.gallery);
                        },
                        icon: Icon(Icons.save_alt,
                          size: 20,
                        ),
                        label: Text("Carregar",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        elevation: 0,
                        // color: Colors.white,
                        color: Color(0xFFF4F5F6),
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
                  child: DropDownItem(['À venda', 'Exibição',]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Descrição:",
                    style: TextStyle(
                      fontSize: 20,
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
                      height: 200,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 7,
                        maxLines: 7,
                        decoration: InputDecoration(
                          filled: true,
                          // fillColor: Colors.white,
                          fillColor: Color(0xFFF4F5F6),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Align(
                  alignment: Alignment.center,
                  child: RaisedButton.icon(
                    elevation: 0,
                    icon: Icon(Icons.add),
                    label: Text('Cadastrar'),
                    onPressed: () {
                      if(_formKey.currentState.validate());
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// -- DROPDOWN
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
        padding: EdgeInsets.all(10),
        height: 40,
        decoration: ShapeDecoration(
          // color: Colors.white,
          color: Color(0xFFF4F5F6),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
          ),
        ),
        child: SizedBox(
          width: 350,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration.collapsed(hintText: null),
            value: dropdownValue,
            iconSize: 24,
            elevation: 0,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
    );
  }
}
