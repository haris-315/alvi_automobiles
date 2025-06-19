// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class DrawerItem {
  final String id;
  final String title;
  final String slug;
  final String content;
  final bool is_active;
  final int position;

  DrawerItem({
    required this.id,
    required this.title,
    required this.slug,
    required this.content,
    required this.is_active,
    required this.position,
  });

  DrawerItem copyWith({
    String? id,
    String? title,
    String? slug,
    String? content,
    bool? is_active,
    int? position,
  }) {
    return DrawerItem(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      content: content ?? this.content,
      is_active: is_active ?? this.is_active,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
      'content': content,
      'is_active': is_active,
      'position': position,
    };
  }

  factory DrawerItem.fromMap(Map<String, dynamic> map) {
    return DrawerItem(
      id: map['id'] as String,
      title: map['title'] as String,
      slug: map['slug'] as String,
      content: map['content'] as String,
      is_active: map['is_active'] as bool,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DrawerItem.fromJson(String source) => DrawerItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DrawerItem(id: $id, title: $title, slug: $slug, content: $content, is_active: $is_active, position: $position)';
  }

  @override
  bool operator ==(covariant DrawerItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.slug == slug &&
      other.content == content &&
      other.is_active == is_active &&
      other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      slug.hashCode ^
      content.hashCode ^
      is_active.hashCode ^
      position.hashCode;
  }
}

