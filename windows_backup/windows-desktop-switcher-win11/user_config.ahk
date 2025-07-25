; ====================
; === INSTRUCTIONS ===
; ====================
; 1. Any lines starting with ; are ignored
; 2. After changing this config file run script file "desktop_switcher.ahk"
; 3. Every line is in the format HOTKEY::ACTION

; === SYMBOLS ===
; !   <- Alt
; +   <- Shift
; ^   <- Ctrl
; #   <- Win
; For more, visit https://autohotkey.com/docs/Hotkeys.htm

; === EXAMPLES ===
; !n::switchDesktopToRight()             <- <Alt> + <N> will switch to the next desktop (to the right of the current one)
; #!space::switchDesktopToRight()        <- <Win> + <Alt> + <Space> will switch to next desktop
; CapsLock & n::switchDesktopToRight()   <- <CapsLock> + <N> will switch to the next desktop (& is necessary when using non-modifier key such as CapsLock)

; ===========================
; === END OF INSTRUCTIONS ===
; ===========================

!1::switchDesktopByNumber(1)
!2::switchDesktopByNumber(2)
!3::switchDesktopByNumber(3)
!4::switchDesktopByNumber(4)
!5::switchDesktopByNumber(5)
!6::switchDesktopByNumber(6)
!7::switchDesktopByNumber(7)
!8::switchDesktopByNumber(8)
!9::switchDesktopByNumber(9)

!Numpad1::switchDesktopByNumber(1)
!Numpad2::switchDesktopByNumber(2)
!Numpad3::switchDesktopByNumber(3)
!Numpad4::switchDesktopByNumber(4)
!Numpad5::switchDesktopByNumber(5)
!Numpad6::switchDesktopByNumber(6)
!Numpad7::switchDesktopByNumber(7)
!Numpad8::switchDesktopByNumber(8)
!Numpad9::switchDesktopByNumber(9)

!n::switchDesktopToRight()
!p::switchDesktopToLeft()
!b::switchDesktopToLastOpened()

;!c::createVirtualDesktop()
;!d::deleteVirtualDesktop()

!+1::MoveCurrentWindowToDesktop(1)
!+2::MoveCurrentWindowToDesktop(2)
!+3::MoveCurrentWindowToDesktop(3)
!+4::MoveCurrentWindowToDesktop(4)
!+5::MoveCurrentWindowToDesktop(5)
!+6::MoveCurrentWindowToDesktop(6)
!+7::MoveCurrentWindowToDesktop(7)
!+8::MoveCurrentWindowToDesktop(8)
!+9::MoveCurrentWindowToDesktop(9)

!^1::MoveAndBackCurrentWindowToDesktop(1)
!^2::MoveAndBackCurrentWindowToDesktop(2)
!^3::MoveAndBackCurrentWindowToDesktop(3)
!^4::MoveAndBackCurrentWindowToDesktop(4)
!^5::MoveAndBackCurrentWindowToDesktop(5)
!^6::MoveAndBackCurrentWindowToDesktop(6)
!^7::MoveAndBackCurrentWindowToDesktop(7)
!^8::MoveAndBackCurrentWindowToDesktop(8)
!^9::MoveAndBackCurrentWindowToDesktop(9)

!q::closeWindow()
; !h::minimizeWindows()
!m::toggleMaximize()

; !Enter::Run, powershell

!^n::MoveAndBackCurrentWindowToRightDesktop()
!^p::MoveAndBackCurrentWindowToLeftDesktop()
!+n::MoveCurrentWindowToRightDesktop()
!+p::MoveCurrentWindowToLeftDesktop()

; === INSTRUCTIONS ===
; Below is the alternate key configuration. Delete symbol ; in the beginning of the line to enable.
; Note, that  ^!1  means "Ctrl + Alt + 1" and  ^#1  means "Ctrl + Win + 1"
; === END OF INSTRUCTIONS ===

; ^!1::switchDesktopByNumber(1)
; ^!2::switchDesktopByNumber(2)
; ^!3::switchDesktopByNumber(3)
; ^!4::switchDesktopByNumber(4)
; ^!5::switchDesktopByNumber(5)
; ^!6::switchDesktopByNumber(6)
; ^!7::switchDesktopByNumber(7)
; ^!8::switchDesktopByNumber(8)
; ^!9::switchDesktopByNumber(9)

; ^!Numpad1::switchDesktopByNumber(1)
; ^!Numpad2::switchDesktopByNumber(2)
; ^!Numpad3::switchDesktopByNumber(3)
; ^!Numpad4::switchDesktopByNumber(4)
; ^!Numpad5::switchDesktopByNumber(5)
; ^!Numpad6::switchDesktopByNumber(6)
; ^!Numpad7::switchDesktopByNumber(7)
; ^!Numpad8::switchDesktopByNumber(8)
; ^!Numpad9::switchDesktopByNumber(9)

; ^!n::switchDesktopToRight()
; ^!p::switchDesktopToLeft()
; ^!s::switchDesktopToRight()
; ^!a::switchDesktopToLeft()
; ^!tab::switchDesktopToLastOpened()

; ^!c::createVirtualDesktop()
; ^!d::deleteVirtualDesktop()

; ^#1::MoveCurrentWindowToDesktop(1)
; ^#2::MoveCurrentWindowToDesktop(2)
; ^#3::MoveCurrentWindowToDesktop(3)
; ^#4::MoveCurrentWindowToDesktop(4)
; ^#5::MoveCurrentWindowToDesktop(5)
; ^#6::MoveCurrentWindowToDesktop(6)
; ^#7::MoveCurrentWindowToDesktop(7)
; ^#8::MoveCurrentWindowToDesktop(8)
; ^#9::MoveCurrentWindowToDesktop(9)

; ^#Numpad1::MoveCurrentWindowToDesktop(1)
; ^#Numpad2::MoveCurrentWindowToDesktop(2)
; ^#Numpad3::MoveCurrentWindowToDesktop(3)
; ^#Numpad4::MoveCurrentWindowToDesktop(4)
; ^#Numpad5::MoveCurrentWindowToDesktop(5)
; ^#Numpad6::MoveCurrentWindowToDesktop(6)
; ^#Numpad7::MoveCurrentWindowToDesktop(7)
; ^#Numpad8::MoveCurrentWindowToDesktop(8)
; ^#Numpad9::MoveCurrentWindowToDesktop(9)

; ^#Right::MoveCurrentWindowToRightDesktop()
; ^#Left::MoveCurrentWindowToLeftDesktop()



; === INSTRUCTIONS ===
; Additional alternative shortcut for moving current window to left or right desktop (ctrl+shift+Win+left/right)
; === END OF INSTRUCTIONS ===

; ^#+Right::MoveCurrentWindowToRightDesktop()
; ^#+Left::MoveCurrentWindowToLeftDesktop()
