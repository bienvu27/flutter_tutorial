import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tutorial/state_management/bloc/source/lib/data/grocery_data.dart';
import 'package:flutter_tutorial/state_management/bloc/source/lib/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistProductButtonNavigateEvent>(
        homeWishlistProductButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                price: e["price"],
                imageUrl: e["imageUrl"]))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Wishlist Product clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart Product clicked");
  }

  FutureOr<void> homeWishlistProductButtonNavigateEvent(
      HomeWishlistProductButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
    print("Wishlist Navigate clicked");
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
    print("Cart Navigate clicked");
  }
}
