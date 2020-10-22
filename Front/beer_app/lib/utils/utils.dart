class Utils {
  static String nameOf(dynamic o) {
    if (o == null) return "null";

    try {
      Function getTypeName = o.getTypeName;
      if (getTypeName != null) return getTypeName();
    } catch (e) {}

    return o.runtimeType.toString();
  }
}
