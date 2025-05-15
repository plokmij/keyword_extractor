import 'package:keyword_extractor/src/tokenizers/phrase_ngram_tokenizer.dart';
import 'package:keyword_extractor/src/tokenizers/word_prefix_tokenizer.dart';

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

  List<String> wordPrefixes({int minLength = 3}) {
    return WordPrefixTokenizer(minLength: minLength).tokenize(this);
  }

  List<String> phraseNgrams({int maxWords = 3}) {
    final words = normalizeAndSplit();
    return PhraseNGramTokenizer(maxWords: maxWords).tokenize(words);
  }
}
