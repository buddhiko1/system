; variables
HOME := "C:\Users\buddh"
WIREGUARD_CONF := HOME . "\Documents\client.conf"
VIVALDI_DIR := "C:\Users\buddh\AppData\Local\Vivaldi\Application"

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

  ; file explorer
#j::
  {
    Run "explorer"
    return
  }

  ; terminal
#Enter::
  {
    if WinExist("ahk_exe WindowsTerminal.exe") {
      WinActivate("ahk_exe WindowsTerminal.exe")
    } else {
      Run "wt.exe"
      Sleep 1000
      WinActivate("ahk_exe WindowsTerminal.exe")
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
