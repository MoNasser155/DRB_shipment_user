import 'package:drb_shipment_user/core/languages/languages.dart';

class FaqModel {
  final String question;
  final String answer;

  FaqModel({required this.question, required this.answer});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      question:
          Languages.currentLanguage.isEnglish
              ? json['titleEn']
              : json['titleAr'],
      answer:
          Languages.currentLanguage.isEnglish
              ? json['descriptionEn']
              : json['descriptionAr'],
    );
  }

  factory FaqModel.skeleton () {
    return FaqModel(
      question: '',
      answer: '',
    );
  } 
}
