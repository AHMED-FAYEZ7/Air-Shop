import 'package:air_shop/app/di.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:air_shop/presentation/main/favorites/favorites_cubit/cubit.dart';
import 'package:air_shop/presentation/main/favorites/favorites_cubit/states.dart';
import 'package:air_shop/presentation/resources/assets_manager.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/icons_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/usecase/fav_usecase.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  @override
  Widget build(BuildContext context) {
    final FavoritesCubit _cubit = instance<FavoritesCubit>();
    final FavUseCase favUseCase = instance<FavUseCase>();

    return BlocProvider(
      create: (context) => FavoritesCubit(favUseCase)..getFavorites(),
      child: BlocConsumer<FavoritesCubit,FavoritesStates>(
        listener: (context ,state){
          if (state is SuccessFavoritesState){
            print("done");
          }
          if (state is LoadingFavoritesState){
            print("loading");
          }
          if (state is ErrorFavoritesState){
            print("error");
          }
        },
        builder: (context ,state){

          return ConditionalBuilder(
            condition: state is! LoadingFavoritesState ,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildListItem(
                  FavoritesCubit.get(context).favorites![index].product
                ),
                separatorBuilder: (context, index) => Container(
                  height: 2,
                  color: ColorManager.whiteOpacity70,
                  width: AppSize.inf,
                ),
                itemCount: FavoritesCubit.get(context).favorites!.length,
            ),
            fallback: (context) => Center(child: Lottie.asset(JsonAssets.loading,
              height: AppSize.s100,
              width: AppSize.s100,)),
          );
        },
        ),
      );
    }

  // Widget loading(){
  //   return LoadingState(stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE);
  // }

  Widget buildListItem(model) => Card(
    elevation: 1,
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  height: AppSize.s120,
                  width: AppSize.s120,
                  fit: BoxFit.contain,
                ),
                if(model.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p_8,),
                    child: Text(
                      AppStrings.discount,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSize.s20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20,),
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: AppSize.s14,
                        height: 1.3,
                        color: ColorManager.black
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                            fontSize: AppSize.s14,
                            color: ColorManager.black
                        ),
                      ),
                      const SizedBox(width: 10,),
                      if(model.discount != 0)
                        Text(
                          model.oldPrice.toString(),
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: AppSize.s12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        radius: AppSize.s14,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: ()
                          {
                            // setState(() {
                            //   _homeViewModel.changeFavorites(favorites[index].product.id);
                            //   _viewModel.getFavorites();
                            // });
                          },
                          icon: Icon(
                            IconBroken.Heart,
                            size: AppSize.s16,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
