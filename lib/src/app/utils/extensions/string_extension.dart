extension StringExtension on String {
  String intelliTrim(int stringSizeBase) {
    return length > stringSizeBase
        ? "${substring(0, stringSizeBase)}..."
        : this;
  }
}
