#!/bin/zsh
# Deja "fm serve" corriendo siempre en segundo plano (se inicia solo al encender el Mac).
# Uso:  zsh instalar-fm-serve.sh        Para desinstalar:  zsh instalar-fm-serve.sh --quitar

LABEL="cl.rarroyo.fm-serve"
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

if [[ "$1" == "--quitar" ]]; then
  launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null
  rm -f "$PLIST"
  echo "fm serve desinstalado."
  exit 0
fi

FM="$(command -v fm)"
if [[ -z "$FM" ]]; then echo "No encontré fm. ¿Estás en macOS 27?"; exit 1; fi

mkdir -p "$HOME/Library/LaunchAgents"
cat > "$PLIST" <<PL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
  <key>Label</key><string>$LABEL</string>
  <key>ProgramArguments</key><array><string>$FM</string><string>serve</string></array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
  <key>StandardOutPath</key><string>/tmp/fm-serve.log</string>
  <key>StandardErrorPath</key><string>/tmp/fm-serve.log</string>
</dict></plist>
PL

launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null
launchctl bootstrap "gui/$(id -u)" "$PLIST"
sleep 2
echo "fm serve instalado. Primeras líneas del log (aquí aparece el puerto):"
head -5 /tmp/fm-serve.log
