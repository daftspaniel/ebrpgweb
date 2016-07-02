class StatusList {
  List<String> statusMessages;
  StatusList() {
    statusMessages = new List<String>();
    statusMessages.add("Welcome to the game");
  }

  void clear() {
    statusMessages.clear();
  }

  void add(String msg) {
    statusMessages.add(msg);
    if (statusMessages.length > 4) {
      statusMessages.removeAt(0);
    }
  }
}
