import '../../../importer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final String _title = AppMeta.appName;

  List _createListWidgetUpdateCheckItem() {
    List result = <Widget>[];
    for (int i = 1; i <= sample.length; i++) {
      result.add(_widgetUpdateCheckItem(
          sample["sample" + i.toString()]["pageTitle"],
          sample["sample" + i.toString()]["url"],
          sample["sample" + i.toString()]["siteName"],
          sample["sample" + i.toString()]["updateAt"],
          sample["sample" + i.toString()]["hasUpdate"],
      ));
    }
    return result;
  }

  Widget _widgetUpdateCheckItem(String pageTitle, String url, String siteName, String updateAt, bool hasUpdate) {
    String domain = getDomainName(url);
    double imgSize = 23.0;
    Image favicon = getFavicon(domain, imgSize);

    return Container(
      margin: EdgeInsets.only(left: 0, bottom: 3, right: 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xFFdfe9df)),
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppMeta.colorWhite,
          shadowColor: Color(0x00000000),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 0, top: 9, right: 3, bottom: 7),
          height: 93,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Expanded(
                  child: favicon,
                  flex: 1,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text(pageTitle,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF4e4e4e),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.7,
                              height: 1.1,
                            ),),
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(url,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFb1b1b1),
                              fontWeight: FontWeight.normal,
                              fontSize: 11.3,
                              height: 1.2,
                            ),),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  Icons.update_rounded,
                                  size: 15,
                                  color: Color(0xFFa8a8a8),
                                ),
                              ),
                              Text(
                                updateAt,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFa8a8a8),
                                  fontWeight:
                                    true
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                  fontSize: 11.7,
                                  fontFamily: "B612Mono",
                                  letterSpacing: 0.01,
                                  fontStyle:
                                    true
                                      ? FontStyle.normal
                                      : FontStyle.italic,
                                ),),
                            ],
                          )
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                child: Icon(
                                  hasUpdate
                                    ? Icons.notifications_active
                                    : Icons.notifications,
                                  size: 15,
                                  color:
                                    hasUpdate
                                      ? AppMeta.primaryColor
                                      : Color(0xFFa8a8a8),
                                ),
                              ),
                              Text(
                                hasUpdate
                                  ? "New Updated!"
                                  : "no update",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFa8a8a8),
                                  fontWeight:
                                    hasUpdate
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 11.7,
                                  fontStyle:
                                    hasUpdate
                                      ? FontStyle.italic
                                      : FontStyle.normal,
                                ),),
                            ],
                          ) ,
                        ),
                      ],
                    ),
                  ],
                ),
                flex: 13,
              ),
            ],
          ),
        ),
        onPressed: () =>
            Navigator.of(context).pushNamed(
                "/webview",
                arguments: PageArgs(url, siteName)
            ),
        // onPressed: () async {
        //   url = Uri.encodeFull(url);
        //   await launch(url);
        // },
        onLongPress: () =>
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  SimpleDialog(
                    children: [
                      Text("pageTitle"),
                      Text("pageTitle"),
                      Text("pageTitle"),
                    ],
                  ),
            ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); //なくても動くけどweak warningを消せる
    return Scaffold(
      appBar: mainAppBar(_title),
      body: ListView(
        padding: EdgeInsets.only(top: 3),
        children: _createListWidgetUpdateCheckItem(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {

        },
        tooltip: 'New Page',
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}




