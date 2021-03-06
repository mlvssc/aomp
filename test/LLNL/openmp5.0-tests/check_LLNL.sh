#!/bin/bash

function clean(){
  rm -f test_acquire_release
  rm -f test_allocate_directive
  rm -f test_concurrent_map
  rm -f test_declare_variant
  rm -f test_imperfect_loop
  rm -f test_implicit_declare_target
  rm -f test_non_rectangular
  rm -f test_requires_unified_shared_memory
  rm -f test_use_device_addr
  rm -f *.o
  rm -f *.ERR
}

clean

if [ "$AOMP" == "" ]; then
  echo "Error: Please set AOMP env variable and rerun."
  exit 1
fi

export AOMP_GPU=`$AOMP/bin/mygpu`
echo AOMP_GPU = $AOMP_GPU
echo AOMP = $AOMP

./test.py $AOMP $AOMP_GPU
