import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/src/core/errors/exceptions.dart';
import 'package:flutter_application_2/src/core/errors/failures.dart';
import 'package:flutter_application_2/src/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';
import 'package:flutter_application_2/src/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();
      return Right(remoteProducts);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getProductById(int id) async {
    try {
      final remoteProduct = await remoteDataSource.getProductById(id);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> addProduct(ProductModel product) async {
    try {
      final remoteProduct = await remoteDataSource.addProduct(product);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) async {
    try {
      final remoteProduct = await remoteDataSource.updateProduct(product);
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
