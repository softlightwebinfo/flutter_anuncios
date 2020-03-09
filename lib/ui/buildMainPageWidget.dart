import 'package:flutter/material.dart';
import 'package:flutter_anuncios/models/TopItem.dart';
import 'package:flutter_anuncios/services/TopServices.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../settings.dart';

class BuildMainPageWidget extends StatefulWidget {
  final int index;
  final TabController tabController;

  BuildMainPageWidget({@required this.index, @required this.tabController});

  @override
  _BuildMainPageWidgetState createState() => _BuildMainPageWidgetState();
}

class _BuildMainPageWidgetState extends State<BuildMainPageWidget> {
  List<TopItem> items;

  @override
  void initState() {
    super.initState();
    setState(() {
      items = TopServices().getTopItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return Container(
          height: MediaQuery.of(context).size.height + 30,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                child: TabBar(
                  onTap: (index) {},
                  indicatorColor: colorTheme,
                  unselectedLabelColor: Colors.grey,
                  labelColor: colorTheme,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  isScrollable: false,
                  controller: widget.tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Top 1"),
                    ),
                    Tab(
                      child: Text("Top 2"),
                    ),
                    Tab(
                      child: Text("Top 3"),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 185,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  controller: widget.tabController,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            color: colorTheme,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text("$index"),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.count(
                          2,
                          index.isEven ? 2 : 1,
                        ),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StaggeredGridView.countBuilder(
                        itemCount: items.length,
                        crossAxisCount: 4,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 0.2,
                                    spreadRadius: 1.5,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            child: Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.network(
                                    items[index].imagePath,
                                    fit: BoxFit.cover,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    items[index].title,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text(items[index].times),
                                      Icon(
                                        Icons.favorite_border,
                                        size: 16,
                                      ),
                                      Text(items[index].likes),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: colorTheme,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 6.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 1,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            color: colorTheme,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Text("$index"),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.count(
                          2,
                          index.isEven ? 2 : 1,
                        ),
                        mainAxisSpacing: 4.0,
                        crossAxisSpacing: 4.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Page 2"),
          ),
        );
      case 2:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Page 3"),
          ),
        );
      case 3:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Page 4"),
          ),
        );
      case 4:
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Page 5"),
          ),
        );
    }
    return null;
  }
}
