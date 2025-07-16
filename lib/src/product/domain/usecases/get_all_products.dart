import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/src/core/errors/failures.dart';
import 'package:flutter_application_2/src/core/usecase/usecase.dart';
import 'package:flutter_application_2/src/product/data/models/product_model.dart';
import 'package:flutter_application_2/src/product/domain/repositories/product_repository.dart';

class GetAllProductsUseCase implements UseCase<List<ProductModel>, NoParams> {
  final ProductRepository repository;

  GetAllProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await repository.getAllProducts();
  }
}
