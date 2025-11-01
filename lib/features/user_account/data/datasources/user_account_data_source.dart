import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/features/user_account/data/models/faq_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../auth/domain/entities/user_entity.dart';

abstract class UserAccountDataSource {
  Future<void> updateUserProfile(UserEntity user);
  Future<List<FaqModel>> getFaqs();
}

class UserAccountDataSourceImpl implements UserAccountDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> updateUserProfile(UserEntity userentity) async {}

  @override
  Future<List<FaqModel>> getFaqs() async {
    try {
      final faqList = await _firestore.collection('faqs').get();
      return faqList.docs.map((e) => FaqModel.fromJson(e.data())).toList();
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
