import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/screens/home/cubit/cubit.dart';
import 'package:news_app/widgets/news_item.dart';
import 'package:news_app/widgets/source_item.dart';

class TabsScreen extends StatelessWidget {
  List<Sources> sources;

  TabsScreen(this.sources);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: sources.length,
            child: TabBar(
                onTap: (value) {
                  HomeCubit.get(context).changeSource(value);
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: sources.map((source) {
                  return Tab(
                      child: SourceItem(source,
                          sources.indexOf(source) == HomeCubit.get(context).selectedIndex));
                }).toList())),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return NewsItem(HomeCubit.get(context).articles[index]);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: HomeCubit.get(context).articles.length),
        )
        // FutureBuilder(
        //   future: ApiManager.getNewsData(widget.sources[selectedndex].id ?? ""),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.hasError) {
        //       return Column(
        //         children: [
        //           Text("Something went wrong"),
        //           TextButton(onPressed: () {}, child: Text("try again"))
        //         ],
        //       );
        //     }
        //     if (snapshot.data?.status != "ok") {
        //       return Column(
        //         children: [
        //           Text(snapshot.data?.message ?? ""),
        //           TextButton(onPressed: () {}, child: Text("try again"))
        //         ],
        //       );
        //     }
        //     var newsData = snapshot.data?.articles ?? [];
        //     return Expanded(
        //       child: ListView.separated(
        //           itemBuilder: (context, index) {
        //             return NewsItem(newsData[index]);
        //           },
        //           separatorBuilder: (context, index) => Divider(),
        //           itemCount: newsData.length),
        //     );
        //   },
        // )
      ],
    );
  }
}
