import 'package:flutter/material.dart';
import 'package:hiepnx/components/photo_hero.dart';
import 'package:hiepnx/screens/card_infos/card_info.dart';
import 'package:hiepnx/screens/test_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  List<String> cards = [];

  @override
  void initState() {
    super.initState();
    cards.add("assets/images/con_ca_0.jpg");
    cards.add("assets/images/con_chim.jpg");
    cards.add("assets/images/con_cho.jpg");
    cards.add("assets/images/con_ga.jpg");
    cards.add("assets/images/con_gau.jpg");
    cards.add("assets/images/con_lon.jpg");
    cards.add("assets/images/con_meo.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funny"),
      ),
      body: GridView.builder(
        itemCount: cards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context, index) => _makeCardItem(index, cards[index]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: <Widget>[
            Icon(Icons.assignment),
            Text("Test")
          ],
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return TestScreen();
            }
          ));
        }
      ),
    );
  }

  Widget _makeCardItem(int index, String url) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: PhotoHero(
        photo: url,
        width: double.infinity,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return CardInfo(
                url: url,
              );
            }
          ));
        },
      ),
    );
  }
}