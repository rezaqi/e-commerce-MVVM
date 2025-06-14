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
import 'features/data/data_source/acc/get/get_account_DS.dart' as _i727;
import 'features/data/data_source/acc/get/get_account_DS_impl.dart' as _i207;
import 'features/data/data_source/cart/add/add_to_cart_DS.dart' as _i824;
import 'features/data/data_source/cart/add/add_to_cart_DS_impl.dart' as _i40;
import 'features/data/data_source/cart/delete/delete_cart_DS.dart' as _i179;
import 'features/data/data_source/cart/delete/delete_cart_DS_impl.dart'
    as _i751;
import 'features/data/data_source/cart/get/get_cart_DS.dart' as _i955;
import 'features/data/data_source/cart/get/get_cart_DS_impl.dart' as _i693;
import 'features/data/data_source/cart/update/cart_update_DS.dart' as _i370;
import 'features/data/data_source/cart/update/cart_update_DS_impl.dart' as _i44;
import 'features/data/data_source/data_source_DS.dart' as _i957;
import 'features/data/data_source/fav/add/add_DS.dart' as _i418;
import 'features/data/data_source/fav/add/add_DS_impl.dart' as _i895;
import 'features/data/data_source/fav/get/get_DS.dart' as _i949;
import 'features/data/data_source/fav/get/get_DS_impl.dart' as _i561;
import 'features/data/data_source/fav/remove/remove_DS.dart' as _i656;
import 'features/data/data_source/fav/remove/removel_DS_impl.dart' as _i836;
import 'features/data/data_source/item_details/data_source.dart' as _i106;
import 'features/data/data_source/item_details/DS_item_impl.dart' as _i971;
import 'features/data/data_source/products/data_source_products.dart' as _i59;
import 'features/data/data_source/products/remote_data_source_impl.dart'
    as _i317;
import 'features/data/data_source/remote_data_impl.dart' as _i569;
import 'features/data/data_source/sub_categories/data_source_DS.dart' as _i502;
import 'features/data/data_source/sub_categories/remote_data_ipml.dart'
    as _i218;
