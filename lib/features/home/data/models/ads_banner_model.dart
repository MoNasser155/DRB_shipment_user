class AdsBannerModel {
  String? id;
  String? title;
  String? subTitle;
  String? imageUrl;
  DateTime? fromDate;
  DateTime? toDate;

  AdsBannerModel({
    this.id,
    this.title,
    this.subTitle,
    this.imageUrl,
    this.fromDate,
    this.toDate,
  });

  factory AdsBannerModel.fromMap(Map<String, dynamic> map) {
    return AdsBannerModel(
      id: map['id'],
      title: map['title'],
      subTitle: map['subTitle'],
      imageUrl: map['imageUrl'],
      fromDate: map['fromDate'].toDate(),
      toDate: map['toDate'].toDate(),
    );
  }
}
