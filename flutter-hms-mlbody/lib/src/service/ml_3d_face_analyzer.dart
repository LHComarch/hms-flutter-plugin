/*
    Copyright 2021-2024. Huawei Technologies Co., Ltd. All rights reserved.

    Licensed under the Apache License, Version 2.0 (the "License")
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        https://www.apache.org/licenses/LICENSE-2.0
        
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

part of '../../huawei_ml_body.dart';

class ML3DFaceAnalyzer
    implements MLBodyAnalyzer<ML3DFace, ML3DFaceAnalyzerSetting> {
  late MethodChannel _channel;

  ML3DFaceAnalyzer() {
    _channel = const MethodChannel('$baseChannel.face3d');
  }

  @override
  Future<List<ML3DFace>> asyncAnalyseFrame(
    ML3DFaceAnalyzerSetting setting,
  ) async {
    final List<dynamic> res = await _channel.invokeMethod(
      'face3d#asyncAnalyseFrame',
      setting.toMap(),
    );
    return res.map((dynamic e) => ML3DFace.fromMap(e)).toList();
  }

  @override
  Future<List<ML3DFace>> analyseFrame(
    ML3DFaceAnalyzerSetting setting,
  ) async {
    final List<dynamic> res = await _channel.invokeMethod(
      'face3d#analyseFrame',
      setting.toMap(),
    );
    return res.map((dynamic e) => ML3DFace.fromMap(e)).toList();
  }

  @override
  Future<bool> destroy() async {
    return await _channel.invokeMethod(
      'face3d#destroy',
    );
  }

  @override
  Future<bool> isAvailable() async {
    return await _channel.invokeMethod(
      'face3d#isAvailable',
    );
  }

  Future<bool> stop() async {
    return await _channel.invokeMethod(
      'face3d#stop',
    );
  }
}
