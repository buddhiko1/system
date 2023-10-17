## 
  - install app: `winget import -i app`.
  - uninstall widget: `winget uninstall MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy`.
  - remove web search: .

## rime
  - https://rime.im
  
## magic touchpad
  - https://github.com/imbushuo/mac-precision-touchpad

## ssh
  - Generate ssh key `ssh-keygen -t ed25519 -C "example@outlook.com"`.
  - [add to github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

## Node
  - pnpm
    ```
    run `pnpm setup` after install pnpm with winget.
    add 'C:\Users\buddh\AppData\Local\pnpm' to user path.
    ```
## Helix
[keys.normal.space]
"c" = { "r" = ":config-reload", "o" = ":config-open", "l" = ":open ~/AppData/Roaming/helix/languages.toml" }
"t" = { "d" = ":theme github_dark", "l" = ":theme github_light" }
"m" = { "m" = ":sh wt gitui" }
"n" = { "n" = ":sh wt" }

## windows terminal
```
  "commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -nologo",
  "font": 
  {
      "cellHeight": "1.6",
      "face": "JetBrainsMono Nerd Font",
      "size": 14.0
  },
  "padding": "0",
  "scrollbarState": "hidden",
  "useAtlasEngine": false
```