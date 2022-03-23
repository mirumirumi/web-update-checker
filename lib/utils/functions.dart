import '../importer.dart';

String getDomainName(String url) {
  RegExp reg = RegExp(
      r'[A-Za-z0-9][A-Za-z0-9\-]{1,61}[A-Za-z0-9]\.+[A-Za-z]+',
      caseSensitive: false
  );
  var match = reg.firstMatch(url);
  return match.group(0) ?? "unknown domain";
}

Image getFavicon(String domain, double imgSize) {
  return Image.network("https://www.google.com/s2/favicons?sz=128&domain=" + domain       , width: imgSize)
      ?? Image.network("https://www.google.com/s2/favicons?sz=64&domain=" + domain, width: imgSize)
      ?? Image.network("https://www.google.com/s2/favicons?domain=" + domain, width: imgSize);
}











































