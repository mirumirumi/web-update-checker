import '../importer.dart';

class UpdateCheckItem {
  String pageTitle;
  String url;
  String siteName;
  // String get domain => getDomainName(url);
  // Image get favicon => Image.network("https://www.google.com/s2/favicons?domain=" + domain);
  DateTime updateAt = null;
  int updateFrequencyHours = 24;
  bool hasUpdate = false;
  SavedSiteData savedSiteData;

  UpdateCheckItem(this.pageTitle, this.url, this.siteName);

  void checkUpdate(int index) {

  }
}

class SavedSiteData {
  bool isForcedUpdateAt = true;
  bool isTargetTitle = true;
  bool isTargetSnssharecount = false;
  bool isTargetOnlyMainContent = true;
  bool isTargetComment = false;

  String mainContent = "";
}

class PageArgs {
  final String url;
  final String siteName;

  PageArgs(this.url, this.siteName);
}





