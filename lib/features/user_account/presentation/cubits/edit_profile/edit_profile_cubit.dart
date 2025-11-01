import 'package:drb_shipment_user/core/enums/state_status.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/cashe_storage.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileState.initial());

  static EditProfileCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> initEditProfile() async {
    emit(state.copyWith(status: StateStatus.loading));
    await Future.wait([_setUser()]);
    emit(state.copyWith(status: StateStatus.success));
  }

  Future<void> _setUser() async {
    final user = UserEntity.fromMap(
      await CacheStorage.read(Constants.userKey, isDecoded: true),
    );
    emit(state.copyWith(user: user));
  }
}
