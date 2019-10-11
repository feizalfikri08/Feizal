import 'package:flutter/material.dart';
import 'package:gojek/beranda/beranda_model.dart';
import 'package:gojek/beranda/beranda_travel_appbar.dart';
import 'package:gojek/constans.dart';
import 'dart:async';

import 'package:gojek/beranda/beranda_tabbar.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<TravelService> _travelServiceList = [];

  @override
  void initState() {
    super.initState();

    _travelServiceList.add(new TravelService(
      image: Icons.smartphone,
      color: TravelPalette.menuRide,
      title: "Paket Internet",
    ));
    _travelServiceList.add(new TravelService(
        image: Icons.airport_shuttle,
        color: TravelPalette.menuCar,
        title: "Antar Jemput"));
    _travelServiceList.add(new TravelService(
        image: Icons.calendar_today,
        color: TravelPalette.menuBluebird,
        title: "Atur Schedule"));
    _travelServiceList.add(new TravelService(
        image: Icons.restaurant,
        color: TravelPalette.menuFood,
        title: "Restaurant"));
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new TravelAppBar(),
        backgroundColor: TravelPalette.grey,
        body: new Container(
          child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildMenu(),
                      _buildTravelServicesMenu(),
                    ],
                  )),
              new Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: new Column(
                  children: <Widget>[
                    _buildGotravelFeatured(),
                    _buildDestinasi(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return new Container(
        height: 120.0,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(3.0))),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                  ),
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(3.0),
                      topRight: new Radius.circular(3.0))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Tiket",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/bus.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Tiket Bus",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/hotel.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Tiket Hotel",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/train.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Tiket Kereta",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/travel.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Tiket Pesawat",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildTravelServicesMenu() {
    return new SizedBox(
        width: double.infinity,
        height: 125.0,
        child: new Container(
            margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 4,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowTravelService(_travelServiceList[position]);
                })));
  }

  Widget _rowTravelService(TravelService travelService) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _buildMenuBottomSheet();
                  });
            },
            child: new Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: TravelPalette.grey200, width: 1.0),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(30.0))),
              padding: EdgeInsets.all(12.0),
              child: new Icon(
                travelService.image,
                color: travelService.color,
                size: 32.0,
              ),
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 9.0),
          ),
          new Text(travelService.title, style: new TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }

  Widget _buildGotravelFeatured() {
    return new Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Text(
            "Traveling",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          new Text(
            "Pilihan Terbaik",
            style: new TextStyle(fontFamily: "NeoSansBold"),
          ),
          new SizedBox(
            height: 200.0,
            child: FutureBuilder<List>(
                future: fetchTravel(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return new ListView.builder(
                      itemCount: snapshot.data.length,
                      padding: EdgeInsets.only(top: 12.0),
                      physics: new ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _rowGoTravelFeatured(snapshot.data[index]);
                      },
                    );
                  }
                  return Center(
                    child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: const CircularProgressIndicator()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _rowGoTravelFeatured(Travel travel) {
    return new Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: Colors.amberAccent,
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new Detail(
              title: travel.title,
              harga: travel.harga,
              image: travel.image,
            ),
          )),
          child: new Column(
            children: <Widget>[
              new ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: new Image.asset(
                  travel.image,
                  width: 132.0,
                  height: 132.0,
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              new Text(
                travel.title,
              ),
              new Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              new Text(
                travel.harga,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDestinasi() {
    return new Container(
        margin: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: fetchDestinasi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return new Column(
                  children: snapshot.data.map<Widget>((data) {
                return _rowDestinasi(data);
              }).toList());
            }
            return Center(
              child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: const CircularProgressIndicator()),
            );
          },
        ));
  }

  Widget _rowDestinasi(Destinasi destinasi) {
    return new Container(
      height: 320.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 16.0),
            width: double.infinity,
            height: 1.0,
            color: TravelPalette.grey200,
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: new Image.asset(
              destinasi.image,
              height: 172.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          new Text(
            destinasi.title,
            style: new TextStyle(fontFamily: "NeoSansBold", fontSize: 16.0),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            destinasi.content,
            maxLines: 2,
            softWrap: true,
            style: new TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 6.0),
          ),
          new Container(
            alignment: Alignment.centerRight,
            child: new MaterialButton(
              color: TravelPalette.green,
              onPressed: () {},
              child: new Text(
                destinasi.button,
                style: new TextStyle(
                    color: Colors.white,
                    fontFamily: "NeoSansBold",
                    fontSize: 12.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuBottomSheet() {
    return new StatefulBuilder(builder: (c, s) {
      return new SafeArea(
          child: new Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        width: double.maxFinite,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: Colors.white),
        child: new Column(children: <Widget>[
          new Icon(
            Icons.drag_handle,
            color: TravelPalette.grey,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "Traveller",
                style: new TextStyle(fontFamily: "NeoSansBold", fontSize: 18.0),
              ),
            ],
          ),
          new Container(
            height: 300.0,
            child: new GridView.builder(
                physics: new NeverScrollableScrollPhysics(),
                itemCount: _travelServiceList.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowTravelService(_travelServiceList[position]);
                }),
          ),
        ]),
      ));
    });
  }

  Future<List<Travel>> fetchTravel() async {
    List<Travel> _goTravelFeaturedList = [];
    _goTravelFeaturedList.add(new Travel(
      title: " Antelope Canyon",
      harga: "Rp.10.500.000",
      image: "assets/images/1.jpg",
    ));
    _goTravelFeaturedList.add(new Travel(
        title: "Aogashima Volcano",
        harga: "Rp.10.800.000",
        image: "assets/images/2.jpg"));
    _goTravelFeaturedList.add(new Travel(
        title: "Crystalline Turquoise Lake",
        harga: "Rp.17.800.000",
        image: "assets/images/10.jpg"));
    _goTravelFeaturedList.add(new Travel(
        title: "Kota Bern",
        harga: "Rp.12.800.000",
        image: "assets/images/3.jpg"));
    _goTravelFeaturedList.add(new Travel(
        title: "Beachy Head",
        harga: "Rp.14.800.000",
        image: "assets/images/5.jpg"));

    return new Future.delayed(new Duration(seconds: 1), () {
      return _goTravelFeaturedList;
    });
  }

  Future<List<Destinasi>> fetchDestinasi() async {
    List<Destinasi> _poromoList = [];

    _poromoList.add(new Destinasi(
        image: "assets/images/6.jpg",
        title: "Destinasi Pulau Amorgos",
        content:
            "Amorgos adalah pulau paling timur dari kelompok pulau Cyclades dan pulau terdekat dengan kelompok pulau Dodecanese di Yunani .",
        button: "Selengkapnya"));
    _poromoList.add(new Destinasi(
        image: "assets/images/7.jpg",
        title: "Destinasi Pulau Hainan",
        content:
            "Hainan termasuk kepulauan yang terdiri dari pulau-pulau lainnya seperti Zhongsha, Xisha, dan Nansha serta wilayah laut sekitarnya. Menjadi pulau terbesar kedua di Cina",
        button: "Selengkapnya"));
    _poromoList.add(new Destinasi(
        image: "assets/images/8.jpg",
        title: " Dusseldorf",
        content:
            " Dusseldorf, adalah pusat ekonomi regional yang terletak di tepi sungai Rhine",
        button: "Selengkapnya"));
    _poromoList.add(new Destinasi(
        image: "assets/images/9.jpg",
        title: "Los Angeles",
        content:
            "Los Angeles dengan jumlah penduduk sebanyak 3.792.621 jiwa sesuai Sensus Amerika Serikat 2010, adalah kota terpadat di negara bagian California, dan kota terpadat kedua di Amerika Serikat, setelah New York City. ",
        button: "Selengkapnya"));
    return new Future.delayed(new Duration(seconds: 3), () {
      return _poromoList;
    });
  }
}

class Detail extends StatelessWidget {
  final String title;
  final String image;
  final String harga;

  const Detail({
    Key key,
    @required this.title,
    @required this.image,
    @required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 240.0,
            child: new Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        title,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      new Text(harga),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // new Scaffold(
          //   appBar: new AppBar(
          //     backgroundColor: Colors.amber,
          //     title: new Text("Daftar Elektronik"),
          //     bottom: new TabBar(
          //       tabs: <Widget>[
          //         new Tab(
          //           icon: new Icon(Icons.computer),
          //         ),
          //         new Tab(
          //           icon: new Icon(Icons.headset),
          //         ),
          //         new Tab(
          //           icon: new Icon(Icons.radio),
          //         ),
          //         new Tab(
          //           icon: new Icon(Icons.smartphone),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Card(
              child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                  style: new TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
