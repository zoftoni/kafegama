// ignore_for_file: constant_identifier_names

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:kafegama/core.dart';
import 'package:kafegama/model/invoice/invoice_donasi.dart';
import 'package:kafegama/model/invoice/invoice_iuran.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class APIProvider {
  // static const String _baseUrl = 'http://10.0.2.2/kafegama/public/api/';
  static const String _baseUrl = 'https://kafegamaa.com/api/';
  // static const String RESET_PASS_URL =
  //     'http://10.0.2.2/kafegama/public/admin/password/reset';
  static const String RESET_PASS_URL =
      'http://kafegamaa.com/admin/password/reset';

  static const String _LOGIN = 'login';
  static const String _REGISTER = 'register-user';
  static const String _LOGOUT = 'logout';
  static const String _BERITA = 'berita';
  static const String _EVENT = 'event';
  static const String _DONASI_CAMPAIGN = 'donasi-campaign';
  static const String _BURSA_KERJA = 'bursa-kerja';
  static const String _ALUMNI = 'alumni';
  static const String _USER_PROFILE = 'user-profile';
  static const String _EDIT_PROFILE = 'edit-profile';
  static const String _VERIFIKASI_NIM = 'verifikasi-nim';
  static const String _REFRESH_USER = 'refresh-user';
  static const String _DONASI_TRX = 'donasi-trx';
  static const String _IURAN_TRX = 'iuran-trx';
  static const String _JENIS_ANGGOTA = 'jenis-anggota';
  static const String _FAQ = 'page-content?name=faq';
  static const String _PAY_DONASI = 'pay-donasi';
  static const String _PAY_IURAN = 'pay-iuran';
  static const String _DELETE_ACCOUNT = 'delete-account';

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
          if (dioError.response?.statusCode == 401) {
            SessionManager().remove("USER");
            getx.Get.offAll(() => const LoginView());
            errorDescription = "Session Expired";
          }
          // errorDescription = dioError.response?.data["error"];
          errorDescription = (dioError.response?.data is String)
              ? dioError.response?.data
              : dioError.response?.data["error"];
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
      name, noHp, email, password, passwordConfirmation) async {
    try {
      _dio.options.connectTimeout = 30000; //30s
      _dio.options.receiveTimeout = 50000;
      // String url = _baseUrl + _LOGIN;
      Response response = await _dio.post(_REGISTER, data: {
        'name': name,
        'no_hp': noHp,
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

  Future<MessageResponse> deleteAccount() async {
    try {
      // String url = _baseUrl + _LOGIN;
      Response response = await _dio.post(_DELETE_ACCOUNT,
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
      Response response = await _dio.get(_BURSA_KERJA,
          queryParameters: {'page': page, 'q': keyword},
          options: Options(
              headers: {"requiresToken": true, "Accept": "application/json"}));
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
      Response response = await _dio.get(_ALUMNI,
          queryParameters: {'page': page, 'q': keyword},
          options: Options(
              headers: {"requiresToken": true, "Accept": "application/json"}));
      return AlumniList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return AlumniList.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }

  //////////////////////
  ///
  ///
  Future<UserProfile> getUserProfileData() async {
    try {
      Response response = await _dio.get(_USER_PROFILE,
          options: Options(
              headers: {"requiresToken": true, "Accept": "application/json"}));
      return UserProfile.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return UserProfile.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }

  Future<MessageResponse> editProfile(
      photo,
      jenisKelamin,
      tempatLahir,
      tglLahir,
      alamat,
      department,
      degree,
      statusPekerjaan,
      namaPerusahaan,
      jabatan,
      bidangUsaha,
      kotaPerusahaan) async {
    var formData = FormData.fromMap({
      'photo': photo.path != ""
          ? await MultipartFile.fromFile(photo.path, filename: "photo")
          : "",
      'sex': jenisKelamin,
      'tempat_lahir': tempatLahir,
      'tgl_lahir': tglLahir,
      'alamat': alamat,
      'department': department,
      'degree': degree,
      'status_pekerjaan': statusPekerjaan,
      'nama_perusahaan': namaPerusahaan,
      'posisi': jabatan,
      'bidang_usaha_perusahaan': bidangUsaha,
      'kota_tempat_kerja': kotaPerusahaan,
    });
    try {
      Response response = await _dio.post(_EDIT_PROFILE,
          data: formData, options: Options(headers: {"requiresToken": true}));
      // throwIfNoSuccess(response);
      return MessageResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return MessageResponse.withError(_handleError(e));
    }
  }

  Future<MessageResponse> verifikasiNIM(nim, angkatanTahun) async {
    var formData = FormData.fromMap({
      'nim': nim,
      'angkatan_tahun': angkatanTahun,
    });
    try {
      Response response = await _dio.post(_VERIFIKASI_NIM,
          data: formData, options: Options(headers: {"requiresToken": true}));
      // throwIfNoSuccess(response);
      return MessageResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return MessageResponse.withError(_handleError(e));
    }
  }

  Future<LoginResponse> refreshUser() async {
    try {
      Response response = await _dio.get(_REFRESH_USER,
          options: Options(headers: {"requiresToken": true}));
      // throwIfNoSuccess(response);
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return LoginResponse.withError(_handleError(e));
    }
  }

  Future<DonasiTrxList> getDonasiTrx(page, keyword) async {
    try {
      Response response = await _dio.get(_DONASI_TRX,
          queryParameters: {'page': page, 'q': keyword},
          options: Options(headers: {"requiresToken": true}));
      return DonasiTrxList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return DonasiTrxList.withError(_handleError(e));
    }
  }

  Future<JenisAnggotaList> getJenisAnggota() async {
    try {
      Response response = await _dio.get(_JENIS_ANGGOTA,
          options: Options(headers: {"requiresToken": true}));
      return JenisAnggotaList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return JenisAnggotaList.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }

  Future<IuranTrxList> getIuranTrx(page, keyword) async {
    try {
      Response response = await _dio.get(_IURAN_TRX,
          queryParameters: {'page': page, 'q': keyword},
          options: Options(headers: {"requiresToken": true}));
      return IuranTrxList.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return IuranTrxList.withError(_handleError(e));
    }
  }

  Future<FaqResponse> getFaq() async {
    try {
      Response response = await _dio.get(_FAQ);
      return FaqResponse.fromJson(response.data);
    } on DioError catch (e) {
      // print("error");
      // print("Exception occured: $error stackTrace: $stacktrace");
      return FaqResponse.withError(
          _handleError(e), e.response != null ? e.response!.statusCode! : 500);
    }
  }

  Future<InvoiceDonasi> payDonasi(int amount, int? idDonasiCampaign) async {
    var formData = FormData.fromMap({
      'id_donasi_campaign': idDonasiCampaign,
      'amount': amount,
    });
    try {
      Response response = await _dio.post(_PAY_DONASI,
          data: formData, options: Options(headers: {"requiresToken": true}));
      // throwIfNoSuccess(response);
      return InvoiceDonasi.fromJson(response.data);
    } on DioError catch (e) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return InvoiceDonasi.withError(_handleError(e));
    }
  }

  Future<InvoiceIuran> payIuran(int? idJenisAnggota) async {
    var formData = FormData.fromMap({
      'id_jenis_anggota': idJenisAnggota,
    });
    try {
      Response response = await _dio.post(_PAY_IURAN,
          data: formData, options: Options(headers: {"requiresToken": true}));
      // throwIfNoSuccess(response);
      return InvoiceIuran.fromJson(response.data);
    } on DioError catch (e) {
      // print("Exception occured: $error stackTrace: $stacktrace");
      return InvoiceIuran.withError(_handleError(e));
    }
  }
}
