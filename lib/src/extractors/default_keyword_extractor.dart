import 'package:keyword_extractor/keyword_extractor.dart';
import 'package:keyword_extractor/src/tokenizers/tokenizer.dart';

class DefaultKeywordExtractor implements KeywordExtractor {
  final Tokenizer tokenizer;

  const DefaultKeywordExtractor({required this.tokenizer});

  @override
  List<String> extract(Map<String, dynamic> data) {
    final Set<String> keywords = {};

    for (final entry in data.entries) {
      final value = entry.value;
      if (value is String) {
        keywords.addAll(tokenizer.tokenize(value));
      }
    }

    return keywords.toList();
  }
}
