/*
 * --------------------------------------------------------------------------------
 * <copyright company="Aspose" file="save_as_tiff_request.dart">
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

/// Request model for SaveAsTiff operation.
class SaveAsTiffRequest implements RequestBase {
  /// The filename of the input document.
  final String name;

  /// Tiff save options.
  final TiffSaveOptionsData saveOptions;

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

  /// The flag indicating whether to use antialiasing.
  final bool useAntiAliasing;

  /// The flag indicating whether to use high quality.
  final bool useHighQualityRendering;

  /// The level of brightness for the generated images.
  final double imageBrightness;

  /// The color mode for the generated images.
  final String imageColorMode;

  /// The contrast for the generated images.
  final double imageContrast;

  /// The images numeral format.
  final String numeralFormat;

  /// The number of pages to render.
  final int pageCount;

  /// The index of the page to start rendering.
  final int pageIndex;

  /// The background image color.
  final String paperColor;

  /// The pixel format of the generated images.
  final String pixelFormat;

  /// The resolution of the generated images.
  final double resolution;

  /// The zoom factor for the generated images.
  final double scale;

  /// The compression tipe.
  final String tiffCompression;

  /// The optional dml rendering mode. The default value is Fallback.
  final String dmlRenderingMode;

  /// The optional dml effects rendering mode. The default value is Simplified.
  final String dmlEffectsRenderingMode;

  /// The optional TIFF binarization method. Possible values are: FloydSteinbergDithering, Threshold.
  final String tiffBinarizationMethod;

  /// The flag indicating whether to ZIP the output.
  final bool zipOutput;

  /// Folder in filestorage with custom fonts.
  final String fontsLocation;

  SaveAsTiffRequest(final this.name, final this.saveOptions,
      {final this.folder,
      final this.storage,
      final this.loadEncoding,
      final this.password,
      final this.encryptedPassword,
      final this.useAntiAliasing,
      final this.useHighQualityRendering,
      final this.imageBrightness,
      final this.imageColorMode,
      final this.imageContrast,
      final this.numeralFormat,
      final this.pageCount,
      final this.pageIndex,
      final this.paperColor,
      final this.pixelFormat,
      final this.resolution,
      final this.scale,
      final this.tiffCompression,
      final this.dmlRenderingMode,
      final this.dmlEffectsRenderingMode,
      final this.tiffBinarizationMethod,
      final this.zipOutput,
      final this.fontsLocation});

  @override
  Future<ApiRequestData> createRequestData(final ApiClient _apiClient) async {
    var _path = '/words/{name}/saveAs/tiff';
    var _queryParams = <String, String>{};
    var _headers = <String, String>{};
    var _bodyParts = <ApiRequestPart>[];
    if (name == null) {
      throw ApiException(400, 'Parameter name is required.');
    }
    _path = _path.replaceAll('{name}', _apiClient.serializeToString(name));
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

    if (useAntiAliasing != null) {
      _queryParams['useAntiAliasing'] =
          _apiClient.serializeToString(useAntiAliasing);
    }

    if (useHighQualityRendering != null) {
      _queryParams['useHighQualityRendering'] =
          _apiClient.serializeToString(useHighQualityRendering);
    }

    if (imageBrightness != null) {
      _queryParams['imageBrightness'] =
          _apiClient.serializeToString(imageBrightness);
    }

    if (imageColorMode != null) {
      _queryParams['imageColorMode'] =
          _apiClient.serializeToString(imageColorMode);
    }

    if (imageContrast != null) {
      _queryParams['imageContrast'] =
          _apiClient.serializeToString(imageContrast);
    }

    if (numeralFormat != null) {
      _queryParams['numeralFormat'] =
          _apiClient.serializeToString(numeralFormat);
    }

    if (pageCount != null) {
      _queryParams['pageCount'] = _apiClient.serializeToString(pageCount);
    }

    if (pageIndex != null) {
      _queryParams['pageIndex'] = _apiClient.serializeToString(pageIndex);
    }

    if (paperColor != null) {
      _queryParams['paperColor'] = _apiClient.serializeToString(paperColor);
    }

    if (pixelFormat != null) {
      _queryParams['pixelFormat'] = _apiClient.serializeToString(pixelFormat);
    }

    if (resolution != null) {
      _queryParams['resolution'] = _apiClient.serializeToString(resolution);
    }

    if (scale != null) {
      _queryParams['scale'] = _apiClient.serializeToString(scale);
    }

    if (tiffCompression != null) {
      _queryParams['tiffCompression'] =
          _apiClient.serializeToString(tiffCompression);
    }

    if (dmlRenderingMode != null) {
      _queryParams['dmlRenderingMode'] =
          _apiClient.serializeToString(dmlRenderingMode);
    }

    if (dmlEffectsRenderingMode != null) {
      _queryParams['dmlEffectsRenderingMode'] =
          _apiClient.serializeToString(dmlEffectsRenderingMode);
    }

    if (tiffBinarizationMethod != null) {
      _queryParams['tiffBinarizationMethod'] =
          _apiClient.serializeToString(tiffBinarizationMethod);
    }

    if (zipOutput != null) {
      _queryParams['zipOutput'] = _apiClient.serializeToString(zipOutput);
    }

    if (fontsLocation != null) {
      _queryParams['fontsLocation'] =
          _apiClient.serializeToString(fontsLocation);
    }

    if (saveOptions != null) {
      _bodyParts.add(ApiRequestPart(
          _apiClient.serializeBody(saveOptions), 'application/json'));
    } else {
      throw ApiException(400, 'Parameter saveOptions is required.');
    }

    var _url = _apiClient.configuration.getApiRootUrl() +
        _apiClient.applyQueryParams(_path, _queryParams).replaceAll('//', '/');
    var _body = _apiClient.serializeBodyParts(_bodyParts, _headers);
    return ApiRequestData('PUT', _url, _headers, _body);
  }

  @override
  dynamic deserializeResponse(
      final ApiClient _apiClient, final ByteData _body) {
    var _result = SaveResponse();
    var _jsonData = utf8.decode(
        _body.buffer.asUint8List(_body.offsetInBytes, _body.lengthInBytes));
    var _json = jsonDecode(_jsonData);
    _result.deserialize(_json as Map<String, dynamic>);
    return _result;
  }
}
