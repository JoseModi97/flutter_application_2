import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/src/core/errors/failures.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, ProductModel>> getProductById(int id);
  Future<Either<Failure, ProductModel>> addProduct(ProductModel product);
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product);
  Future<Either<Failure, void>> deleteProduct(int id);
}
