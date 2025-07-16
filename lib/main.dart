import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/src/cart/presentations/bloc/cart_bloc.dart';
import 'package:flutter_application_2/src/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:flutter_application_2/src/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_application_2/src/product/domain/usecases/get_all_products.dart';
import 'package:flutter_application_2/src/product/presentations/bloc/product_bloc.dart';
import 'package:flutter_application_2/src/product/presentations/screens/product_list_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductBloc(
              getAllProductsUseCase: GetAllProductsUseCase(
                ProductRepositoryImpl(
                  remoteDataSource: ProductRemoteDataSourceImpl(
                    client: http.Client(),
                  ),
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(),
          ),
        ],
        child: const ProductListScreen(),
      ),
    );
  }
}
