/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="render_page_request.dart">
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

/// Request model for RenderPage operation.
class RenderPageRequest implements RequestBase {
  /// The filename of the input document.
  final String name;

  /// The index of the page.
  final int pageIndex;

  /// The destination format.
  final String format;

  /// Original document folder.
  final String folder;

  /// Original document storage.
  final String storage;

  /// Encoding that will be used to load an HTML (or TXT) document if the encoding is not specified in HTML.
  final String loadEncoding;

  /// Password of protected Word document. Use the parameter to pass a password via SDK. SDK encrypts it automatically. We don't recommend to use the parameter to pass a plain password for direct call of API.
  final String password;

  /// Password of protected Word document. Use the parameter to pass an encrypted password for direct calls of API. See SDK code for encyption details.
  final String encryptedPassword;

  /// Folder in filestorage with custom fonts.
  final String fontsLocation;

  RenderPageRequest(final this.name, final this.pageIndex, final this.format,
      {final this.folder,
      final this.storage,
      final this.loadEncoding,
      final this.password,
      final this.encryptedPassword,
      final this.fontsLocation});

  @override
  Future<ApiRequestData> createRequestData(final ApiClient _apiClient) async {
    var _path = '/words/{name}/pages/{pageIndex}/render';
    var _queryParams = <String, String>{};
    var _headers = <String, String>{};
    var _bodyParts = <ApiRequestPart>[];
    if (name == null) {
      throw ApiException(400, 'Parameter name is required.');
    }
    _path = _path.replaceAll('{name}', _apiClient.serializeToString(name));

    if (pageIndex == null) {
      throw ApiException(400, 'Parameter pageIndex is required.');
    }
    _path = _path.replaceAll(
        '{pageIndex}', _apiClient.serializeToString(pageIndex));
    if (format != null) {
      _queryParams['format'] = _apiClient.serializeToString(format);
    } else {
      throw ApiException(400, 'Parameter format is required.');
    }

    if (folder != null) {
      _queryParams['folder'] = _apiClient.serializeToString(folder);
    }

    if (storage != null) {
      _queryParams['storage'] = _apiClient.serializeToString(storage);
    }

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

    if (fontsLocation != null) {
      _queryParams['fontsLocation'] =
          _apiClient.serializeToString(fontsLocation);
    }

    var _url = _apiClient.configuration.getApiRootUrl() +
        _apiClient.applyQueryParams(_path, _queryParams).replaceAll('//', '/');
    var _body = _apiClient.serializeBodyParts(_bodyParts, _headers);
    return ApiRequestData('GET', _url, _headers, _body);
  }

  @override
  dynamic deserializeResponse(
      final ApiClient _apiClient, final ByteData _body) {
    return _body;
  }
}
