import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_application_2/src/core/errors/failures.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<dartz.Either<Failure, List<ProductModel>>> getAllProducts();
  Future<dartz.Either<Failure, ProductModel>> getProductById(int id);
  Future<dartz.Either<Failure, ProductModel>> addProduct(ProductModel product);
  Future<dartz.Either<Failure, ProductModel>> updateProduct(ProductModel product);
  Future<dartz.Either<Failure, void>> deleteProduct(int id);
}
