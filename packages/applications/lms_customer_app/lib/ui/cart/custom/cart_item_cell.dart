import 'package:flutter/material.dart';

// class CartItemCell extends StatelessWidget {
//   final Course course;

//   const CartItemCell({
//     super.key,
//     required this.course,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.network(
//         course.coverImage,
//         fit: BoxFit.cover,
//       ),
//       title: Text(
//         course.title,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//         maxLines: 1,
//       ),
//       subtitle: Text(
//         course.description,
//         maxLines: 2,
//       ),
//     );
//   }
// }

class CartItemCell extends StatelessWidget {
  const CartItemCell({
    super.key,
    required this.coverImage,
    required this.title,
    required this.description,
    required this.author,
  });

  final Widget coverImage;
  final String title;
  final String description;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: coverImage,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  description: description,
                  author: author,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    required this.title,
    required this.description,
    required this.author,
  });

  final String title;
  final String description;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Expanded(
          child: Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          author,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
