;version: 1.1.0
;date: 4 Mar 2020
;made by u/_chatiii

#MaxHotkeysPerInterval 999999
#NoEnv
#Persistent
#SingleInstance Ignore

CurrentKeyMap := 0

Menu, Tray, Icon, icon-off.ico
Menu, Tray, NoStandard
Menu, Tray, Add, Touhou Remapper v1.0.0, donothing
Menu, Tray, Add
Menu, Tray, Add, None, None
Menu, Tray, Add, Touhou Default Remap, thWASD
Menu, Tray, Add, Touhou 9 Player 1 Remap, th9P1
Menu, Tray, Add, Touhou 9 Player 2 Remap, th9P2
Menu, Tray, Add
Menu, Tray, Add, Show GUI, GUI
Menu, Tray, Add
Menu, Tray, Add, Reload, Reload
Menu, Tray, Add, Exit, Exit

Menu, Tray, Disable, 1&
Menu, Tray, Check, 3&
Menu, Tray, Default, 4&

CapsLock & 0 UP::
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	Gosub, None
	return
CapsLock & 1 UP::
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	Gosub, thWASD
	return
CapsLock & 2 UP::
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	Gosub, th9P1
	return
CapsLock & 3 UP::
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	Gosub, th9P2
	return
CapsLock & r::
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	Gosub, Reload
	return

donothing:
	return
None:
	if (CurrentKeyMap != 0){
		Hotkey *w, Off
		Hotkey *w up, Off
		Hotkey *a, Off
		Hotkey *a up, Off
		Hotkey *s, Off
		Hotkey *s up, Off
		Hotkey *d, Off
		Hotkey *d up, Off
		Hotkey *j, Off
		Hotkey *j up, Off
		Hotkey *k, Off
		Hotkey *k up, Off
		Hotkey *l, Off, UseErrorLevel011
		Hotkey *l up, Off, UseErrorLevel
		Hotkey LShift, Off, UseErrorLevel
		Hotkey LShift up, Off, UseErrorLevel
		Menu, Tray, Check, 3&
		Menu, Tray, Uncheck, 4&
		Menu, Tray, Uncheck, 5&
		CurrentKeyMap := 0
		Menu, Tray, Icon, icon-off.ico
		SplashTextOn,,20, Touhou Remapper, Remapper disabled!
		Sleep, 1000
		SplashTextOff
	}
	return
thWASD:
	if (CurrentKeyMap != 1){
		Hotkey *w, H_thWASD_w, On
		Hotkey *w up, H_thWASD_w_u, On
		Hotkey *a, H_thWASD_a, On
		Hotkey *a up, H_thWASD_a_u, On
		Hotkey *s, H_thWASD_s, On
		Hotkey *s up, H_thWASD_s_u, On
		Hotkey *d, H_thWASD_d, On
		Hotkey *d up, H_thWASD_d_u, On
		Hotkey *j, H_thWASD_j, On
		Hotkey *j up, H_thWASD_j_u, On
		Hotkey *k, H_thWASD_k, On
		Hotkey *k up, H_thWASD_k_u, On
		Hotkey *l, H_thWASD_l, On
		Hotkey *l up, H_thWASD_l_u, On
		Hotkey LShift, Off, UseErrorLevel
		Hotkey LShift up, Off, UseErrorLevel
		Menu, Tray, Uncheck, 3&
		Menu, Tray, Check, 4&
		Menu, Tray, Uncheck, 5&
		Menu, Tray, Uncheck, 6&
		CurrentKeyMap := 1
		Menu, Tray, Icon, icon.ico
		SplashTextOn,,40, Touhou Remapper, Touhou Default Remapper enabled!
		Sleep, 1000
		SplashTextOff
	}
	return
th9P1:
	if (CurrentKeyMap != 2){
		Hotkey *w, H_th9P1_w, On
		Hotkey *w up, H_th9P1_w_u, On
		Hotkey *a, H_th9P1_a, On
		Hotkey *a up, H_th9P1_a_u, On
		Hotkey *s, H_th9P1_s, On
		Hotkey *s up, H_th9P1_s_u, On
		Hotkey *d, H_th9P1_d, On
		Hotkey *d up, H_th9P1_d_u, On
		Hotkey *j, H_th9P1_j, On
		Hotkey *j up, H_th9P1_j_u, On
		Hotkey *k, H_th9P1_k, On
		Hotkey *k up, H_th9P1_k_u, On
		Hotkey *l, Off, UseErrorLevel
		Hotkey *l up, Off, UseErrorLevel
		Hotkey LShift, Off, UseErrorLevel
		Hotkey LShift up, Off, UseErrorLevel
		Menu, Tray, Uncheck, 3&
		Menu, Tray, Uncheck, 4&
		Menu, Tray, Check, 5&
		Menu, Tray, Uncheck, 6&
		CurrentKeyMap := 2
		Menu, Tray, Icon, icon.ico
		SplashTextOn,,40, Touhou Remapper, Touhou 9 Player 1 Remapper enabled!
		Sleep, 1000
		SplashTextOff
	}
	return
