/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="update_run_font_online_request.dart">
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

import 'dart:typed_data';
import '../../aspose_words_cloud.dart';
import '../api_client.dart';
import '../api_request_data.dart';
import '../api_request_part.dart';

/// Request model for UpdateRunFontOnline operation.
class UpdateRunFontOnlineRequest implements RequestBase {
  /// The document.
  final ByteData document;

  /// The path to the paragraph in the document tree.
  final String paragraphPath;

  /// Font dto object.
  final Font fontDto;

  /// Object index.
  final int index;

  /// Encoding that will be used to load an HTML (or TXT) document if the encoding is not specified in HTML.
  final String loadEncoding;

  /// Password of protected Word document. Use the parameter to pass a password via SDK. SDK encrypts it automatically. We don't recommend to use the parameter to pass a plain password for direct call of API.
  final String password;

  /// Password of protected Word document. Use the parameter to pass an encrypted password for direct calls of API. See SDK code for encyption details.
  final String encryptedPassword;

  /// Result path of the document after the operation. If this parameter is omitted then result of the operation will be saved as the source document.
  final String destFileName;

  /// Initials of the author to use for revisions.If you set this parameter and then make some changes to the document programmatically, save the document and later open the document in MS Word you will see these changes as revisions.
  final String revisionAuthor;

  /// The date and time to use for revisions.
  final String revisionDateTime;

  UpdateRunFontOnlineRequest(final this.document, final this.paragraphPath,
      final this.fontDto, final this.index,
      {final this.loadEncoding,
      final this.password,
      final this.encryptedPassword,
      final this.destFileName,
      final this.revisionAuthor,
      final this.revisionDateTime});

  @override
  Future<ApiRequestData> createRequestData(final ApiClient _apiClient) async {
    var _path = '/words/online/put/{paragraphPath}/runs/{index}/font';
    var _queryParams = <String, String>{};
    var _headers = <String, String>{};
    var _bodyParts = <ApiRequestPart>[];
    var _fileContentParts = <FileReference>[];
    if (paragraphPath == null) {
      throw ApiException(400, 'Parameter paragraphPath is required.');
    }
    _path = _path.replaceAll(
        '{paragraphPath}', _apiClient.serializeToString(paragraphPath));

    if (index == null) {
      throw ApiException(400, 'Parameter index is required.');
    }
    _path = _path.replaceAll('{index}', _apiClient.serializeToString(index));
    if (loadEncoding != null) {
      _queryParams['loadEncoding'] = _apiClient.serializeToString(loadEncoding);
    }

    if (password != null) {
      _queryParams['encryptedPassword'] =
          await _apiClient.encryptPassword(password);
    }

    if (encryptedPassword != null) {
      _queryParams['encryptedPassword'] =
          _apiClient.serializeToString(encryptedPassword);
    }

    if (destFileName != null) {
      _queryParams['destFileName'] = _apiClient.serializeToString(destFileName);
    }

    if (revisionAuthor != null) {
      _queryParams['revisionAuthor'] =
          _apiClient.serializeToString(revisionAuthor);
    }

    if (revisionDateTime != null) {
      _queryParams['revisionDateTime'] =
          _apiClient.serializeToString(revisionDateTime);
    }

    if (document != null) {
      _bodyParts.add(_apiClient.serializeBody(document, 'Document'));
    } else {
      throw ApiException(400, 'Parameter document is required.');
    }

    if (fontDto != null) {
      _bodyParts.add(_apiClient.serializeBody(fontDto, 'FontDto'));
    } else {
      throw ApiException(400, 'Parameter fontDto is required.');
    }

    for (final _fileContentPart in _fileContentParts) {
      if (_fileContentPart.source == 'Request') {
        _bodyParts.add(ApiRequestPart(
            _fileContentPart.content, 'application/octet-stream',
            name: _fileContentPart.reference));
      }
    }
    var _url = _apiClient.configuration.getApiRootUrl() +
        _apiClient.applyQueryParams(_path, _queryParams).replaceAll('//', '/');
    var _body = _apiClient.serializeBodyParts(_bodyParts, _headers);
    return ApiRequestData('PUT', _url, _headers, _body);
  }

  @override
  dynamic deserializeResponse(
      final ApiClient _apiClient, final ByteData _body) {
    var _result = UpdateRunFontOnlineResponse();
    _result.deserialize(_apiClient, _apiClient.deserializeMultipartMap(_body));
    return _result;
  }
}