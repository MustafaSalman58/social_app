part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

class SocialGetPosts extends SocialState {}

class SocialToggleLike extends SocialState {}

class SocialAddPost extends SocialState {}
