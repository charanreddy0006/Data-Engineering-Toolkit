#!/usr/bin/env bash
set -euo pipefail

BATCH_DATE="${1:?batch date required}"

python extract.py --date "${BATCH_DATE}"
python validate.py --date "${BATCH_DATE}"
python transform.py --date "${BATCH_DATE}"
python load.py --date "${BATCH_DATE}"
python reconcile.py --date "${BATCH_DATE}"
