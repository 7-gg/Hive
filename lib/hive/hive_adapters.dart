import 'package:hive/models/product.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<Product>(),
  AdapterSpec<Categories>(),
])
class HiveAdapters {}
