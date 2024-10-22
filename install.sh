if [[ "$OS" == "Windows_NT" ]]; then
    apps=(
        astral-sh.uv
        Git.Git
        GitHub.cli
        Google.Chrome
        Google.GoogleDrive
        Google.JapaneseIME
        Microsoft.VisualStudioCode
        Volta.Volta
        WiresharkFoundation.Wireshark
    )
    for app in "${apps[@]}"; do
        winget install --id "$app"
    done
fi
