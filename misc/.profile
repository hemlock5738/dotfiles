if [[ "$OS" == "Windows_NT" ]]; then
    export MSYS=winsymlinks:nativestrict
fi

ENV_FILE=~/.env
if [ -f "$ENV_FILE" ]; then
    while IFS= read -r line; do
        if [[ -n "$line" && "$line" != \#* ]]; then
            key="${line%%=*}"
            value="${line#*=}"
            export "$key=$value"
        fi
    done < "$ENV_FILE"
fi
