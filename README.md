# keyword_extractor

**⚠️ Experimental Package — Not ready for production**

`keyword_extractor` is a Dart package for extracting keywords from structured text data.

It supports:

- ✅ Basic word-based tokenization
- ✅ Word prefix and phrase n-gram generation
- ✅ Field-specific keyword extraction

---

## Features

- Extracts keywords from `Map<String, dynamic>` data
- Works with any object that provides `.toMap()` or `.toJson()`
- Swappable tokenizer strategies:
  - `DefaultTokenizer`: simple word splitting
  - `AdvancedTokenizer`: word prefixes + phrase n-grams
- `SelectiveKeywordExtractor` for targeting specific fields

---

## Getting Started

```dart
import 'package:keyword_extractor/keyword_extractor.dart';

void main() {
  final data = {
    'title': 'Improving search accuracy with keyword extraction',
    'summary': 'This article explores simple and advanced tokenization techniques.',
  };

  final extractor = DefaultKeywordExtractor(
    tokenizer: const DefaultTokenizer(),
  );

  final keywords = extractor.extract(data);
  print(keywords);
}
```

---

## Selective Field Extraction

```dart
final extractor = SelectiveKeywordExtractor(
  tokenizer: const AdvancedTokenizer(),
  fields: ['title'], // extract only from the 'title' field
);

final keywords = extractor.extract(data);
print(keywords);
```

---

## Input & Output Example

**Input Map:**

```json
{
  "title": "Improving search accuracy with keyword extraction",
  "summary": "This article explores simple and advanced tokenization techniques."
}
```

**DefaultTokenizer Output:**

```json
[
  "improving",
  "search",
  "accuracy",
  "with",
  "keyword",
  "extraction",
  "this",
  "article",
  "explores",
  "simple",
  "and",
  "advanced",
  "tokenization",
  "techniques"
]
```

**AdvancedTokenizer Output (partial):**

```json
[
  "imp",
  "impr",
  "impro",
  "improv",
  "improvi",
  "improvin",
  "improving",
  "sea",
  "sear",
  "searc",
  "search",
  "keyword extraction",
  "extraction techniques",
  "simple and advanced",
  "improving search",
  "search accuracy",
  "accuracy with keyword"
]
```

---

## Tokenizers

| Tokenizer           | Description                                 |
| ------------------- | ------------------------------------------- |
| `DefaultTokenizer`  | Splits text on spaces and punctuation       |
| `AdvancedTokenizer` | Adds word prefixes and phrase n-gram tokens |

---

## Disclaimer

This package is **experimental** and under active development.  
Do **not** use it in production environments. APIs may change, and edge cases may not be fully covered yet.

---

## Roadmap

- [ ] Stopword filtering
- [ ] Fuzzy variant generation
- [ ] Nested field/key support
- [ ] Token ranking and weighting

---

## License

MIT
