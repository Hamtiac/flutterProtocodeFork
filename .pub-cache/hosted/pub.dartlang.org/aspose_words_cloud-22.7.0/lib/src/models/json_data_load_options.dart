/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="json_data_load_options.dart">
 *   Copyright (c) 2022 Aspose.Words for Cloud
 * </copyright>
 * <summary>
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * --------------------------------------------------------------------------------
 */

library aspose_words_cloud;

import '../../aspose_words_cloud.dart';

/// Represents options for parsing JSON data.
class JsonDataLoadOptions implements ModelBase {
  /// Gets or sets a value indicating whether a generated data source will always contain
  /// an object for a JSON root element. If a JSON root element contains a single complex
  /// property, such an object is not created by default.
  bool _alwaysGenerateRootObject;

  bool get alwaysGenerateRootObject => _alwaysGenerateRootObject;
  set alwaysGenerateRootObject(bool val) => _alwaysGenerateRootObject = val;

  /// Gets or sets exact formats for parsing JSON date-time values while loading JSON.
  /// The default is null.
  List<String> _exactDateTimeParseFormats;

  List<String> get exactDateTimeParseFormats => _exactDateTimeParseFormats;
  set exactDateTimeParseFormats(List<String> val) =>
      _exactDateTimeParseFormats = val;

  /// Gets or sets a mode for parsing JSON simple values (null, boolean, number, integer,
  /// and string) while loading JSON. Such a mode does not affect parsing of date-time
  /// values. The default is Aspose.Words.Reporting.JsonSimpleValueParseMode.Loose.
  JsonDataLoadOptions_SimpleValueParseModeEnum _simpleValueParseMode;

  JsonDataLoadOptions_SimpleValueParseModeEnum get simpleValueParseMode =>
      _simpleValueParseMode;
  set simpleValueParseMode(JsonDataLoadOptions_SimpleValueParseModeEnum val) =>
      _simpleValueParseMode = val;

  @override
  void deserialize(Map<String, dynamic> json) {
    if (json == null) {
      throw ApiException(
          400, 'Failed to deserialize JsonDataLoadOptions data model.');
    }

    if (json.containsKey('AlwaysGenerateRootObject')) {
      alwaysGenerateRootObject = json['AlwaysGenerateRootObject'] as bool;
    } else {
      alwaysGenerateRootObject = null;
    }

    if (json.containsKey('ExactDateTimeParseFormats')) {
      // Array processing
      exactDateTimeParseFormats = <String>[];
      for (final _element in json['ExactDateTimeParseFormats']) {
        exactDateTimeParseFormats.add(_element as String);
      }
    } else {
      exactDateTimeParseFormats = null;
    }

    if (json.containsKey('SimpleValueParseMode')) {
      switch (json['SimpleValueParseMode'] as String) {
        case 'Loose':
          simpleValueParseMode =
              JsonDataLoadOptions_SimpleValueParseModeEnum.loose;
          break;
        case 'Strict':
          simpleValueParseMode =
              JsonDataLoadOptions_SimpleValueParseModeEnum.strict;
          break;
        default:
          simpleValueParseMode = null;
          break;
      }
    } else {
      simpleValueParseMode = null;
    }
  }

  @override
  Map<String, dynamic> serialize() {
    var _result = <String, dynamic>{};
    if (alwaysGenerateRootObject != null) {
      _result['AlwaysGenerateRootObject'] = alwaysGenerateRootObject;
    }

    if (exactDateTimeParseFormats != null) {
      _result['ExactDateTimeParseFormats'] = exactDateTimeParseFormats;
    }

    if (simpleValueParseMode != null) {
      switch (simpleValueParseMode) {
        case JsonDataLoadOptions_SimpleValueParseModeEnum.loose:
          _result['SimpleValueParseMode'] = 'Loose';
          break;
        case JsonDataLoadOptions_SimpleValueParseModeEnum.strict:
          _result['SimpleValueParseMode'] = 'Strict';
          break;
        default:
          break;
      }
    }
    return _result;
  }
}

/// Gets or sets a mode for parsing JSON simple values (null, boolean, number, integer,
/// and string) while loading JSON. Such a mode does not affect parsing of date-time
/// values. The default is Aspose.Words.Reporting.JsonSimpleValueParseMode.Loose.
enum JsonDataLoadOptions_SimpleValueParseModeEnum { loose, strict }
