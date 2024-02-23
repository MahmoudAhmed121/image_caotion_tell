import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_booking/cubit/upload/image_state.dart';
import 'package:restaurant_booking/model/response_model.dart';

import '../history_cubit/history_cubit.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initial);

  static ImageCubit get(context) => BlocProvider.of(context);
  final FlutterTts _flutterTts = FlutterTts();
  final _dio = Dio();
  final url = "http://10.0.2.2:8000/api/predict/";

  final TextEditingController textEditingController = TextEditingController();

  Future<void> imageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      emit(state.copyWith(imageFile: File(pickedImage.path)));
      emit(state.success());
    }
  }

  Future<void> imageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      emit(state.copyWith(imageFile: File(pickedImage.path)));
      emit(state.success());
    }
  }

  Future<void> upload({required BuildContext context}) async {
    if (state.imageFile == null) return;

    emit(state.loading());

    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(state.imageFile!.path),
    });

    try {
      final response = await _dio.post(url, data: formData);

      final responseData = ImageModel.fromJson(response.data);

      emit(state.copyWith(imageModel: responseData));
      textEditingController.text = state.imageModel!.result;
      context.read<HistoryCubit>().saveValue(textEditingController.text);
      emit(state.success());
    } on DioException catch (e) {
      print("Error: ${e.message}");
    }
  }

  speak() async {
    await _flutterTts.setLanguage("en");

    await _flutterTts.setPitch(1.0);

    await _flutterTts.speak(textEditingController.text);
  }
}
