import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:readmore/readmore.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            height: 250,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            article.author ?? "",
            style: TextStyle(color: Color(0xFF79828B)),
          ),
          SizedBox(
            height: 3,
          ),
          Text(article.title ?? ""),
          SizedBox(
            height: 3,
          ),
          ReadMoreText(
            article.description ?? "",
            trimLines: 1,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            article.publishedAt?.substring(0, 10) ?? "",
            textAlign: TextAlign.right,
          )
        ],
      ),
    );
  }
}
