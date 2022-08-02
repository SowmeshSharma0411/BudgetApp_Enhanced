import 'package:budgetapp/pages/google_signin_out.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/main_page.dart';

//Gsheet credentials :
const _credentails = r'''
{
  "type": "service_account",
  "project_id": "budgetapp-357709",
  "private_key_id": "fac1109d6a2083f17319cc991d9aa7953f26cee4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCketpHi2oCMNAO\nbmrMK3mK1Bkaq/Ld7T45384GqUnM048YmZqs2uNMaH7OX9gW8f9LXiMdDficuFBZ\nfcOf351mpSxNfX0s4YrUzsWOM6rtWa8wFYOzuMCvaH+2Qpn6dQGsCKHHpIH8Ks0E\nQC/nAEuNeYXwubGOvBH8oi4+SbE0rzqsFp0pCVkySApFFkQUtEq76hPvHTs0kzNY\nyoPcRYkl6t/E0QtwxzXcdowkKO6C0e1ugx1ktRFaUpmFtfhhrOHbVjmccLWq3N7a\nha5YoDSNjoiULItpna4Ukbxb4FucW+b2zU9DGtWbu1pobrSJbpeCeNNOGvstcYqk\nSXAC7sxpAgMBAAECggEAAxVYzScZiZK51cMFyylkYQdzZ7oroBoth+126eeBLj77\nJq3ur4w3a/dlOCmldGtDNIBRmXH2R27Wz8Sq9tU2i/+I7/Q/W48bWIlLST+h9f4P\n43Xlyjs9vnp2DKTdPAvqCC9ainKLEfh8Vfa9LYzZfbyWivuaLuSXuqDdZWmUsgaw\nUxPsL3UBCrHcr1KrmL9Ufin8QI0V7qg3BO5aEYm4revJ+Go81jWi1Bq2BWajdqE3\n4Tr0zIht6X9I2z2WCeEFiupe4oDpqrC2//VULCl8gF+IyZnxIhg99gAu8cElrgBv\nhXeoZfb5ty8eUSOU3w4h/NkqjTNnnt2/DUyAtb4cIQKBgQDRxfb3+wRiPUEyjrDt\nISyIuanRJxhYvNgkaqGErYtFRdywJVNr2h3EBuYNUrJqzxajBRICEKiEMm3y9CLk\nzgUFqmUs/gXV7C/mfqakOurAv6OZBFhxbBe+OL8E65CBQcOXLhlCLgoxHFSPRmtM\nyz2nYiZL3ZVN6P4Bfn3yZ2zVCQKBgQDIubsNF/nT1MZ1x/CNw9LDYUyL1Coabr10\nTcsFd5DiV+LTYZ+hFuI9IkX7TVPOpO+TBOvOL61WSpJz2zBCuQ+76BztU6jVkLPL\n3zerSxXGQ/E59BSQgSAYHhjK/IrgoZ19dq6mqGTy1TuruXqWHRKAaW2/Y5IQtVPt\nXWst9Vp0YQKBgQCD3Jj+EIAU8MRG74MvzCaeW3bvzk9zmGGVoqGdMSnWha/P2eay\naQ1E58E8prsYgMyN9OX4/levobOTgPteMFLf2Nh4i8VHT4xcq0g8+/wM5WoFCcI+\nqd/S5wDMKvdPCPPV2FhwTViCvng5B97zCt7alMvV7JepvcfNUKIC+hhjYQKBgQCs\nOfCtA21wvJisZqmYefVVfx7Wu2yE0Y/tQvJ39mdyTkZpaNI2vhPQsJ+rSGYoYIzP\ncOGDQJVR/Ro8Hk4Cchd1+2sWlzm+RTKAMz7o0rwUKifIug0LEEAhcXGEebwPkZw4\nEqU4ijRTx3Iznin4s2k0lUF9fknN3Efu2sEj5el/AQKBgQDLtb0F4Qc+eXlu2YIF\n2KQ1trPvPOSbtWtfePHQG01DRIgw9kIgFBjHJQHKKlOurnOREEWF4HVLz160huiq\nPHuF+TFFISxhRqpfuoMyuv5c7h8vxKzkmrLC+aXMaRc2z817aWhXhfLyzSDHCl9h\nrEv10NVRgnzwqcU28CzjLNxChQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "expense-tracker@budgetapp-357709.iam.gserviceaccount.com",
  "client_id": "109461506503378508129",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expense-tracker%40budgetapp-357709.iam.gserviceaccount.com"
}

''';

//spreadsheet id :
const _spreadsheetId = '1yvHufHSBFmGpsS8I2imx9SkL01Hma5lsPayvmth3rXE';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
