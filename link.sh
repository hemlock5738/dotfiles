if [[ "$OS" == "Windows_NT" ]]; then
    export MSYS=winsymlinks:nativestrict
fi

find . -mindepth 2 -maxdepth 2 -type f -name '*.example' | while read -r file; do
  cp "$file" "${file%.example}"
done

find . -mindepth 2 -maxdepth 2 -type f -name '.*' ! -name '.*.example' | while read -r file; do
    ln -sfv "$(realpath "$file")" "$HOME/$(basename "$file")"
done

if [[ "$OS" == "Windows_NT" ]]; then
  mkdir -p ~/.config/git
  ln -sfv "$(realpath ./git/git-prompt.sh)" ~/.config/git/
fi
