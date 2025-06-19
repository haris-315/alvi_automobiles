class Blog {
  final int id;
  final String title;
  final String slug;
  final String chapter;
  final String featuredImage;
  final String excerpt;
  final String content;
  final Author author;
  final DateTime publishedDate;
  final List<String> tags;
  final int likes;
  final int comments;

  Blog({
    required this.id,
    required this.title,
    required this.slug,
    required this.chapter,
    required this.featuredImage,
    required this.excerpt,
    required this.content,
    required this.author,
    required this.publishedDate,
    required this.tags,
    required this.likes,
    required this.comments,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      chapter: json['chapter'],
      featuredImage: json['featured_image'],
      excerpt: json['excerpt'],
      content: json['content'],
      author: Author.fromJson(json['author']),
      publishedDate: DateTime.parse(json['published_date']),
      tags: List<String>.from(json['tags']),
      likes: json['likes'],
      comments: json['comments'],
    );
  }
}

class Author {
  final String name;
  final String title;
  final String authorImage;

  Author({
    required this.name,
    required this.title,
    required this.authorImage,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      title: json['title'],
      authorImage: json['author_image'],
    );
  }
}
