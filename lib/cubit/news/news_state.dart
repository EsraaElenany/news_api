part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class GetBusinessLoadingState extends NewsState {}
final class GetBusinessSuccessState extends NewsState {}
final class GetBusinessErrorState extends NewsState {

}
final class ChangeNavBarState extends NewsState {}
