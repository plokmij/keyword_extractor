class WordPrefixTokenizer {
  final int minLength;

  const WordPrefixTokenizer({this.minLength = 3});

  List<String> tokenize(String word) {
    final List<String> prefixes = [];
    for (int i = minLength; i <= word.length; i++) {
      prefixes.add(word.substring(0, i));
    }
    return prefixes;
  }
}