import 'features/data/repository/account/get_account_repo_impl.dart' as _i697;
import 'features/data/repository/cart/add_repo_impl.dart' as _i396;
import 'features/data/repository/cart/delete_cart_repo_impl.dart' as _i350;
import 'features/data/repository/cart/get_cart_repo_impl.dart' as _i107;
import 'features/data/repository/cart/update_repo_impl.dart' as _i439;
import 'features/data/repository/fav/add_repo_impl.dart' as _i94;
import 'features/data/repository/fav/get_repo_impl.dart' as _i495;
import 'features/data/repository/fav/remove_repo.dart' as _i627;
import 'features/data/repository/item_repo_remote_impl.dart' as _i959;
import 'features/data/repository/products_repo_impl.dart' as _i253;
import 'features/data/repository/repo_remote_impl.dart' as _i1001;
import 'features/data/repository/repo_remote_subcat.dart' as _i152;
import 'features/doman/repository/account/get_account_repo.dart' as _i254;
import 'features/doman/repository/cart/add_repo.dart' as _i86;
import 'features/doman/repository/cart/delete_repo.dart' as _i1015;
import 'features/doman/repository/cart/get_repo.dart' as _i182;
import 'features/doman/repository/cart/update_repo.dart' as _i857;
import 'features/doman/repository/fav/add_repo.dart' as _i715;
import 'features/doman/repository/fav/get_repo.dart' as _i159;
import 'features/doman/repository/fav/remove_repo.dart' as _i234;
import 'features/doman/repository/item_repo.dart' as _i392;
import 'features/doman/repository/products_repo.dart' as _i922;
import 'features/doman/repository/repo_cat.dart' as _i336;
import 'features/doman/repository/repo_subcat.dart' as _i706;
import 'features/doman/usecase/account/get_account_usecase.dart' as _i468;
import 'features/doman/usecase/cart/add_usecase.dart' as _i881;
import 'features/doman/usecase/cart/delete_cart_usecase.dart' as _i1032;
import 'features/doman/usecase/cart/get_cart_usecase.dart' as _i966;
import 'features/doman/usecase/cart/update_usecae.dart' as _i956;
import 'features/doman/usecase/cat_usecase.dart' as _i534;
import 'features/doman/usecase/fav/add_usecase.dart' as _i436;
import 'features/doman/usecase/fav/get_usecase.dart' as _i621;
import 'features/doman/usecase/fav/remove_usecase.dart' as _i28;
import 'features/doman/usecase/item_usecase.dart' as _i370;
import 'features/doman/usecase/products_usecase.dart' as _i689;
import 'features/doman/usecase/subcat_usecase.dart' as _i679;
import 'features/presentation/manager/account/bloc_account.dart' as _i1072;
import 'features/presentation/manager/cart/cart_bloc.dart' as _i1013;
import 'features/presentation/manager/categories/bloc_subcat.dart' as _i193;
import 'features/presentation/manager/fav/bloc_fav.dart' as _i947;
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
    gh.factory<_i656.RemoveFavDS>(
        () => _i836.RemoveFavDSImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i418.AddFavDS>(
        () => _i895.AddFavDSImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i949.GetFavDS>(
        () => _i561.GetFavDSImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i59.DataSourceProducts>(
        () => _i317.DateSourceRemoteProductsImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i179.DeleteCartDS>(
        () => _i751.DeleteCartDSImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i715.AddFavRepo>(
        () => _i94.AddFavRepoImpl(ds: gh<_i418.AddFavDS>()));
    gh.lazySingleton<_i922.RepoProducts>(() =>
        _i253.RepoProductsImpl(dataSource: gh<_i59.DataSourceProducts>()));
    gh.factory<_i392.RepoItem>(
        () => _i959.RepoItemImpl(itemDS: gh<_i106.ItemDS>()));
    gh.factory<_i824.AddToCartDs>(
        () => _i40.AddToCartDsImpl(api: gh<_i530.ApiManager>()));
    gh.factory<_i234.RemoveFavRepo>(
        () => _i627.RemoveFavRepoImpl(ds: gh<_i656.RemoveFavDS>()));
    gh.factory<_i727.GetAccountDs>(
        () => _i207.GetAccountDsImpl(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i1015.CartDeleteRepo>(
        () => _i350.DeleteCartRepoImpl(dataSource: gh<_i179.DeleteCartDS>()));
    gh.factory<_i955.GetCartDs>(
        () => _i693.GetCartDsImpl(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i957.CategoriesDS>(
        () => _i569.CatRemoteImplDS(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i370.CartUpdateDs>(
        () => _i44.CartUpdateDSImpl(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i502.SubCategoriesDS>(
        () => _i218.SubCategories(apiManager: gh<_i530.ApiManager>()));
    gh.factory<_i1032.UseCaseDeleteCart>(
        () => _i1032.UseCaseDeleteCart(repo: gh<_i1015.CartDeleteRepo>()));
    gh.factory<_i254.GetAccountRepo>(
        () => _i697.GetAccountRepoImpl(getAccountDs: gh<_i727.GetAccountDs>()));
    gh.factory<_i159.GetFavRepo>(
        () => _i495.GetFavRepoImpl(ds: gh<_i949.GetFavDS>()));
    gh.factory<_i182.GetCartRepo>(
        () => _i107.GetCartRepoImpl(dataSource: gh<_i955.GetCartDs>()));
    gh.factory<_i28.RemoveFavUseCase>(
        () => _i28.RemoveFavUseCase(repo: gh<_i234.RemoveFavRepo>()));
    gh.factory<_i857.RepoCartUpdate>(
        () => _i439.RepoCartUpdateImpl(dataSource: gh<_i370.CartUpdateDs>()));
    gh.factory<_i86.RepoAddToCart>(
        () => _i396.RepoAddToCartImpl(addToCartDs: gh<_i824.AddToCartDs>()));
    gh.factory<_i370.UseCaseItem>(
        () => _i370.UseCaseItem(repoItem: gh<_i392.RepoItem>()));
    gh.factory<_i706.SubCategoriesRepo>(() => _i152.RepoRemoteSubcatImpl(
        subCategoriesDS: gh<_i502.SubCategoriesDS>()));
    gh.factory<_i436.AddFavUseCase>(
        () => _i436.AddFavUseCase(repo: gh<_i715.AddFavRepo>()));
    gh.factory<_i881.UseCaseAddToCart>(
        () => _i881.UseCaseAddToCart(repo: gh<_i86.RepoAddToCart>()));
    gh.factory<_i336.HomeRepo>(() =>
        _i1001.RepoCatRemoteImpl(catRemoteImplDS: gh<_i957.CategoriesDS>()));
    gh.factory<_i966.UseCaseGetCart>(
        () => _i966.UseCaseGetCart(repo: gh<_i182.GetCartRepo>()));
    gh.factory<_i689.UseCaseProducts>(
        () => _i689.UseCaseProducts(repo: gh<_i922.RepoProducts>()));
    gh.factory<_i356.BlocItem>(() => _i356.BlocItem(
          usecase: gh<_i370.UseCaseItem>(),
          useCaseAddToCart: gh<_i881.UseCaseAddToCart>(),
        ));
    gh.factory<_i621.GetFavUseCase>(
        () => _i621.GetFavUseCase(repo: gh<_i159.GetFavRepo>()));
    gh.factory<_i468.GetAccountUsecase>(() =>
        _i468.GetAccountUsecase(getAccountRepo: gh<_i254.GetAccountRepo>()));
    gh.factory<_i534.HomUseCase>(
        () => _i534.HomUseCase(homeRepo: gh<_i336.HomeRepo>()));
    gh.factory<_i339.BlocProducts>(
        () => _i339.BlocProducts(useCase: gh<_i689.UseCaseProducts>()));
    gh.factory<_i679.SubcatUsecase>(() =>
        _i679.SubcatUsecase(subCategoriesRepo: gh<_i706.SubCategoriesRepo>()));
    gh.factory<_i956.UseCaseUpdateCart>(
        () => _i956.UseCaseUpdateCart(repo: gh<_i857.RepoCartUpdate>()));
    gh.factory<_i947.BlocFav>(() => _i947.BlocFav(
          usecaseRemove: gh<_i28.RemoveFavUseCase>(),
          usecaseGet: gh<_i621.GetFavUseCase>(),
          usecaseAdd: gh<_i436.AddFavUseCase>(),
        ));
    gh.factory<_i1072.BlocAccount>(() =>
        _i1072.BlocAccount(getAccountUsecase: gh<_i468.GetAccountUsecase>()));
    gh.factory<_i582.HomeBloc>(
        () => _i582.HomeBloc(homeUseCase: gh<_i534.HomUseCase>()));
    gh.factory<_i193.SubCatBloc>(() => _i193.SubCatBloc(
          usecase: gh<_i679.SubcatUsecase>(),
          repo: gh<_i336.HomeRepo>(),
        ));
    gh.factory<_i1013.BlocCart>(() => _i1013.BlocCart(
          usecase: gh<_i966.UseCaseGetCart>(),
          useCaseUpdateCart: gh<_i956.UseCaseUpdateCart>(),
          usecaseDelete: gh<_i1032.UseCaseDeleteCart>(),
        ));
    return this;
  }
}
