; variables
HOME := "C:\Users\buddh"
WIREGUARD_CONF := HOME . "\Documents\client.conf"
VIVALDI_DIR := "C:\Users\buddh\AppData\Local\Vivaldi\Application"
SIOYEK_DIR := HOME . "\Documents\software\sioyek-release-windows"
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
#t::
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
#v:: 
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
      Sleep 4000
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
      Sleep 1000
      WinActivate("ahk_exe sioyek.exe")
    }
    return
  }

  ; shotcut
#c::
  {
    if WinExist("ahk_exe shotcut.exe") {
      WinActivate("ahk_exe shotcut.exe")
    } else {
      Run "C:\Program Files\Shotcut\shotcut.exe"
    }
    return
  }

  ; obs
#o::
  {
    if WinExist("ahk_exe obs64.exe") {
      WinActivate("ahk_exe obs64.exe")
    } else {
      Run "C:\Program Files\obs-studio\bin\64bit\obs64.exe"
    }
    return
  }

  ; inkscape
#i::
  {
    if WinExist("ahk_exe inkscape.exe") {
      WinActivate("ahk_exe inkscape.exe")
    } else {
      Run "C:\Program Files\Inkscape\bin\inkscape.exe"
    }
    return
  }

  ; anytype
#a::
  {
    if WinExist("ahk_exe Anytype.exe") {
      WinActivate("ahk_exe Anytype.exe")
    } else {
      Run "C:\Users\buddh\AppData\Local\Programs\anytype\Anytype.exe"
    }
    return
  }

  ; onlyoffice
#e::
  {
    if WinExist("ahk_exe DesktopEditors.exe") {
      WinActivate("ahk_exe DesktopEditors.exe")
    } else {
      Run "C:\Program Files\ONLYOFFICE\DesktopEditors\DesktopEditors.exe"
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
      Sleep 3000
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