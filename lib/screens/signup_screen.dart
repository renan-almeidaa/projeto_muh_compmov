import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masked_text/masked_text.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  TextEditingController _genreController = TextEditingController();
  final _textBirthController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _disable = false;
  var maskFormatter = new MaskTextInputFormatter(mask: '##/##/####', filter: { "#": RegExp(r'[0-9]') });




  int selectedRadio=0;
  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val){
    setState(() {
      selectedRadio = val;
      if(val == 3){
        _disable=true;
      }else{
        _disable=false;
        _genreController = TextEditingController();
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Criar Conta',
        style: TextStyle(
          fontSize: 20.0
        ),
        ),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context,child,model){
          if(model.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: [
                  TextFormField(
                    // autofocus: false,
                    //obscureText: true,
                      validator: (text){
                        if(text.isEmpty) return 'Nome Inválido';
                      },
                      controller: _nameController,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Nome",
                          fillColor: Colors.white70)
                  ),//Nome
                  SizedBox(height:10.0),
                  TextFormField(
                    controller: _middleNameController,
                      validator: (text){
                        if(text.isEmpty) return 'Sobrenome Inválido';
                      },
                    // autofocus: false,
                    //obscureText: true,
                    // controller: _nameController,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Sobrenome",
                          fillColor: Colors.white70)
                  ),//sobrenome
                  SizedBox(height:10.0),
                  TextFormField(
                      validator: (text){
                        if(text.isEmpty || !text.contains("@")) return 'Email invalido';
                      },
                    controller: _emailController,
                    // autofocus: false,
                    //obscureText: true,
                    // controller: _nameController,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "E-mail",
                          fillColor: Colors.white70)
                  ),//email
                  SizedBox(height:10.0),
                  TextFormField(

                      validator: (text){
                        if(text.isEmpty|| text.length < 4) return 'Senha inválida!';
                      },
                    controller: _passController,
                    // autofocus: false,
                      obscureText: true,
                      //controller: _nameController,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Senha",
                          fillColor: Colors.white70)
                  ),//senha


                  SizedBox(height:10.0),
                  TextFormField(
                      inputFormatters: [maskFormatter],
                    controller: _textBirthController,
                    validator: (text){
                        if(validatorData(text))
                          return 'Data Inválida';
                    },
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Data de nascimento",
                          fillColor: Colors.white70
                      )
                  ),

                  SizedBox(height:10.0),
                  Text(
                    'Gênero (Opcional)',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),//texto genero
                Row(

                    children: <Widget>[
                      Radio(
                        value:1,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        onChanged: (val){
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Masculino',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Radio(
                        value:2,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        onChanged: (val){
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Feminino',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),//masculino ou feminino */
                  Row(
                    children: [
                      Radio(
                        value:3,
                        groupValue: selectedRadio,
                        activeColor: Colors.black,
                        onChanged: (val){
                          setSelectedRadio(val);
                        },
                      ),
                      Text(
                        'Personalizado',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),//personalizado**/

                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: _genreController,
                      enabled: _disable,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Digite aqui a personalização",
                            fillColor: Colors.white70)// set to false to disable it.
                    ),
                  ),//campo de personalização
                  SizedBox(height: 10.0,),
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 60.0,
                    child: FlatButton(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                            fontSize: 25.0
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.black)
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        String genero;
                        if(selectedRadio==1){
                          genero = 'masculino';
                        }else if(selectedRadio==2){
                          genero='feminino';
                        }else if(selectedRadio==3){
                          genero = _genreController.text;
                        }else{
                          genero ='';
                        }
                        if(_formKey.currentState.validate()){

                          Map<String,dynamic> userData = {
                            'name': _nameController.text,
                            'lastname':_middleNameController.text,
                             'email': _emailController.text,
                            'bithday': _textBirthController.text,
                            'genre': genero
                          };

                          model.signUp(
                            userData: userData,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail
                          );


                        }
                      },
                    ) ,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }


  void _onSuccess(){
    AlertDialog alert = AlertDialog(
      title: Text("Parabéns!"),
      content: Text("Conta criada com sucesso!"),
      actions: [
        FlatButton(
          child: Text('OK'),

          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);

          }
        )
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  /**
  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuario criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds:2),
        )
    );
    //Future.delayed(Duration(seconds: 2)).then((value) {
     // Navigator.of(context).pop();
    //});
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Falha ao criar usuário"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
   **/

  void _onFail(){
    AlertDialog alert = AlertDialog(
      title: Text("Erro"),
      content: Text("Falha ao criar ao conta"),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    //exibe o diálogo
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return alert;
    },
    );
  }

  bool validatorData(String data){
    try{
      DateTime.parse("data");
      return true;
    }catch(e){
      return false;
    }

  }
}
