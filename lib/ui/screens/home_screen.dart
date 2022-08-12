import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tasbeeh_counter/core/constants/configs.dart';
import 'package:tasbeeh_counter/core/constants/text_styles.dart';
import 'package:tasbeeh_counter/ui/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  ///ad mob
  bool isLoaded = false;
  late BannerAd myBanner;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  // Widget okButton = TextButton(
  //   child: Text("OK"),
  //   onPressed: () {},
  // );

  ///admob
  void dispose() {
    myBanner.dispose();

    super.dispose();
  }

  ///admob
  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        width: double.infinity,
        height: myBanner.size.height.toDouble(),
        alignment: Alignment.center,
        child: AdWidget(ad: myBanner),
      );
    }
    return Container();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///ad mob banner
    myBanner = BannerAd(
      adUnitId: AppConfigs.adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            isLoaded = true;
          });
        },
        onAdFailedToLoad: (_, error) {
          print('Ad failed to load with Error: $error');
        },
      ),
    );

    // Load ads.
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffeeeeee),
        appBar: AppBar(
          title: const Text('Counter'),
          // actions: <Widget>[
          //   Padding(
          //       padding: EdgeInsets.only(right: 20.0),
          //       child: GestureDetector(
          //         onTap: () {},
          //         child: Icon(Icons.more_vert),
          //       )),
          // ],
        ),
        drawer: const MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 180.0,
              ),

              ///main Text
              Text(
                '$_counter',
                style: counterTextStyle,
              ),
              const Spacer(),

              ///  Button 1 & 2 here
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _decrementCounter();
                        },
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xff5a595b),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 50.0,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Reset"),
                                    content: const Text(
                                        "Do you want to reset the counter ?"),
                                    actions: [
                                      TextButton(
                                        child: const Text("Cancel"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          setState(() {
                                            _counter = 0;
                                            Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ],
                                  ));
                        },
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              // color: Colors.black87,
                              color: const Color(0xff5a595b),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Reset",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),

              ///  Button 3 here
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    _incrementCounter();
                  },
                  child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xff5a595b),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50.0,
          // color: Colors.black,
          color: Colors.white,
          child: checkForAd(),
        ));
  }
}
