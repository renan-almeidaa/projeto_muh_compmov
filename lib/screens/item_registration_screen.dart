import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:projeto_muh_compmov/drawer/Drawer.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

// void main() => runApp(MaterialApp(
//   home: ItemRegister('teste'),
//   ),
// );

class ItemRegister extends StatelessWidget {
  String _farmId;
  String _nomefazenda;
  String _productId;
  List _nomes = new List();

  ItemRegister(String farmId, String productId, String nomefazenda) {
    this._farmId = farmId;
    this._productId = productId;
    this._nomefazenda = nomefazenda;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        // backgroundColor: Color(0xFF121416),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        //  leading: Image.asset("imagens/cow.png"),
        title: Image.asset("assets/vakinha.png", alignment: Alignment.center, scale: 3.5,),
        actions: [
          RaisedButton(
            // color: Colors.white,
            //padding: EdgeInsets.only(0.2),
            child:
            Icon(Icons.chat,
              color: Colors.black,
            ),
            // color: Color(0xFF121416),
            color: Colors.white,
            onPressed: () {
              // vai para as mensagens...
            },
          ),
        ],
      ),
      body: CustomForm(this._farmId, this._productId, this._nomes),
      drawer: CustomDrawer(),
    );
  }
}

// -- FORM
class CustomForm extends StatefulWidget {
  String _farmId;
  String _productId;
  List _nomes;

  CustomForm(String farmId, String productId, List nomes) {
    this._farmId = farmId;
    this._productId = productId;
    this._nomes = nomes;
  }

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String,String> _dropdownMenus = Map<String,String>();

  File _image;
  String _filename = '';

  String getFileName(File file) {
    return basename(file.path);
  }

  pickImageFromGallery(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final PickedFile image = await picker.getImage(source: source);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if(model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          this.widget._nomes.addAll(model.nome);
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
                                        fillColor: Colors.white,
                                        // fillColor: Color(0xFFF4F5F6),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                          borderSide: BorderSide(
                                            width: 1,
                                          ),
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
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                child: Container(
                                  child: Text(_filename,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton.icon(
                              onPressed: () async {
                                await pickImageFromGallery(ImageSource.gallery);

                                setState(() {
                                  _filename = getFileName(_image);
                                });

                                final snackBar = SnackBar(
                                  content: Text('Imagem carregada!'),
                                  backgroundColor: Colors.blue,
                                );

                                Scaffold.of(context).showSnackBar(snackBar);
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
                              color: Colors.white,
                              // color: Color(0xFFF4F5F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                side: BorderSide(),
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
                        child: DropDownItem(['Produto', 'Animal',], 'type', _dropdownMenus),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: DropDownItem(['Público', 'Privado',], 'visibility', _dropdownMenus),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: DropDownItem(['À venda', 'Exibição',], 'status', _dropdownMenus),
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
                            height: 150,
                            child: TextFormField(
                              controller: _descController,
                              keyboardType: TextInputType.multiline,
                              minLines: 6,
                              maxLines: 6,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                // fillColor: Color(0xFFF4F5F6),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: RaisedButton.icon(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          elevation: 0,
                          icon: Icon(Icons.add,
                            color: Colors.white,
                          ),
                          label: Text('Cadastrar Item',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()) {
                              Map<String,dynamic> itemData = {
                                'name':_nameController.text,
                                'image':'',
                                'type':_dropdownMenus['type'],
                                'visibility':_dropdownMenus['visibility'],
                                'status':_dropdownMenus['status'],
                                'description':_descController.text,
                              };
                              debugPrint(itemData.toString());
                              model.createItemData(itemData, _image, widget._farmId, widget._productId);

                              final snackBar = SnackBar(
                                content: Text('Item cadastrado!'),
                                backgroundColor: Colors.green,
                              );

                              Scaffold.of(context).showSnackBar(snackBar);
                              await new Future.delayed(const Duration(seconds: 1, milliseconds: 500));
                              Navigator.of(context).pop();

                            } else {
                              final snackBar = SnackBar(
                                content: Text('Dados incompletos'),
                                backgroundColor: Colors.red,
                              );

                              Scaffold.of(context).showSnackBar(snackBar);
                            }
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
      },
    );
  }
}


// -- DROPDOWN
class DropDownItem extends StatefulWidget {
  List<String> _items;
  String _mapKey;
  Map<String,String> _dropdownMap;

  DropDownItem(List<String> items, String mapKey, Map<String,String> dropdownMap) {
    this._items = items;
    this._mapKey = mapKey;
    this._dropdownMap = dropdownMap;

    this._dropdownMap.putIfAbsent(this._mapKey, () => this._items[0]);
  }

  @override
  _DropDownItemState createState() => _DropDownItemState(_items[0]);

}

class _DropDownItemState extends State<DropDownItem> {
  String _dropdownValue;

  _DropDownItemState(String dropdownValue) {
    this._dropdownValue = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 42,
        decoration: ShapeDecoration(
          color: Colors.white,
          // color: Color(0xFFF4F5F6),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
          ),
        ),
        child: SizedBox(
          width: 350,
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration.collapsed(hintText: null),
            value: _dropdownValue,
            iconSize: 24,
            elevation: 0,
            onChanged: (String newValue) {
              setState((){
                _dropdownValue = newValue;
                widget._dropdownMap.update(widget._mapKey, (value) => value = newValue);
              });
            },
            items: widget._items.map<DropdownMenuItem<String>>((String value) {
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
