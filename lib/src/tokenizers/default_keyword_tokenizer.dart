import '../utils/text_utils.dart';

import 'tokenizer.dart';

class DefaultTokenizer implements Tokenizer {
  const DefaultTokenizer();

  @override
  List<String> tokenize(String text) {
    return text.normalizeAndSplit();
  }
}
