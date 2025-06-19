// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class LandingDataItem {
  final String id;
  final String title;
  final String subtitle;
  final String tag;
  final String image;
  final bool is_active;
  final int position;
  LandingDataItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.image,
    required this.is_active,
    required this.position,
  });

  LandingDataItem copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? tag,
    String? image,
    bool? is_active,
    int? position,
  }) {
    return LandingDataItem(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      tag: tag ?? this.tag,
      image: image ?? this.image,
      is_active: is_active ?? this.is_active,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'tag': tag,
      'image': image,
      'is_active': is_active,
      'position': position,
    };
  }

  factory LandingDataItem.fromMap(Map<String, dynamic> map) {
    return LandingDataItem(
      id: map['id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      tag: map['tag'] as String,
      image: map['image'] as String,
      is_active: map['is_active'] as bool,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LandingDataItem.fromJson(String source) => LandingDataItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LandingDataItem(id: $id, title: $title, subtitle: $subtitle, tag: $tag, image: $image, is_active: $is_active, position: $position)';
  }

  @override
  bool operator ==(covariant LandingDataItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.tag == tag &&
      other.image == image &&
      other.is_active == is_active &&
      other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      tag.hashCode ^
      image.hashCode ^
      is_active.hashCode ^
      position.hashCode;
  }
}

