// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:ken/smeup/models/smeup_fun.dart';
import 'package:ken/smeup/services/transformers/smeup_data_transformer_interface.dart';
import 'package:kokos_json_transformer/kokos_json_transformer.dart';

class KokosTransformer implements SmeupDataTransformerInterface {
  @override
  transform(SmeupFun smeupFun, data) {
    var kokosJsonTransformer = KokosJsonTransformer();
    JsonType type =
        kokosJsonTransformer.getJsonType(smeupFun.fun['fun']['component']);

    return KokosJsonTransformer().transform(type, data);
  }
}
