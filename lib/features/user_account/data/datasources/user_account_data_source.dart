import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../models/faq_model.dart';

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
      final faqList = await _firestore.collection(Collections.faqs).get();
      return faqList.docs.map((e) => FaqModel.fromJson(e.data())).toList();
   
  }
}
