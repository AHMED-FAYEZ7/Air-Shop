import 'package:air_shop/app/di.dart';
import 'package:air_shop/domain/model/model.dart';
import 'package:air_shop/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:air_shop/presentation/main/categories/categories_viewmodel.dart';
import 'package:air_shop/presentation/resources/color_manager.dart';
import 'package:air_shop/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesViewModel _viewModel = instance<CategoriesViewModel>();

  _bind(){
    _viewModel.start();
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
          return snapShot.data?.getScreenWidget(context, _getContentWidget(),
                  (){
                _viewModel.start();
              }) ?? Container();
        },
      ),
    );
  }

  Widget _getContentWidget(){
    return StreamBuilder<List<CatData>>(
      stream: _viewModel.outputCategories,
      builder: (context,snapshot){
        return _getCategories(snapshot.data);
      },
    );
  }

  Widget _getCategories(List<CatData>? categories) {
    if (categories != null) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
                color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s14)
            ),
            height: AppSize.s140,

            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Row(
                children: [
                  Image(
                    image: NetworkImage(categories[index].image),
                    height: AppSize.s100,
                    width: AppSize.s100,
                  ),
                  const SizedBox(width: AppPadding.p20,),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontSize: AppPadding.p20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios,),
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
        itemCount: categories.length,
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}