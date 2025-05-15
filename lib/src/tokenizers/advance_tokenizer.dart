import 'phrase_ngram_tokenizer.dart';
import 'word_prefix_tokenizer.dart';
import '../utils/text_utils.dart';

import 'tokenizer.dart';

/// A tokenizer that combines word prefixes and phrase-level n-grams
/// to support rich search queries like autocomplete and multi-word matching.
class AdvancedTokenizer implements Tokenizer {
  final WordPrefixTokenizer wordPrefixTokenizer;
  final PhraseNGramTokenizer phraseNGramTokenizer;

  const AdvancedTokenizer({
    this.wordPrefixTokenizer = const WordPrefixTokenizer(),
    this.phraseNGramTokenizer = const PhraseNGramTokenizer(),
  });

  @override
  List<String> tokenize(String text) {
    final Set<String> tokens = {};

    // Tokenize individual word prefixes
    for (final word in text.normalizeAndSplit()) {
      tokens.addAll(
        word.wordPrefixes(minLength: wordPrefixTokenizer.minLength),
      );
    }

    // Tokenize phrase n-grams from the entire sentence
    tokens.addAll(text.phraseNgrams());

    return tokens.toList();
  }
}
