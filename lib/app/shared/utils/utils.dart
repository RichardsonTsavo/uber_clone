class Utils {
  static String dateToString(DateTime value) {
    return "${value.hour.toString().padLeft(2, "0")}:${value.minute}";
  }
}
