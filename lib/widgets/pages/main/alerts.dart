import '../../../importer.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertsPage extends StatefulWidget {
  @override
  _AlertsPageState createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> with AutomaticKeepAliveClientMixin {
  final String _title = 'Updates';
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); //なくても動くけどweak warningを消せる
    return Scaffold(
      appBar: mainAppBar(_title),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$_counter"),
              Container(color: Colors.green, width: 100, height: 100),
              TextButton(onPressed: _increment,
                child: Container(
                    color: Colors.purple, width: 100, height: 100),)
            ],
          ),
        ),
      ),
    );
  }
}


