List<String> listHistory = [];

String baseUrl() {
  return 'https://en.wikipedia.org/w/';
}

String apiSearchThubnailAndDesc(String param) {
  return "https://en.wikipedia.org/w/api.php?action=query&formatversion=2&prop=pageimages|pageterms&titles=$param&utf8=&format=json";
}

String apiSearch(String param) {
  return "https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=$param&utf8=&format=json";
}

String apiContent(String param) {
  return "https://en.wikipedia.org/w/api.php?action=query&prop=revisions&titles=$param&rvslots=*&rvprop=content&formatversion=2&utf8=&format=json";
}
