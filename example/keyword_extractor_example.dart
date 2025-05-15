import 'package:keyword_extractor/keyword_extractor.dart';

void main() {
  final sampleData = {
    'title': 'Exploring advanced search techniques in Dart',
    'description':
        'This article introduces keyword extraction methods for text indexing and search optimization.',
  };

  // Extract keywords using the default tokenizer
  final defaultExtractor = DefaultKeywordExtractor(
    tokenizer: const DefaultTokenizer(),
  );

  final defaultKeywords = defaultExtractor.extract(sampleData);
  print('🔹 Default Keywords (basic tokenizer):');
  print(defaultKeywords);
  print('---');

  // Extract keywords using the advanced tokenizer
  final advancedExtractor = DefaultKeywordExtractor(
    tokenizer: const AdvancedTokenizer(),
  );

  final advancedKeywords = advancedExtractor.extract(sampleData);
  print('🔸 Advanced Keywords (prefixes + phrase n-grams):');
  print(advancedKeywords);
}
