#!/bin/sh

# Check Arguments
# ===============

  keep=2
  if [ $# -eq 1 ]; then keep=$1; fi

# Get Listing of builds
# =====================

  dirs=`/bin/ls | grep -Eo '[0-9]{8}T[0-9]{6}' | sort -r`

# Clean expired builds
# ====================

  i=1
  for dir in $dirs; do

    if [ $i -le $keep ]; then
      echo "Keeping $dir"
    else
      echo "Removing $dir"
      /bin/rm -r -f $dir
    fi

    i=`expr $i + 1`

  done

exit 0
