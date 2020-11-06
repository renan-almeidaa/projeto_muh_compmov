
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:projeto_muh_compmov/feed/feed_image.dart';
import 'package:projeto_muh_compmov/utils/default_scaffold.dart';
import 'package:projeto_muh_compmov/feed/feed.dart';
import 'package:projeto_muh_compmov/feed/ifeed.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(_App());

// Test main
class _App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: MaterialApp(
          title: 'Muh',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color.fromARGB(255, 0, 0, 0)
          ),
          home: DefaultScaffold(bodyWidget: FeedScreen(), backgroundColor: Colors.grey[100],),
          debugShowCheckedModeBanner: false,
        )
    );
  }

}

class FeedScreen extends StatefulWidget {

  @override
  _FeedScreenState createState() => _FeedScreenState();

}

class _FeedScreenState extends State<FeedScreen> {

  List<IFeed> _feed = [];

  // Inicialização utilizada para testes
  @override
  void initState() {
    super.initState();
    _feed.add(Feed(
      text: "Uma dúzia de ovos R\$5,00",
      userInfo: {"image" : "https://plx-api.plox.com.br/files/body/old/o-rei-3.jpg", "name" : "Bruno Mezenga"}
    ));
    _feed.add(FeedImage(
      text: "Mais um dia, mais um queijo! R\$8,00 kg",
      userInfo: {"image" : "https://blogs.canalrural.com.br/coisasdocampo/wp-content/uploads/sites/11/2015/09/VACA-1.jpg", "name" : "João Carlos"},
      imageUrl: "https://www.proteste.org.br/-/media/proteste/images/home/alimentacao/queijo%20minas/pim_queijo-minas_02.png?rev=1717f860-017d-4a2d-887b-ddc8f1d6a40f"
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      bodyWidget: ListView.builder(
        itemCount: _feed.length,
        itemBuilder: (context, index) => _feed[index].render(),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

}



