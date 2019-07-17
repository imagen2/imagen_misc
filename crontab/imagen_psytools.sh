#!/bin/sh

# this script is executed daily by imagen@imagen2.cea.fr at 04:10 AM CET/CEST
#
# 1. It downloads data from the Delosis server into raw CSV files.
# 2. It derives the raw CSV files.
# 3. It pseudonynmizes the derived CSV files.

/volatile/src/imagen_databank/psytools/imagen_psytools_download.py
mkdir -p /tmp/imagen/BL/processed/psytools \
         /tmp/imagen/FU1/processed/psytools \
         /tmp/imagen/FU2/processed/psytools \
         /tmp/imagen/FU3/processed/psytools \
         /tmp/imagen/STRATIFY/processed/psytools
/volatile/src/imagen_databank/psytools/imagen_psytools_derive.py
/volatile/src/imagen_databank/psytools/imagen_psytools_deidentify.py
rm -rf /tmp/imagen
