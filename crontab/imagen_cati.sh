#!/bin/sh

# this script is executed daily by imagen@imagen2.cea.fr at 06:00 AM CET/CEST
#
# 1. It sends new imaging datasets to the CATI team for QC.
# 2. It dumps the database of the upload portal to a JSON file.

/home/imagen/virtualenvs/qualicati_scripts/sync_qc_res.sh
/home/imagen/imagen_misc/dump_rql_upload/dump_rql_upload.sh
