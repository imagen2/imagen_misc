#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import json
import logging


def main():
    rql = 'Any X, UF WHERE X is CWUpload, X upload_fields UF, X status != "Rejected", X form_name = "MRI"'
    rset = session.execute(rql)

    result1 = {}
    for row in rset.iter_rows_with_entities():
        cwupload = row[0]
        upload_fields = result1.setdefault(cwupload.eid, {})

        upload_field = row[1]
        if upload_field.name in upload_fields:
            logging.error('%d: duplicate upload_field %s',
                          cwupload.eid, upload_field.name)
        else:
            upload_fields[upload_field.name] = upload_field.value

    result2 = {}
    for eid, upload_fields in result1.items():
        time_point = upload_fields.pop('time_point')
        sid = upload_fields.pop('sid')
        result2.setdefault(time_point, {})[sid] = upload_fields
   
    json.dump(result2, sys.stdout, ensure_ascii=False,
              indent=2, separators=(',', ': '))


if __name__ == "__main__":
    main()
