import 'package:json_annotation/json_annotation.dart';
// coverage:ignore-file

class LabelConverter extends JsonConverter<String, Map<String, dynamic>> {
  const LabelConverter();

  @override
  String fromJson(Map<String, dynamic> json) {
    return json['label'] as String;
  }

  @override
  Map<String, dynamic> toJson(String object) {
    return {'label': object};
  }
}

class IdConverter extends JsonConverter<int, Map<String, dynamic>> {
  const IdConverter();
  @override
  int fromJson(Map<String, dynamic> json) {
    return int.parse(json['attributes']['im:id'] as String);
  }

  @override
  Map<String, dynamic> toJson(int object) {
    return {
      'attributes': {
        'im:id': '$object',
      }
    };
  }
}

class ItemCountConverter extends JsonConverter<int, Map<String, dynamic>> {
  const ItemCountConverter();
  @override
  int fromJson(Map<String, dynamic> json) {
    return int.parse(json['label'] as String);
  }

  @override
  Map<String, dynamic> toJson(int object) {
    return {
      'label': '$object',
    };
  }
}

class PriceConverter extends JsonConverter<double, Map<String, dynamic>> {
  const PriceConverter();
  @override
  double fromJson(Map<String, dynamic> json) {
    return double.parse(json['attributes']['amount'] as String);
  }

  @override
  Map<String, dynamic> toJson(double object) {
    return {
      'label': '\$$object',
      'attributes': {
        'amount': object.toString(),
        'currency': 'USD',
      }
    };
  }
}

class LinkConverter extends JsonConverter<String, Map<String, dynamic>> {
  const LinkConverter();
  @override
  String fromJson(Map<String, dynamic> json) {
    return json['attributes']['href'] as String;
  }

  @override
  Map<String, dynamic> toJson(String object) {
    return {
      'attributes': {
        'rel': 'alternate',
        'type': 'text/html',
        'href': object,
      }
    };
  }
}

class DateConverter extends JsonConverter<DateTime, Map<String, dynamic>> {
  const DateConverter();

  @override
  DateTime fromJson(Map<String, dynamic> json) {
    return DateTime.parse(json['label'] as String);
  }

  @override
  Map<String, dynamic> toJson(DateTime object) {
    return {
      'label': object.toIso8601String(),
      'attributes': {
        'label': object.toString(),
      }
    };
  }
}
