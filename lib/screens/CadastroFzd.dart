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

class CadastroFzd extends StatelessWidget {
  List _nome = new List();
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
      body: CustomForm(_nome),
      drawer: CustomDrawer(this._nome),
    );
  }
}

// -- FORM
class CustomForm extends StatefulWidget {

  List _nome;

  CustomForm(List nome) {
    this._nome = nome;
  }
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _productionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
           this.widget._nome.addAll(model.nome);
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
                        child: Text("Cadastrar Fazenda",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
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
                                        if (field.length == 0) return "Dê um nome para sua fazenda!";
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Endereço:",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                  child: Container(
                                    height: 40,
                                    child: TextFormField(
                                      controller: _adressController,
                                      validator: (field) {
                                        if (field.length == 0) return "Informe o endereço!";
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Produção primária:",
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                                  child: Container(
                                    height: 40,
                                    child: TextFormField(
                                      controller: _productionController,
                                      validator: (field) {
                                        if (field.length == 0) return "Informe a produção primária!";
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
                                child: _image == null
                                    ? Container()
                                    : Image.file(_image),
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
                              controller: _descriptionController,
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
                          label: Text('Cadastrar Fazenda',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()) {
                              Map<String,dynamic> farmData = {
                                'name': _nameController.text,
                                'address': _adressController.text,
                                'productionPrimary': _productionController.text,
                                'description': _descriptionController.text,
                                'image': '',
                              };

                              debugPrint(farmData.toString());
                              model.createFarmData(farmData, _image);

                              final snackBar = SnackBar(
                                content: Text('Fazenda cadastrada!'),
                                backgroundColor: Colors.green,
                              );

                              Scaffold.of(context).showSnackBar(snackBar);
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

