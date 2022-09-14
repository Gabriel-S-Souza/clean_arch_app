import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_app.config.dart';

final getIt = GetIt.instance;
  
@InjectableInit(  
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

Future<void> setUpDependencies() async {
  $initGetIt(getIt);
}