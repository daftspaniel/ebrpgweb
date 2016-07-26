class StatusList {
  List<String> statusMessages = new List<String>();

  StatusList() {
    statusMessages.add("Welcome to the game");
  }

  void clear() {
    statusMessages.clear();
  }

  void add(String msg) {
    if (statusMessages.length > 0 &&
        msg.length > 0 &&
        statusMessages.last == msg) return;
    statusMessages.add(msg);
    if (statusMessages.length > 4) {
      statusMessages.removeAt(0);
    }
  }
}
