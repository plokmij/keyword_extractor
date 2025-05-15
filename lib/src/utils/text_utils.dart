extension TextNormalization on String {
  List<String> normalizeAndSplit() {
    return toLowerCase()
        .split(
          RegExp(r'\s+|_+|(?<=[a-z])(?=[A-Z])'),
        ) // camelCase, snake_case, spaces
        .map((w) => w.replaceAll(RegExp(r'[^\w]'), '')) // strip punctuation
        .where((word) => word.length > 1)
        .toSet()
        .toList();
  }
}
