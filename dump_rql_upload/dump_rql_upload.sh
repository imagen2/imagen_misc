#!/bin/sh

DIRNAME=`dirname $0`

. ~/virtualenvs/imagen_upload/bin/activate
cubicweb-ctl shell imagen_upload "$DIRNAME/dump_rql_upload.py" > /chroot/data/tmp/cati/dump_rql_upload.json
