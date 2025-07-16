import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_application_2/src/core/errors/exceptions.dart';
import 'package:flutter_application_2/src/core/errors/failures.dart';
import 'package:flutter_application_2/src/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';
import 'package:flutter_application_2/src/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<dartz.Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      final remoteProducts = await remoteDataSource.getAllProducts();
      return dartz.Right(remoteProducts);
    } on ServerException {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, ProductModel>> getProductById(int id) async {
    try {
      final remoteProduct = await remoteDataSource.getProductById(id);
      return dartz.Right(remoteProduct);
    } on ServerException {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, ProductModel>> addProduct(ProductModel product) async {
    try {
      final remoteProduct = await remoteDataSource.addProduct(product);
      return dartz.Right(remoteProduct);
    } on ServerException {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, ProductModel>> updateProduct(ProductModel product) async {
    try {
      final remoteProduct = await remoteDataSource.updateProduct(product);
      return dartz.Right(remoteProduct);
    } on ServerException {
      return dartz.Left(ServerFailure());
    }
  }

  @override
  Future<dartz.Either<Failure, void>> deleteProduct(int id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return const dartz.Right(null);
    } on ServerException {
      return dartz.Left(ServerFailure());
    }
  }
}
