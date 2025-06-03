// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/class/api/api_manager.dart' as _i530;
import 'features/data/data_source/data_source_DS.dart' as _i957;
import 'features/data/data_source/item_details/data_source.dart' as _i106;
import 'features/data/data_source/item_details/DS_item_impl.dart' as _i971;
import 'features/data/data_source/products/data_source_products.dart' as _i59;
import 'features/data/data_source/products/remote_data_source_impl.dart'
    as _i317;
import 'features/data/data_source/remote_data_impl.dart' as _i569;
import 'features/data/data_source/sub_categories/data_source_DS.dart' as _i502;
import 'features/data/data_source/sub_categories/remote_data_ipml.dart'
    as _i218;
import 'features/data/repository/item_repo_remote_impl.dart' as _i959;
import 'features/data/repository/products_repo_impl.dart' as _i253;
import 'features/data/repository/repo_remote_impl.dart' as _i1001;
import 'features/data/repository/repo_remote_subcat.dart' as _i152;
import 'features/doman/repository/item_repo.dart' as _i392;
import 'features/doman/repository/products_repo.dart' as _i922;
import 'features/doman/repository/repo_cat.dart' as _i336;
import 'features/doman/repository/repo_subcat.dart' as _i706;
import 'features/doman/usecase/cat_usecase.dart' as _i534;
import 'features/doman/usecase/item_usecase.dart' as _i370;
import 'features/doman/usecase/products_usecase.dart' as _i689;
import 'features/doman/usecase/subcat_usecase.dart' as _i679;
import 'features/presentation/manager/categories/bloc_subcat.dart' as _i193;
import 'features/presentation/manager/home/home_bloc.dart' as _i582;
import 'features/presentation/manager/item/bloc.dart' as _i356;
import 'features/presentation/manager/products/bloc.dart' as _i339;
import 'features/presentation/manager/tabs/tab_bloc.dart' as _i936;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i936.TabBloc>(() => _i936.TabBloc());
    gh.singleton<_i530.ApiManager>(() => _i530.ApiManager());
    gh.factory<_i106.ItemDS>(
        () => _i971.ItemDSImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i59.DataSourceProducts>(
        () => _i317.DateSourceRemoteProductsImpl(api: gh<_i530.ApiManager>()));
    gh.lazySingleton<_i922.RepoProducts>(() =>
        _i253.RepoProductsImpl(dataSource: gh<_i59.DataSourceProducts>()));
    gh.factory<_i392.RepoItem>(
        () => _i959.RepoItemImpl(itemDS: gh<_i106.ItemDS>()));
    gh.factory<_i957.CategoriesDS>(
        () => _i569.CatRemoteImplDS(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i502.SubCategoriesDS>(
        () => _i218.SubCategories(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i370.UseCaseItem>(
        () => _i370.UseCaseItem(repoItem: gh<_i392.RepoItem>()));
    gh.factory<_i706.SubCategoriesRepo>(() => _i152.RepoRemoteSubcatImpl(
        subCategoriesDS: gh<_i502.SubCategoriesDS>()));
    gh.factory<_i356.BlocItem>(
        () => _i356.BlocItem(usecase: gh<_i370.UseCaseItem>()));
    gh.factory<_i336.HomeRepo>(() =>
        _i1001.RepoCatRemoteImpl(catRemoteImplDS: gh<_i957.CategoriesDS>()));
    gh.factory<_i689.UseCaseProducts>(
        () => _i689.UseCaseProducts(repo: gh<_i922.RepoProducts>()));
    gh.factory<_i534.HomUseCase>(
        () => _i534.HomUseCase(homeRepo: gh<_i336.HomeRepo>()));
    gh.factory<_i339.BlocProducts>(
        () => _i339.BlocProducts(useCase: gh<_i689.UseCaseProducts>()));
    gh.factory<_i679.SubcatUsecase>(() =>
        _i679.SubcatUsecase(subCategoriesRepo: gh<_i706.SubCategoriesRepo>()));
    gh.factory<_i582.HomeBloc>(
        () => _i582.HomeBloc(homeUseCase: gh<_i534.HomUseCase>()));
    gh.factory<_i193.SubCatBloc>(() => _i193.SubCatBloc(
          usecase: gh<_i679.SubcatUsecase>(),
          repo: gh<_i336.HomeRepo>(),
        ));
    return this;
  }
}
