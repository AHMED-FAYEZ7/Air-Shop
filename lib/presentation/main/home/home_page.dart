import 'package:air_shop/app/di.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:air_shop/presentation/main/home/home_viewmodel.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/strings_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/icons_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  _bind(){
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context ,snapShot){
            return snapShot.data?.getScreenWidget(context, _getContentWidget(),
                (){
              _viewModel.start();
                }) ?? Container();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getBannersCarousel(),
        _getSection(AppStrings.categories),
        _getCategories(),
        _getSection(AppStrings.products),
        _getProducts(),
      ],
    );
  }

  Widget _getBannersCarousel(){
    return StreamBuilder<List<Banners>>(
      stream: _viewModel.outputBanners,
      builder: (context,snapshot){
        return _getBanner(snapshot.data);
      },
    );
  }

  Widget _getBanner(List<Banners>? banners) {
    if (banners != null) {
      return CarouselSlider(
          items: banners
              .map((banner) => SizedBox(
            width: double.infinity,
            child: Card(
              elevation: AppSize.s1_5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  // side: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12),
                child: Image.network(
                  banner.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ))
              .toList(),
          options: CarouselOptions(
              height: AppSize.s190,
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true));
    } else {
      return Container();
    }
  }

  Widget _getSection(String title){
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
  
  Widget _getCategories(){
    return StreamBuilder<List<CatData>>(
      stream: _viewModel.outputCategorise,
      builder: (context,snapshot){
        return _getCategoriseWidget(snapshot.data);
      },
    );
  }

  Widget _getCategoriseWidget(List<CatData>? categorise) {
    if (categorise != null) {
      return SizedBox(
        height: AppSize.s110,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context , index) =>
                Card(
                  elevation: AppSize.s1_5,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Image.network(
                        categorise[index].image,
                        height: AppSize.s100,
                        width: AppSize.s100,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: 100,
                        color: Colors.black.withOpacity(AppSize.s_8,),
                        child: Text(
                          categorise[index].name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            separatorBuilder: (context , index) => const SizedBox(width: AppSize.s_8,),
            itemCount: categorise.length,
        ),
      );
    } else {
      return Container();
    }
  }
  
  Widget _getProducts(){
    return StreamBuilder<List<Products>>(
      stream: _viewModel.outputProducts,
      builder: (context,snapshot){
        return _getProductsWidget(snapshot.data);
      },
    );
  }

  Widget _getProductsWidget(List<Products>? products){
    if(products != null){
      return Container(
        color: ColorManager.whiteOpacity70,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p2),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: 2,
            childAspectRatio: 1/1.49,
            children: List.generate(
              products.length,
              (index) => Card(
                elevation: AppSize.s6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s16),
                    color: ColorManager.white,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Image(
                            image: NetworkImage(products[index].image,),
                            height: AppSize.s200,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          if(products[index].discount != 0)
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
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: AppSize.s14,
                                height: 1.3,
                                color: ColorManager.black
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  '${products[index].price.round()}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorManager.black,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                if(products[index].discount != 0)
                                  Text(
                                    '${products[index].oldPrice.round()}',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: ColorManager.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                const Spacer(),
                                CircleAvatar(
                                  backgroundColor: ColorManager.lightGrey,
                                  radius: AppSize.s14,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: ()
                                    {},
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      size: AppSize.s16,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4,),
                                CircleAvatar(
                                  backgroundColor: ColorManager.lightGrey,
                                  radius: AppSize.s14,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: ()
                                    {},
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
          ),
        ),
      );
    }else{
      return Container();
    }
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}