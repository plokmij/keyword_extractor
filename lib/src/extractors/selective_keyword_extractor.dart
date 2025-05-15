import '../tokenizers/tokenizer.dart';
import '../keyword_extractor_base.dart';

/// Extracts keywords only from specific fields of the input map.
class SelectiveKeywordExtractor implements KeywordExtractor {
  final Tokenizer tokenizer;
  final List<String> fields;

  const SelectiveKeywordExtractor({
    required this.tokenizer,
    required this.fields,
  });

  @override
  List<String> extract(Map<String, dynamic> data) {
    final Set<String> keywords = {};

    for (final field in fields) {
      final value = data[field];
      if (value is String) {
        keywords.addAll(tokenizer.tokenize(value));
      }
    }

    return keywords.toList();
  }
}
