import 'package:flutter/material.dart';
import 'package:gendroid/newsapp/view/detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeInImage.assetNetwork(
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: "assets/img/placeholder.jfif",
            image: imgUrl),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              newsHead.length > 50
                  ? "${newsHead.substring(0, 50)}..."
                  : newsHead,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              newsDes,
              style: const TextStyle(fontSize: 16, color: Colors.black38),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsCnt != "--"
                  ? newsCnt.length > 500
                      ? newsCnt.substring(0, 500)
                      : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                  : newsCnt,
              style: const TextStyle(fontSize: 16),
            ),
          ]),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl)));
                  },
                  child: const Text("Read More")),
            ),
          ],
        ),
        Center(
            child: TextButton(
                onPressed: () async {
                  await launchUrl(Uri.parse("https://newsapi.org/"));
                },
                child: const Text(
                  "News Provided By NewsAPI.org",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ))),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
