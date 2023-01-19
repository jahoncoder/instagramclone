import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/model/post_model.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

import 'message_page.dart';

class PostPage extends StatefulWidget {
  PageController? pageController;
  PostPage({this.pageController, super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<Post> posts = [];

  final String _image_url1 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB58BsvuPTLrunlFUjAEklp4XXgcKIpFGppQ&usqp=CAU";
  final String _image_url2 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPcBxj7M8ofJBSZLv5pCTF4GpavyZuhShICQ&usqp=CAU";

  @override
  void initState() {
    super.initState();
    posts.add(
      Post(_image_url1, "Bu ajoyib bir Palmadur"),
    );
    posts.add(
      Post(_image_url2, "Eksklyuziv kartinka rasmi"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0.5,
        title: Text(
          "Instagram",
          style: TextStyle(fontFamily: "FontsFree", fontSize: 40),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.aspect_ratio,
          color: Colors.orange,
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MSGPage(),
                      ),
                    );
                  },
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage("assets/images/msg.png"),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    widget.pageController!.animateToPage(2,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  icon: Icon(Icons.add_a_photo_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => _itemPost(
              context, posts[index].image_url!, posts[index].caption!),
          separatorBuilder: (context, index) => const Divider(
                thickness: 0.8,
              ),
          itemCount: posts.length),
    );
  }
}

Widget _itemPost(BuildContext context, String imgUrl, String caption) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/insta.png"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "11-yanvar 2023",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  _showMain(context);
                },
                icon: const Icon(
                  EvaIcons.moreHorizontal,
                  size: 30,
                ))
          ],
        ),
      ),
      Container(
        color: Colors.grey.withOpacity(0.3),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 2 / 3,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imgUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 2 / 3,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2, top: 13),
            child: LikeButton(
              likeCount: 0,
              countPostion: CountPostion.bottom,
              likeBuilder: (isTapped) {
                return Icon(
                  Icons.favorite,
                  size: 25,
                  color: isTapped ? Colors.red : Colors.grey,
                );
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.paperPlane,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2, top: 13),
                child: LikeButton(
                  likeCount: 0,
                  countPostion: CountPostion.bottom,
                  likeBuilder: (isTapped) {
                    return Icon(
                      Icons.bookmark,
                      size: 25,
                      color: isTapped ? Colors.black : Colors.grey,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          caption,
          style: const TextStyle(fontSize: 16),
        ),
      )
    ],
  );
}

_showMain(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: false,
    backgroundColor: Colors.orange,
    context: context,
    builder: ((context) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 150,
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.link_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        "Link",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        "Saved",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.repeat_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        "Restart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.qr_code_scanner_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      Text(
                        "QR-cod",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.save_alt_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Save to your device",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.trending_up_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Boost reel",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.restore,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Archive",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite_outline_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hide likes",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.do_not_disturb_off_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Turn off commenting",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_view_month_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Remove from profile grid",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.push_pin_outlined,
                        color: Colors.white,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Unpin from profile",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 36,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
  );
}
