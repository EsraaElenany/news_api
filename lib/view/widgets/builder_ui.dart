import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/news_model.dart';

class BuilderUi extends StatelessWidget {
  Articles articles;
   BuilderUi({super.key ,required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300]
      ),
      child: ListTile(
        leading: Image.network(articles.urlToImage ?? ""),
        title: Text(articles.title ?? " no data"),
        subtitle: Text("${articles.description} ?? no data "),

      ),

    );
  }
}
