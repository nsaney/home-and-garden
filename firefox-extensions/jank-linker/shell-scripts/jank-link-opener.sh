#!/bin/bash

jankUrl="$1"
if [[ "${jankUrl}" == jank:* ]]; then
  url="${jankUrl:5}"
  opera "${url}"
fi
