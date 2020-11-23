import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';

class BannerJ extends StatefulWidget {
  @override
  _BannerJState createState() => _BannerJState();
}

class _BannerJState extends State<BannerJ> {
  @override
  void initState() {
    super.initState();

    Admob.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AdmobBanner(
        adUnitId: AdmobBanner.testAdUnitId,
        adSize: AdmobBannerSize.ADAPTIVE_BANNER(
          width: MediaQuery.of(context).size.width.toInt(),
        ),
      ),
    );
  }
}

AdmobInterstitial admobInterstitial = AdmobInterstitial(
  adUnitId: AdmobInterstitial.testAdUnitId,
);

loadad() {
  admobInterstitial.load();
}

showad() async {
  if (await admobInterstitial.isLoaded) {
    admobInterstitial.show();
  }
}

ded() {
  admobInterstitial.dispose();
}
