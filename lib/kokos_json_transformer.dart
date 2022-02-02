enum JsonType { nul, exd, exb, tre, fbk }

class KokosJsonTransformer {
  JsonType getJsonType(String typeAsString) {
    JsonType type;
    switch (typeAsString.toUpperCase()) {
      case 'EXD':
        type = JsonType.exd;
        break;
      case 'EXB':
        type = JsonType.exb;
        break;
      case 'TRE':
        type = JsonType.tre;
        break;
      case 'FBK':
        type = JsonType.fbk;
        break;
      default:
        type = JsonType.nul;
    }
    return type;
  }

  transform(JsonType type, Map data) {
    switch (type) {
      case JsonType.exd:
        return data;

      case JsonType.exb:
        dynamic res = _getEmptyDataStructure();

        // columns
        res['columns'] = data['columns'];

        // rows
        List rows = List<dynamic>.empty(growable: true);

        for (var row in (data['rows'] as List)) {
          var newRow = {};
          for (var column in (res['columns'] as List)) {
            final value =
                row['fields'][column['code']]['smeupObject']['codice'];
            newRow[column['code']] = value;
            newRow['tipo'] =
                row['fields'][column['code']]['smeupObject']['tipo'];
            newRow['parametro'] =
                row['fields'][column['code']]['smeupObject']['parametro'];
            newRow['codice'] =
                row['fields'][column['code']]['smeupObject']['codice'];
            newRow['testo'] =
                row['fields'][column['code']]['smeupObject']['testo'];
          }
          rows.add(newRow);
        }

        res['rows'] = rows;
        res['type'] = 'SmeupDataTable';
        return res;

      case JsonType.tre:
        dynamic res = _getEmptyDataStructure();
        List rows = List.empty(growable: true);
        for (var i = 0; i < (data['children'] as List).length; i++) {
          final child = (data['children'] as List)[i];
          final tipo = child['content']['tipo'];
          final parametro = child['content']['parametro'];
          final codice = child['content']['codice'];
          final testo = child['content']['testo'];

          var newRow = {
            'tipo': tipo,
            'parametro': parametro,
            'codice': codice,
            'value': testo,
            //'${child['content']['codice']}': testo
          };

          rows.add(newRow);
        }

        res['rows'] = rows;
        res['type'] = 'SmeupTreeNode';
        return res;

      case JsonType.fbk:
        return data;

      default:
        return data;
    }
  }

  _getEmptyDataStructure() {
    return {"messages": [], "columns": null, "rows": null, "type": ""};
  }
}
