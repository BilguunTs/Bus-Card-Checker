import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text('үлдэгдэл',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 25.0)),
              ),
              DataColumn(
                label: Text(
                  'буудал',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                ),
              ),
              DataColumn(
                label: Text(
                  'Role',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.white),
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text("Refresh"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
    ;
  }
}

class SliverTest extends StatelessWidget {
  bool shouldRender = false;
  SliverTest({bool shouldRender}) {
    this.shouldRender = shouldRender;
  }
// SliverAppBar is declared in Scaffold.body, in slivers of a
  // CustomScrollView.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedContainer(
        transform: !shouldRender
            ? (Matrix4.identity()
              ..translate(0.025 * width, 0.025 * height)
              ..scale(0.95, 0.95))
            : Matrix4.identity(),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutSine,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: height / 4,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        "10000₮",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
                background: Image.network(
                  'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: height,
                child: CardData(),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: ButtonBar(
      //     alignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       Row(
      //         children: <Widget>[
      //           const Text('snap'),
      //         ],
      //       ),
      //       Row(
      //         children: <Widget>[
      //           const Text('floating'),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
