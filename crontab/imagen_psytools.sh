#!/bin/sh

# this script is executed daily at 04:10 AM CET/CEST
#
# 1. It downloads data from the Delosis server into raw CSV files.
# 2. It derives the raw CSV files.
# 3. It pseudonynmizes the derived CSV files.

/volatile/src/imagen_databank/psytools/imagen_psytools_download.py
mkdir -p /tmp/imagen/BL/processed/psytools \
         /tmp/imagen/FU1/processed/psytools \
         /tmp/imagen/FU2/processed/psytools \
         /tmp/imagen/FU3/processed/psytools \
         /tmp/imagen/STRATIFY/processed/psytools \
         /tmp/imagen/IMACOV19_BL/processed/psytools \
         /tmp/imagen/IMACOV19_FU/processed/psytools \
         /tmp/imagen/IMACOV19_FU2/processed/psytools \
         /tmp/imagen/IMACOV19_FU3/processed/psytools \
         /tmp/imagen/STRATICO19_BL/processed/psytools \
         /tmp/imagen/STRATICO19_FU/processed/psytools \
         /tmp/imagen/STRATICO19_FU2/processed/psytools \
         /tmp/imagen/STRATICO19_FU3/processed/psytools
/volatile/src/imagen_r/R/imagen_psytools_derive.R
/volatile/src/imagen_databank/psytools/imagen_psytools_deidentify.py
rm -rf /tmp/imagen
