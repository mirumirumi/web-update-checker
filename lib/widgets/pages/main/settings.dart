import '../../../importer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with AutomaticKeepAliveClientMixin {
  final String _title = 'Settings';

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
              Container(color: Colors.red, width: 300, height: 100),


              //CheckboxListTileやSwitchListTileが良さそう


            ],
          ),
        ),
      ),
    );
  }
}


