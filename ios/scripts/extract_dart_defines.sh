#!/bin/sh

# Dart defineを書き出すファイルパスを指定
OUTPUT_FILE="${SRCROOT}/Flutter/Dart-Defines.xcconfig"
# Dart defineの中身を変更した時に古いプロパティが残らないように、初めにファイルを空にする
: > $OUTPUT_FILE

# Dart defineをデコード
function decode_url() { echo "${*}" | base64 --decode; }

IFS=',' read -r -a define_items <<<"$DART_DEFINES"

for index in "${!define_items[@]}"
do
    item=$(decode_url "${define_items[$index]}")
    # Dartの定義にはFlutter側で自動定義された項目も含まれる
    # しかし、それらの定義を書き出してしまうとエラーによりビルドができなくなるので、
    # flutterやFLUTTERで始まる項目は出力しないようにしている
    lowercase_item=$(echo "$item" | tr '[:upper:]' '[:lower:]')
    if [[ $lowercase_item != flutter* ]]; then
        echo "$item" >> "$OUTPUT_FILE"
    fi
done