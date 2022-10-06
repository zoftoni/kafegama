// ignore_for_file: constant_identifier_names

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:kafegama/model/alumni/alumni_list.dart';
import 'package:kafegama/model/berita/berita_list.dart';
import 'package:kafegama/model/bursa_kerja/bursa_kerja_list.dart';
import 'package:kafegama/model/common/message_response.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign_list.dart';
import 'package:kafegama/model/event/event_list.dart';
import 'package:kafegama/model/login_response.dart';

import 'app_interceptors.dart';

class APIProvider {
  static const String _baseUrl = 'http://10.0.2.2/kafegama/public/api/';

  static const String _LOGIN = 'login';
  static const String _REGISTER = 'register-user';
  static const String _LOGOUT = 'logout';
  static const String _BERITA = 'berita';
  static const String _EVENT = 'event';
  static const String _DONASI_CAMPAIGN = 'donasi-campaign';
  static const String _BURSA_KERJA = 'bursa-kerja';
  static const String _ALUMNI = 'alumni';

  final Dio _dio = Dio();

  APIProvider([String? apiURL]) {
    if (apiURL != null) {
      _dio.options.baseUrl = apiURL;
    } else {
      _dio.options.baseUrl = _baseUrl;
    }
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;

    _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));

    _dio.interceptors.add(AppInterceptors());
    // _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

  setBaseUrl(baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  String getBaseUrl() {
    return _dio.options.baseUrl;
  }

  String _handleError(error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          // errorDescription = dioError.response?.data["error"];
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode} ${dioError.response?.statusMessage}"
              "\n${(dioError.response?.data is String) ? dioError.response?.data : dioError.response?.data["error"]}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to other reason " +
                  error.message;
          break;
      }
    } else {
      errorDescription = "Unexpected error occured " + error.toString();
    }
    return errorDescription;
  }

  Future<LoginResponse> login(email, password) async {
    try {
      // String url = _baseUrl + _LOGIN;
      Response response =
          await _dio.post(_LOGIN, data: {'email': email, 'password': password});
      // throwIfNoSuccess(response);
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");

      return LoginResponse.withError(_handleError(e));
    }
  }

  Future<MessageResponse> register(
      name, email, password, passwordConfirmation) async {
    try {
      _dio.options.connectTimeout = 30000; //30s
      _dio.options.receiveTimeout = 50000;
      // String url = _baseUrl + _LOGIN;
      Response response = await _dio.post(_REGISTER, data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      });
      // throwIfNoSuccess(response);
      return MessageResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");

      return MessageResponse.withError(_handleError(e));
    }
  }

  Future<MessageResponse> logout() async {
    try {
      // String url = _baseUrl + _LOGIN;
      Response response = await _dio.post(_LOGOUT,
          options: Options(
              headers: {"requiresToken": true, "Accept": "application/json"}));
      // throwIfNoSuccess(response);
      return MessageResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return MessageResponse.withError(_handleError(e));
    }
  }

  //// BERITA//////
  Future<BeritaList> getBeritaLatest() async {
    try {
      Response response = await _dio.get(
        _BERITA,
        queryParameters: {
          'limit': 5,
        },
      );
      return BeritaList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return BeritaList.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }

  Future<BeritaList> getBerita(page, keyword) async {
    try {
      Response response = await _dio.get(
        _BERITA,
        queryParameters: {'page': page, 'q': keyword},
      );
      return BeritaList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return BeritaList.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }
  //////////////////////

  //// EVENT
  Future<EventList> getEventLatest() async {
    try {
      Response response = await _dio.get(
        _EVENT,
        queryParameters: {
          'limit': 5,
        },
      );
      return EventList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $e ");
      return EventList.withError(_handleError(e));
    }
  }

  Future<EventList> getEvent(page, keyword) async {
    try {
      Response response = await _dio.get(
        _EVENT,
        queryParameters: {'page': page, 'q': keyword},
      );
      return EventList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return EventList.withError(_handleError(e));
    }
  }
  ///////////////////

  ///DONASI CAMPAIGN
  Future<DonasiCampaignList> getDonasiLatest() async {
    try {
      Response response = await _dio.get(
        _DONASI_CAMPAIGN,
        queryParameters: {
          'limit': 5,
        },
      );
      return DonasiCampaignList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return DonasiCampaignList.withError(_handleError(e));
    }
  }

  Future<DonasiCampaignList> getDonasiCampaign(page, keyword) async {
    try {
      Response response = await _dio.get(
        _DONASI_CAMPAIGN,
        queryParameters: {'page': page, 'q': keyword},
      );
      return DonasiCampaignList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return DonasiCampaignList.withError(_handleError(e));
    }
  }
  /////////////////////

  ///BURSA KERJA
  ///
  //
  Future<BursaKerjaList> getBursaKerja(page, keyword) async {
    try {
      Response response = await _dio.get(
        _BURSA_KERJA,
        queryParameters: {'page': page, 'q': keyword},
      );
      return BursaKerjaList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return BursaKerjaList.withError(_handleError(e));
    }
  }

  ///////////////////
  //

  ///ALUMNI
  //
  Future<AlumniList> getAlumni(page, keyword) async {
    try {
      Response response = await _dio.get(
        _ALUMNI,
        queryParameters: {'page': page, 'q': keyword},
      );
      return AlumniList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return AlumniList.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }
  //////////////////////
}
