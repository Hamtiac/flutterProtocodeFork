/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="get_header_footer_online_request.dart">
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

import 'dart:convert';
import 'dart:typed_data';
import '../../aspose_words_cloud.dart';
import '../api_client.dart';
import '../api_request_data.dart';
import '../api_request_part.dart';

/// Request model for GetHeaderFooterOnline operation.
class GetHeaderFooterOnlineRequest implements RequestBase {
  /// The document.
  final ByteData document;

  /// The index of the HeaderFooter object.
  final int headerFooterIndex;

  /// Encoding that will be used to load an HTML (or TXT) document if the encoding is not specified in HTML.
  final String loadEncoding;

  /// Password of protected Word document. Use the parameter to pass a password via SDK. SDK encrypts it automatically. We don't recommend to use the parameter to pass a plain password for direct call of API.
  final String password;

  /// Password of protected Word document. Use the parameter to pass an encrypted password for direct calls of API. See SDK code for encyption details.
  final String encryptedPassword;

  /// The list of HeaderFooter types.
  final String filterByType;

  GetHeaderFooterOnlineRequest(
      final this.document, final this.headerFooterIndex,
      {final this.loadEncoding,
      final this.password,
      final this.encryptedPassword,
      final this.filterByType});

  @override
  Future<ApiRequestData> createRequestData(final ApiClient _apiClient) async {
    var _path = '/words/online/get/headersfooters/{headerFooterIndex}';
    var _queryParams = <String, String>{};
    var _headers = <String, String>{};
    var _bodyParts = <ApiRequestPart>[];
    var _fileContentParts = <FileReference>[];
    if (headerFooterIndex == null) {
      throw ApiException(400, 'Parameter headerFooterIndex is required.');
    }
    _path = _path.replaceAll(
        '{headerFooterIndex}', _apiClient.serializeToString(headerFooterIndex));
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

    if (filterByType != null) {
      _queryParams['filterByType'] = _apiClient.serializeToString(filterByType);
    }

    if (document != null) {
      _bodyParts.add(_apiClient.serializeBody(document, 'Document'));
    } else {
      throw ApiException(400, 'Parameter document is required.');
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
    var _result = HeaderFooterResponse();
    var _jsonData = utf8.decode(
        _body.buffer.asUint8List(_body.offsetInBytes, _body.lengthInBytes));
    var _json = jsonDecode(_jsonData);
    _result.deserialize(_json as Map<String, dynamic>);
    return _result;
  }
}