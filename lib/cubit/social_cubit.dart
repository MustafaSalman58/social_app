import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home/models/post_model.dart';
import 'package:meta/meta.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitial());

  List<PostModel> posts = [];
  List<String> postIds = [];

  getAllPosts() {
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('uId')
        .get()
        .then((postsf) => {
              postsf.docs.forEach((post) {
                posts.add(PostModel.fromJson(post.data()));
                postIds.add(post.id);
                print(posts[0].likes);
                emit(SocialGetPosts());
              }),
            });
  }

  toggleLike(isLiked, PostModel post, uid, postId) {
    if (isLiked == true) {
      post.likes.remove(uid);
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'likes': post.likes});
      emit(SocialToggleLike());
    } else {
      post.likes.addAll({uid: true});
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .update({'likes': post.likes});
      emit(SocialToggleLike());
    }
  }

  addNewPost(String postText) async {
    PostModel post = PostModel(
      name: 'Saad',
      uId: '456',
      image:
          'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
      dateTime: Timestamp.now(),
      text: postText,
      postImage:
          'https://images.unsplash.com/photo-1512314889357-e157c22f938d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5mb3JtYXRpb258ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      likes: {},
    );

    await FirebaseFirestore.instance
        .collection('posts')
        .add(post.toMap())
        .then((value) => {
              posts.add(post),
              postIds.add(value.id),
              emit(SocialAddPost()),
            });
  }

  isLikedPost(PostModel post, String uid) {
    return post.likes.containsKey(uid);
  }
}
