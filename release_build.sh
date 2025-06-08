#!/bin/bash

# If no argument is passed, default to "apk"
if [ -z "$1" ]; then
    echo "No type specified, taking 'apk' as default."
    TYPE="apk"
else
    TYPE="$1"
fi

    flutter build $TYPE --release --obfuscate --split-debug-info=build/debug-info