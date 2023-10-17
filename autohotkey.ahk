; variables
HOME := "C:\Users\buddh"
WIREGUARD_CONF := HOME . "\Documents\client.conf"
VIVALDI_DIR := "C:\Users\buddh\AppData\Local\Vivaldi\Application"
SIOYEK_DIR := HOME . "\Documents\sioyek-release-windows"
GOLDENDICT_DIR := "C:\Program Files (x86)\GoldenDict"
CODE_DIR := HOME . "\AppData\Local\Programs\Microsoft VS Code"

  ; direction
CapsLock & j::
  {
    Send "{Down}"
    return
  }
CapsLock & k::
  {
    Send "{Up}"
    return
  }
CapsLock & h::
  {
    Send "{Left}"
    return
  }
CapsLock & l::
  {
    Send "{Right}"
    return
  }
CapsLock & u::
  {
    Send "{PgUp}"
    return
  }
CapsLock & d::
  {
    Send "{PgDn}"
    return
  }

  ; switch input method
^Space::
  {
    Send "^{Shift}"
    return
  }

  ; task manager
#i::
  {
    Run "taskmgr"
    return
  }

  ; close process
#Space::
  {
    Send "!{F4}"
    return
  }

  ; full screen
#f::
  {
    Send "{f11}"
    return
  }


  ; file explorer
#j::
  {
    Run "explorer"
    return
  }

  ; terminal
#Enter::
  {
    Run "wt.exe"
    Sleep 1000
    WinActivate("ahk_exe WindowsTerminal.exe")
    return
  }

  ; helix
#n::
  {
    Run "hx"
    return
  }

  ; vscode
#u:: 
  {
    if WinExist("ahk_exe Code.exe") {
      WinActivate("ahk_exe Code.exe")
    } else {
      Run CODE_DIR . "\Code.exe"
      Sleep 3000
      WinActivate("ahk_exe Code.exe")
    }
    return
  }

  ; vivaldi
#y::
  {
    if WinExist("ahk_exe vivaldi.exe") {
      WinActivate("ahk_exe vivaldi.exe")
    } else {
      Run VIVALDI_DIR . "\vivaldi.exe"
      Sleep 3000
      WinActivate("ahk_exe vivaldi.exe")
    }
    return
  }

  ; sioyek
#p::
  {
    if WinExist("ahk_exe sioyek.exe") {
      WinActivate("ahk_exe sioyek.exe")
    } else {
      Run SIOYEK_DIR . "\sioyek.exe"
      Sleep 500
      WinActivate("ahk_exe sioyek.exe")
    }
    return
  }

  ; GoldenDict
#;::
  {
    if WinExist("ahk_exe GoldenDict.exe") {
      WinActivate("ahk_exe GoldenDict.exe")
    } else {
      Run GOLDENDICT_DIR . "\GoldenDict.exe"
      Sleep 1000
      WinActivate("ahk_exe GoldenDict.exe")
    }
    return
  }

  ; wireguard
#PgUp::
  {
    Run "*RunAs wireguard.exe /installtunnelservice " . WIREGUARD_CONF
    return
  }

#PgDn::
  {
    Run "*RunAs wireguard.exe /uninstalltunnelservice client"
    return
  }
