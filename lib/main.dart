import 'package:flutter/material.dart';

import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: ['testDevice'],
  );

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: MyApp.targetingInfo,
      listener: (MobileAdEvent event) {
        print('bannerAd $event');
      },
    );
  }

  BannerAd bannerAd;
  @override
  void initState() {
    FirebaseAdMob.instance.initialize(
      appId: BannerAd.testAdUnitId,
    );
    bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}



