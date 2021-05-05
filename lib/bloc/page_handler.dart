class PageHandler {
  int page;
  final perPage;

  PageHandler({this.page = 1, this.perPage = 15});

  void incrementPage() {
    ++page;
  }
}