import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:projeto_muh_compmov/utils/default_scaffold.dart';
import 'package:scoped_model/scoped_model.dart';

class ItemScreen extends StatefulWidget {
  final String _idProduto;
  final String _idFazenda;
  final String _nomeFazenda;

  ItemScreen(this._idFazenda, this._idProduto, this._nomeFazenda);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        floatingButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ItemRegister(widget._idFazenda, widget._idProduto, widget._nomeFazenda))
            ).then((value) async {
              await Future.delayed(Duration(seconds: 2));
              setState(() {}); // Refresh
            });
          },
        ),
        backgroundColor: Colors.grey[100],
        bodyWidget: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if(model.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(Duration(seconds: 1));
                  setState(() {}); // Refresh
                },
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: model.getItems(widget._idFazenda, widget._idProduto),
                        builder: (_, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return new Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  padding: EdgeInsets.all(2),
                                  child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              snapshot.data[index].data["name"],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(snapshot.data[index].data["description"]),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Image.network(snapshot.data[index].data["image"]),
                                          )
                                        ],
                                      )
                                  ),
                                );
                              },
                            );
                          }
                        },
                      )
                    )
                  ],
                ),
              );
            }
          }
      )
    );
  }
}

