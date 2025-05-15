class PhraseNGramTokenizer {
  final int maxWords;

  const PhraseNGramTokenizer({this.maxWords = 3});

  List<String> tokenize(List<String> words) {
    final List<String> phrases = [];

    for (int i = 0; i < words.length; i++) {
      final buffer = StringBuffer();
      for (int j = 0; j < maxWords && (i + j) < words.length; j++) {
        if (j > 0) buffer.write(' ');
        buffer.write(words[i + j]);
        phrases.add(buffer.toString());
      }
    }

    return phrases;
  }
}
