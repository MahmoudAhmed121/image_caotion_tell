part of 'upload_cubit.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadSucess extends UploadState {
  final ResponseModel responseModel;

  UploadSucess(this.responseModel);
}

class UploadFailer extends UploadState {}

class UploadPass extends UploadState {}
