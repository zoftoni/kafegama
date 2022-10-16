import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafegama/core.dart';
import 'package:kafegama/model/user_profile/user_profile.dart';

class EditProfilController extends GetxController {
  EditProfilView? view;
  final _jenisKelamin = ''.obs;
  final _department = ''.obs;
  final _statusPekerjaan = ''.obs;
  final _tglLahir = DateTime.now().obs;
  RxBool isLoading = false.obs;
  Uint8List? exportedImage;
  final ImagePicker _picker = ImagePicker();
  late Rx<XFile> photo = XFile('').obs;
  final alumni = Alumni().obs;
  var userProfile = UserProfile();

  TextEditingController tempatLahirC = TextEditingController(text: '');
  TextEditingController alamatC = TextEditingController(text: '');
  TextEditingController degreeC = TextEditingController(text: '');
  TextEditingController namaPerusahaanC = TextEditingController(text: '');
  TextEditingController jabatanC = TextEditingController(text: '');
  TextEditingController bidangUsahaC = TextEditingController(text: '');
  TextEditingController kotaPerusahaanC = TextEditingController(text: '');

  set jenisKelamin(String str) {
    _jenisKelamin.value = str;
  }

  String get jenisKelamin => _jenisKelamin.value;

  set department(String str) {
    _department.value = str;
  }

  String get department => _department.value;

  set statusPekerjaan(String str) {
    _statusPekerjaan.value = str;
  }

  String get statusPekerjaan => _statusPekerjaan.value;

  set tglLahir(DateTime dt) {
    _tglLahir.value = dt;
  }

  DateTime get tglLahir => _tglLahir.value;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    isLoading.value = true;
    APIProvider apiProvider = Get.find();
    try {
      final result = await apiProvider.getUserProfileData();
      userProfile = result;

      if (userProfile.error != null) {
        Get.snackbar(
          "Error",
          "error:: " + userProfile.error!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      } else {
        alumni.value = userProfile.data!;
        tempatLahirC.text =
            alumni.value.tempatLahir != null ? alumni.value.tempatLahir! : "";
        alumni.value.tglLahir != null
            ? _tglLahir.value = DateTime.parse(alumni.value.tglLahir!)
            : "";
        alamatC.text = alumni.value.alamat != null ? alumni.value.alamat! : "";
        degreeC.text = alumni.value.degree != null ? alumni.value.degree! : "";
        namaPerusahaanC.text = alumni.value.namaPerusahaan != null
            ? alumni.value.namaPerusahaan!
            : "";
        jabatanC.text = alumni.value.posisi != null ? alumni.value.posisi! : "";
        bidangUsahaC.text = alumni.value.bidangUsahaPerusahaan != null
            ? alumni.value.bidangUsahaPerusahaan!
            : "";
        kotaPerusahaanC.text = alumni.value.kotaTempatKerja != null
            ? alumni.value.kotaTempatKerja!
            : "";

        alumni.value.sex != null ? _jenisKelamin.value = alumni.value.sex! : "";
        alumni.value.department != null
            ? _department.value = alumni.value.department!
            : "";
        alumni.value.statusPekerjaan != null
            ? _statusPekerjaan.value = alumni.value.statusPekerjaan!
            : "";
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "error:: " + e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    Get.defaultDialog(
      title: "Pilih Sumber Gambar",
      content: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              pickImageGallery();
            },
            child: Row(
              children: const <Widget>[
                Icon(Icons.image),
                Text('Dari Galeri'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              pickImageCamera();
            },
            child: Row(
              children: const <Widget>[
                Icon(Icons.camera),
                Text('Dari Kamera'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImageCamera() async {
    photo.value = (await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 25))!;
    Get.back();
  }

  Future<void> pickImageGallery() async {
    photo.value = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 25))!;
    Get.back();
  }
}
