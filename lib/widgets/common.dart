import '../importer.dart';
import 'package:url_launcher/url_launcher.dart';

class BasePage extends StatefulWidget {
  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  List _page = <Widget>[
    HomePage(),
    AlertsPage(),
    SettingsPage(),
  ];
  int _currentIndex = 0;
  bool _hasUpdate = false;
  PageController _pageController;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void _checkUpdate(int index) {
    setState(() {
      _hasUpdate = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _page,
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.view_list_rounded), label: ''),
          _hasUpdate
            ? BottomNavigationBarItem(
              icon:Icon(Icons.notifications_active,color:Colors.redAccent,),label:'')
            : BottomNavigationBarItem(
          icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: _currentIndex,
        fixedColor: AppMeta.primaryColor,
        onTap: (index) {
          _currentIndex = index;
          _pageController.animateToPage(
              index, duration: Duration(milliseconds: 173), curve: Curves.easeInOut
              );
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

Widget mainAppBar(String title) {
  return AppBar(
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(fontSize: 17.777),
    ),
    centerTitle: true,
    backgroundColor: AppMeta.colorWhite,
  );
}


