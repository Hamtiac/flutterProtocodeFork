/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="form_field.dart">
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

/// FromField.
class FormField extends NodeLink {
  /// Gets or sets a value indicating whether references to the specified form field are automatically updated whenever the field is exited.
  bool _calculateOnExit;

  bool get calculateOnExit => _calculateOnExit;
  set calculateOnExit(bool val) => _calculateOnExit = val;

  /// Gets or sets a value indicating whether a form field is enabled.
  bool _enabled;

  bool get enabled => _enabled;
  set enabled(bool val) => _enabled = val;

  /// Gets or sets the entry macro name for the form field.
  String _entryMacro;

  String get entryMacro => _entryMacro;
  set entryMacro(String val) => _entryMacro = val;

  /// Gets or sets the exit macro name for the form field.
  String _exitMacro;

  String get exitMacro => _exitMacro;
  set exitMacro(String val) => _exitMacro = val;

  /// Gets or sets text, displayed in a message box when the form field has the focus and the user presses F1.
  String _helpText;

  String get helpText => _helpText;
  set helpText(String val) => _helpText = val;

  /// Gets or sets the form field name.
  String _name;

  String get name => _name;
  set name(String val) => _name = val;

  /// Gets or sets a value indicating whether the source of the text that's displayed in a message box when a form field has the focus and the user presses F1.
  bool _ownHelp;

  bool get ownHelp => _ownHelp;
  set ownHelp(bool val) => _ownHelp = val;

  /// Gets or sets a value indicating whether the source of the text that's displayed in the status bar when a form field has the focus.
  bool _ownStatus;

  bool get ownStatus => _ownStatus;
  set ownStatus(bool val) => _ownStatus = val;

  /// Gets or sets text, displayed in the status bar when a form field has the focus.
  String _statusText;

  String get statusText => _statusText;
  set statusText(String val) => _statusText = val;

  @override
  void deserialize(Map<String, dynamic> json) {
    if (json == null) {
      throw ApiException(400, 'Failed to deserialize FormField data model.');
    }

    super.deserialize(json);
    if (json.containsKey('Link')) {
      link = WordsApiLink();
      link.deserialize(json['Link'] as Map<String, dynamic>);
    } else {
      link = null;
    }

    if (json.containsKey('NodeId')) {
      nodeId = json['NodeId'] as String;
    } else {
      nodeId = null;
    }

    if (json.containsKey('CalculateOnExit')) {
      calculateOnExit = json['CalculateOnExit'] as bool;
    } else {
      calculateOnExit = null;
    }

    if (json.containsKey('Enabled')) {
      enabled = json['Enabled'] as bool;
    } else {
      enabled = null;
    }

    if (json.containsKey('EntryMacro')) {
      entryMacro = json['EntryMacro'] as String;
    } else {
      entryMacro = null;
    }

    if (json.containsKey('ExitMacro')) {
      exitMacro = json['ExitMacro'] as String;
    } else {
      exitMacro = null;
    }

    if (json.containsKey('HelpText')) {
      helpText = json['HelpText'] as String;
    } else {
      helpText = null;
    }

    if (json.containsKey('Name')) {
      name = json['Name'] as String;
    } else {
      name = null;
    }

    if (json.containsKey('OwnHelp')) {
      ownHelp = json['OwnHelp'] as bool;
    } else {
      ownHelp = null;
    }

    if (json.containsKey('OwnStatus')) {
      ownStatus = json['OwnStatus'] as bool;
    } else {
      ownStatus = null;
    }

    if (json.containsKey('StatusText')) {
      statusText = json['StatusText'] as String;
    } else {
      statusText = null;
    }
  }

  @override
  Map<String, dynamic> serialize() {
    var _result = <String, dynamic>{};
    _result.addAll(super.serialize());
    if (calculateOnExit != null) {
      _result['CalculateOnExit'] = calculateOnExit;
    }

    if (enabled != null) {
      _result['Enabled'] = enabled;
    }

    if (entryMacro != null) {
      _result['EntryMacro'] = entryMacro;
    }

    if (exitMacro != null) {
      _result['ExitMacro'] = exitMacro;
    }

    if (helpText != null) {
      _result['HelpText'] = helpText;
    }

    if (name != null) {
      _result['Name'] = name;
    }

    if (ownHelp != null) {
      _result['OwnHelp'] = ownHelp;
    }

    if (ownStatus != null) {
      _result['OwnStatus'] = ownStatus;
    }

    if (statusText != null) {
      _result['StatusText'] = statusText;
    }
    return _result;
  }
}
