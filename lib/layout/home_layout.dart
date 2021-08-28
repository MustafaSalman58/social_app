import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/cubit/social_cubit.dart';
import 'package:home/models/post_model.dart';
import 'package:intl/intl.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'G',
            style: TextStyle(color: Colors.red[900], fontSize: 30),
          ),
          titleSpacing: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Icon(Icons.arrow_back_ios_sharp),
                  onTap: () {},
                ),
                SizedBox(width: 18),
                Expanded(
                  child: InkWell(
                    child: Icon(Icons.search),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_photo_alternate_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocConsumer<SocialCubit, SocialState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BlocProvider.of<SocialCubit>(context).posts.length <= 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.11,
                              color: Colors.red[700],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Text(
                                      'New Post',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/new_post');
                                    },
                                  ),
                                  Text(
                                    'Home / Newsfeed',
                                    style: TextStyle(
                                        color: Colors.grey[300], fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.yellow,
                          thickness: 5,
                          height: 3,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.teal[50],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Afternoon, George Floyd',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'May This afternoon belight, blesses, productive and happy for you',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(height: 1.2),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        'assets/images/sun.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    child: VerticalDivider(
                                      thickness: 5,
                                      color: Colors.red[700],
                                    ),
                                  ),
                                  Text(
                                    'Stories',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      buildStoryItem(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 15,
                                  ),
                                  itemCount: 7,
                                ),
                              ),
                              SizedBox(height: 10),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => buildPostItem(
                                    context,
                                    BlocProvider.of<SocialCubit>(context)
                                        .posts[index],
                                    BlocProvider.of<SocialCubit>(context)
                                        .postIds[index],
                                    index),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                  child: Divider(
                                    thickness: 2,
                                    height: 3,
                                  ),
                                ),
                                itemCount: BlocProvider.of<SocialCubit>(context)
                                    .posts
                                    .length,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }

  Widget buildStoryItem() => Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://image.shutterstock.com/mosaic_250/2936380/640011838/stock-photo-handsome-unshaven-young-dark-skinned-male-laughing-out-loud-at-funny-meme-he-found-on-internet-640011838.jpg',
                ),
              ),
              Positioned(
                right: 15,
                bottom: 5,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.lightGreen,
                ),
              ),
            ],
          ),
          FittedBox(child: Text('Shady'))
        ],
      );

  Widget buildPostItem(
      BuildContext context, PostModel post, String postId, int index) {
    bool isLiked =
        BlocProvider.of<SocialCubit>(context).isLikedPost(post, '123');
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                post.image,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.name),
                Text(
                  (DateFormat().add_yMMMd().format(post.dateTime.toDate())),
                  style:
                      Theme.of(context).textTheme.caption.copyWith(height: 1.3),
                )
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(height: 5),
        Text(
          post.text,
          style: TextStyle(height: 1.3, color: Colors.grey[700]),
        ),
        SizedBox(
          height: 9,
        ),
        Image.network(post.postImage),
        SizedBox(height: 5),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: Image.network(
                          'https://www.vhv.rs/dpng/d/426-4262864_facebook-is-rolling-out-a-new-hug-reaction.png')),
                  Text(' 10'),
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.comment_sharp,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Text(
                    '24 comments',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.screen_share_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  Text(
                    ' 24 Shares',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      BlocProvider.of<SocialCubit>(context)
                          .toggleLike(isLiked, post, '123', postId);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          (post.likes.length).toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        ' comment',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ios_share,
                        color: Colors.grey,
                        size: 18,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        buildCommentItem(context),
      ],
    );
  }

  Widget buildCommentItem(context) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://image.freepik.com/free-photo/half-length-shot-cheerful-senior-man-smiles-happily-with-white-teeth-wears-optical-glasses-sweater-isolated-brown-wall_273609-44148.jpg',
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Jack'),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '2 hours ago',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                            'Comments Comments Comments Comments Comments Comments Comments Comments Comments Comments Comments Comments Comments Comments ',
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.reply,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
