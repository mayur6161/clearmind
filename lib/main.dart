import 'package:clearmind/playlist_five/page_manager.dart';
import 'package:clearmind/playlist_four/page_manager.dart';
import 'package:clearmind/playlist_one/page_manager.dart';
import 'package:clearmind/Playlist_three/page_manager.dart';
import 'package:clearmind/playlist_six/page_manager.dart';
import 'package:clearmind/playlist_two/page_manager.dart';
import 'package:clearmind/widgets/colours.dart';
import 'package:clearmind/widgets/splashscree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          backgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final newVersion = NewVersion(
      iOSId: 'com.clearmind.app12',
      androidId: 'com.clearmind.app12',
    );

    const simpleBehavior = false;

    if (simpleBehavior) {
      basicStatusCheck(newVersion);
    } else {
      advancedStatusCheck(newVersion);
    }
  }

  basicStatusCheck(NewVersion newVersion) {
    newVersion.showAlertIfNecessary(context: context);
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      newVersion.showUpdateDialog(
        allowDismissal: false,
        context: context,
        versionStatus: status,
        dialogTitle: "Update Your App",
        updateButtonText: "Update App",
        dismissButtonText: "Close App",
        dialogText: "Please Install Latest Version Of The App from Version " +
            status.localVersion +
            " To Version " +
            status.storeVersion,
        dismissAction: () {
          SystemNavigator.pop();
        },
      );

      // ignore: avoid_print
      print("DEVICE : " + status.localVersion);
      // ignore: avoid_print
      print("STORE : " + status.storeVersion);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimaryColor, kSecondaryColor],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
              title: const Text(
                "Clearmind",
                style: TextStyle(fontSize: 25, fontFamily: "Stylish"),
              ),
              elevation: 0,
              centerTitle: true,
            ),
          ],
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        colors: [kPrimaryColor, kSecondaryColor],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Container(
                      width: 1000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontFamily: 'Horizon',
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                RotateAnimatedText('BE AWESOME'),
                                RotateAnimatedText('BE OPTIMISTIC'),
                                RotateAnimatedText('BE DIFFERENT'),
                              ],
                              repeatForever: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                HomeView(),
                HomeView2(),
                HomeView3(),
              ],
            ),
          ),
        ),
      );
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_one(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/yoga.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Stress Relief",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_two(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/nature.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Nature Sound",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeView2 extends StatelessWidget {
  const HomeView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_three(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/work.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Work Sound",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_four(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/sleep.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Sleep Sound",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeView3 extends StatelessWidget {
  const HomeView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_five(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/mind.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Calm Mind",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Playlist_six(),
                ),
              );
            },
            child: Container(
              width: width / 2 - 16,
              height: width / 2 - 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/images/mood.png",
                    height: width / 2 - 92,
                  ),
                  Container(
                    height: 30,
                    child: const Text(
                      "Cool Mood",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Semibold",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
