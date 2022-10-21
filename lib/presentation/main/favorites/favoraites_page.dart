import 'package:air_shop/app/di.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:air_shop/presentation/main/favorites/favorites_viewmodel.dart';
import 'package:air_shop/presentation/main/home/home_viewmodel.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/icons_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FavoritesViewModel _viewModel = instance<FavoritesViewModel>();
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind(){
    _viewModel.start();
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context ,snapShot){
          return snapShot.data?.getScreenWidget(context, _getContentWidget(_viewModel.favorites),
                  (){
                _viewModel.start();
              }) ?? Container();
        },
      ),
    );
  }

  Widget _getContentWidget(List<FavDataList>? favorites){
    if (favorites != null) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
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
                        image: NetworkImage(favorites[index].product.image),
                        height: AppSize.s120,
                        width: AppSize.s120,
                        fit: BoxFit.contain,
                      ),
                      if(favorites[index].product.discount != 0)
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
                          favorites[index].product.name,
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
                              favorites[index].product.price.toString(),
                              style: TextStyle(
                                  fontSize: AppSize.s14,
                                  color: ColorManager.black
                              ),
                            ),
                            const SizedBox(width: 10,),
                            if(favorites[index].product.discount != 0)
                              Text(
                                favorites[index].product.oldPrice.toString(),
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
                                  setState(() {
                                    _homeViewModel.changeFavorites(favorites[index].product.id);
                                    _viewModel.start();
                                  });
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
        ),
        separatorBuilder: (context, index) => Container(
          height: 2,
          color: ColorManager.whiteOpacity70,
          width: AppSize.inf,
        ),
        itemCount: _viewModel.favorites!.length,
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _homeViewModel.dispose();
    super.dispose();
  }
}