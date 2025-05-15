import 'package:keyword_extractor/keyword_extractor.dart';

void main() {
  final sampleData = {
    "title": "Improving search accuracy with keyword extraction",
    "summary":
        "This article explores simple and advanced tokenization techniques.",
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
