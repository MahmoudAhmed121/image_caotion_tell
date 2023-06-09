import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_booking/model/response_model.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit({this.responseModel}) : super(UploadInitial());

  static UploadCubit get(context) => BlocProvider.of(context);
  ResponseModel? responseModel;
  File? imageFile;

  Future<void> imageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
  }

  Future<void> imageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
  }

  Future<void> upload() async {
    if (imageFile == null) return;
    // print(imageFile);
    emit(UploadLoading());
    final dio = Dio();
    final url = "http://10.0.2.2:8000/api/predict/";

    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile!.path),
    });

    try {
      final response = await dio.post(url, data: formData);

      final responseData = ResponseModel.fromJson(response.data);

      emit(UploadSucess(responseData));
    } on DioError catch (e) {
      print("Error: ${e.message}");
    }
  }
}