th9P2:
	if (CurrentKeyMap != 3){
		Hotkey *w, H_th9P2_w, On
		Hotkey *w up, H_th9P2_w_u, On
		Hotkey *a, H_th9P2_a, On
		Hotkey *a up, H_th9P2_a_u, On
		Hotkey *s, H_th9P2_s, On
		Hotkey *s up, H_th9P2_s_u, On
		Hotkey *d, H_th9P2_d, On
		Hotkey *d up, H_th9P2_d_u, On
		Hotkey *j, H_th9P2_j, On
		Hotkey *j up, H_th9P2_j_u, On
		Hotkey *k, H_th9P2_k, On
		Hotkey *k up, H_th9P2_k_u, On
		Hotkey *l, Off, UseErrorLevel
		Hotkey *l up, Off, UseErrorLevel
		Hotkey LShift, H_th9P2_shift, On
		Hotkey LShift up, H_th9P2_shift_u, On
		Menu, Tray, Uncheck, 3&
		Menu, Tray, Uncheck, 4&
		Menu, Tray, Uncheck, 5&
		Menu, Tray, Check, 6&
		CurrentKeyMap := 3
		Menu, Tray, Icon, icon.ico
		SplashTextOn,,40, Touhou Remapper, Touhou 9 Player 2 Remapper enabled!
		Sleep, 1000
		SplashTextOff
	}
	return
GUI:
	Gui, Destroy
	Gui, Add, Picture, w50 h50 x5 y5, icon.ico
	Gui, Add, Text, w260 h30 x55 y25 center, Touhou Remapper v1.1.0
	Gui, Add, Button, w150 h50 x5 y60 gNone, Disable
	Gui, Add, Button, w150 h50 x155 y60 gthWASD, Touhou Default Remap
	Gui, Add, Button, w150 h50 x5 y110 gth9P1, Touhou 9 Player 1 Remap
	Gui, Add, Button, w150 h50 x155 y110 gth9P2, Touhou 9 Player 2 Remap
	Gui, Add, Text, w300 h30 x5 y165 center, You can also switch remappers with CapsLock + 0/1/2/3`nYou can reset the remapper with either CapsLock + R.
	Gui, Add, Text, w300 h20 x5 y195 center gEasterEgg, Made by u/_chatiii
	Gui, Show, w310 h215 Center, Touhou Remapper
	;Menu, Tray, Disable, 7&
	return
EasterEgg:
	MsgBox, 310, uwu, ow you found me
	IfMsgBox Cancel
		MsgBox, 49, :c, QAQ
		IfMsgBox Cancel
			MsgBox, 16, >:C, ToT
	else IfMsgBox TryAgain
		Gosub, EasterEgg
	return
Reload:
	Reload
	return
Exit:
	ExitApp
	return

H_thWASD_w:
	Send, {Blind}{up DownTemp}
	return
H_thWASD_w_u:
	Send, {Blind}{up up}
	return
H_thWASD_a:
	Send, {Blind}{left DownTemp}
	return
H_thWASD_a_u:
	Send, {Blind}{left up}
	return
H_thWASD_s:
	Send, {Blind}{down DownTemp}
	return
H_thWASD_s_u:
	Send, {Blind}{down up}
	return
H_thWASD_d:
	Send, {Blind}{right DownTemp}
	return
H_thWASD_d_u:
	Send, {Blind}{right up}
	return
H_thWASD_j:
	Send, {Blind}{z DownTemp}
	return
H_thWASD_j_u:
	Send, {Blind}{z up}
	return
H_thWASD_k:
	Send, {Blind}{x DownTemp}
	return
H_thWASD_k_u:
	Send, {Blind}{x up}
	return
H_thWASD_l:
	Send, {Blind}{c DownTemp}
	return
H_thWASD_l_u:
	Send, {Blind}{c up}
	return

H_th9P1_w:
	Send, {Blind}{t DownTemp}
	return
H_th9P1_w_u:
	Send, {Blind}{t up}
	return
H_th9P1_a:
	Send, {Blind}{f DownTemp}
	return
H_th9P1_a_u:
	Send, {Blind}{f up}
	return
H_th9P1_s:
	Send, {Blind}{b DownTemp}
	return
H_th9P1_s_u:
	Send, {Blind}{b up}
	return
H_th9P1_d:
	Send, {Blind}{h DownTemp}
	return
H_th9P1_d_u:
	Send, {Blind}{h up}
	return
H_th9P1_j:
	Send, {Blind}{z DownTemp}
	return
H_th9P1_j_u:
	Send, {Blind}{z up}
	return
H_th9P1_k:
	Send, {Blind}{x DownTemp}
	return
H_th9P1_k_u:
	Send, {Blind}{x up}
	return

H_th9P2_w:
	Send, {Blind}{Numpad8 DownTemp}
	return
H_th9P2_w_u:
	Send, {Blind}{Numpad8 up}
	return
H_th9P2_a:
	Send, {Blind}{Numpad4 DownTemp}
	return
H_th9P2_a_u:
	Send, {Blind}{Numpad4 up}
	return
H_th9P2_s:
	Send, {Blind}{Numpad2 DownTemp}
	return
H_th9P2_s_u:
	Send, {Blind}{Numpad2 up}
	return
H_th9P2_d:
	Send, {Blind}{Numpad6 DownTemp}
	return
H_th9P2_d_u:
	Send, {Blind}{Numpad6 up}
	return
H_th9P2_j:
	Send, {Blind}{Down DownTemp}
	return
H_th9P2_j_u:
	Send, {Blind}{Down up}
	return
H_th9P2_k:
	Send, {Blind}{Right DownTemp}
	return
H_th9P2_k_u:
	Send, {Blind}{Right up}
	return
H_th9P2_shift:
	Send, {Blind}{Left DownTemp}
	return
H_th9P2_shift_u:
	Send, {Blind}{Left up}
	return