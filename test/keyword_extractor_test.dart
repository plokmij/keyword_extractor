import 'package:keyword_extractor/keyword_extractor.dart';
import 'package:test/test.dart';

void main() {
  const sampleInput = {
    'title': 'Dart is awesome',
    'description': 'Extracting keywords selectively improves search relevance.',
    'notes': 'This field should be ignored.',
  };

  group('DefaultKeywordExtractor', () {
    test('extracts keywords from all string fields', () {
      final extractor = DefaultKeywordExtractor(
        tokenizer: const DefaultTokenizer(),
      );

      final keywords = extractor.extract(sampleInput);

      expect(
        keywords,
        containsAll([
          'dart',
          'is',
          'awesome',
          'extracting',
          'keywords',
          'selectively',
          'improves',
          'search',
          'relevance',
          'this',
          'field',
          'should',
          'be',
          'ignored',
        ]),
      );
    });
  });

  group('SelectiveKeywordExtractor', () {
    test('extracts keywords only from selected fields', () {
      final extractor = SelectiveKeywordExtractor(
        tokenizer: const DefaultTokenizer(),
        fields: ['title', 'description'],
      );

      final keywords = extractor.extract(sampleInput);

      expect(
        keywords,
        containsAll([
          'dart',
          'is',
          'awesome',
          'extracting',
          'keywords',
          'selectively',
          'improves',
          'search',
          'relevance',
        ]),
      );

      expect(keywords, isNot(contains('this')));
      expect(keywords, isNot(contains('notes')));
    });
  });

  group('AdvancedTokenizer', () {
    test('produces prefix tokens and phrase ngrams', () {
      final extractor = DefaultKeywordExtractor(
        tokenizer: const AdvancedTokenizer(),
      );

      final keywords = extractor.extract({'text': 'keyword extraction'});

      expect(keywords, anyElement(contains('key')));
      expect(keywords, anyElement(contains('keyword')));
      expect(keywords, anyElement(contains('keyword extraction')));
    });
  });
}
