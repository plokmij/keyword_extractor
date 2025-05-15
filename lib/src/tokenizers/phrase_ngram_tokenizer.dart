class PhraseNGramTokenizer {
  final int? maxWords;

  const PhraseNGramTokenizer({this.maxWords});

  List<String> tokenize(List<String> words) {
    final List<String> phrases = [];
    final int limit = maxWords ?? words.length;

    for (int i = 0; i < words.length; i++) {
      final buffer = StringBuffer();
      for (int j = 0; j < limit && (i + j) < words.length; j++) {
        if (j > 0) buffer.write(' ');
        buffer.write(words[i + j]);
        phrases.add(buffer.toString());
      }
    }

    return phrases;
  }
}
