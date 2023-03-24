;version: 1.2.0
;date: 24 Mar 2023
;made by u/_chatiii

#Requires AutoHotkey v2.0-a
#SingleInstance Ignore

A_MaxHotkeysPerInterval := 999999
Persistent true

VersionString := "v1.2.0"

; Set tray icon and tray tooltip
TraySetIcon("icon-off.ico")
A_IconTip := "Touhou Remapper " . VersionString

; Setup tray menu
A_TrayMenu.Delete()
A_TrayMenu.Add("Touhou Remapper " . VersionString, (*) =>)
A_TrayMenu.Add()
A_TrayMenu.Add("None", thNone)
A_TrayMenu.Add("Touhou Default Remap", thWASD)
A_TrayMenu.Add("Touhou 9 Player 1 Remap", th9P1)
A_TrayMenu.Add("Touhou 9 Player 2 Remap", th9P2)
A_TrayMenu.Add()
A_TrayMenu.Add("Show GUI", ShowGUI)
A_TrayMenu.Add()
A_TrayMenu.Add("Reload", (*) => Reload())
A_TrayMenu.Add("Exit", (*) => ExitApp())

A_TrayMenu.Disable("1&")
A_TrayMenu.Check("3&")
A_TrayMenu.Default := "4&"

; Setup the main GUI
MainGUI := GUI()
MainGUI.Title := "Touhou Remapper " . VersionString
MainGUI.AddPicture("w50 h50 x5 y5", "icon.ico")
MainGUI.AddText("w260 h30 x55 y25 center", "Touhou Remapper " . VersionString)
MainGUI.thNoneButton := MainGUI.AddButton("w150 h50 x5 y60", "Disable")
MainGUI.thNoneButton.OnEvent("Click", thNone)
MainGUI.thWASDButton := MainGUI.AddButton("w150 h50 x155 y60", "Touhou Default Remap")
MainGUI.thWASdButton.OnEvent("Click", thWASD)
MainGUI.th9P1Button := MainGUI.AddButton("w150 h50 x5 y110", "Touhou 9 Player 1 Remap")
MainGUI.th9P1Button.OnEvent("Click", th9P1)
MainGUI.th9P2Button := MainGUI.AddButton("w150 h50 x155 y110", "Touhou 9 Player 2 Remap")
MainGUI.th9P2Button.OnEvent("Click", th9P2)
MainGUI.AddText("w300 h30 x5 y165 center", "You can also switch remaps with CapsLock + 0/1/2/3`nYou can reset the remapper with CapsLock + R.")
MainGUI.EasterEggTextLabel := MainGUI.AddText("w300 h20 x5 y195 center", "Made by u/_chatiii")
MainGUI.EasterEggTextLabel.OnEvent("Click", EasterEgg)

ShowGUI(*) {
	MainGUI.Show("w310 h215 center")
	;A_TrayMenu.Disable("7&")
}

EasterEgg(*) {
	MsgBoxResult := MsgBox("ow u found me", "uwu", "Default4 Iconx CancelTryAgainContinue")
	If (MsgBoxResult = "Cancel") {
		MsgBox("QAQ", ":c", "Icon! OKCancel") = "Cancel" ? MsgBox("ToT", ">:C", "Iconx OK") : 0
		
	} else if (MsgBoxResult = "TryAgain") {
		EasterEgg()
	}
}

; Setup Capslock remap toggler
CapsLock & 0 UP::{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
	thNone()
}
CapsLock & 1 UP::{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
	thWASD()
}
CapsLock & 2 UP::{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
	th9P1()
}
CapsLock & 3 UP::{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
	th9P2()
}
CapsLock & r::{
	SetCapsLockState(!GetKeyState("CapsLock", "T"))
	Reload()
}

; They removed SplashText in v2 :C
SplashText(Content) {
	SplashGUI := GUI()
	SplashGUI.Opt("+AlwaysOnTop +ToolWindow")
	SplashGUI.Title := "Touhou Remapper " . VersionString
	SplashGUI.AddText("Center w200", Content)
	SplashGUI.Show("Center AutoSize NoActivate")
	Sleep(1000)
	SplashGUI.Destroy()
}
; The actual toggling function (used by both tray menu and CapsLock hotkeys)
CurrentKeyMap := 0
LShift::return ; ._.
LShift up::return
Hotkey "LShift", "Off"
Hotkey "LShift up", "Off"
thNone(*) {
	global CurrentKeyMap
	if (CurrentKeyMap != 0){
		Hotkey "*w", "Off"
		Hotkey "*w up", "Off"
		Hotkey "*a", "Off"
		Hotkey "*a up", "Off"
		Hotkey "*s", "Off"
		Hotkey "*s up", "Off"
		Hotkey "*d", "Off"
		Hotkey "*d up", "Off"
		Hotkey "*j", "Off"
		Hotkey "*j up", "Off"
		Hotkey "*k", "Off"
		Hotkey "*k up", "Off"
		Hotkey "*l", "Off"
		Hotkey "*l up", "Off"
		Hotkey "LShift", "Off"
		Hotkey "LShift up", "Off"
		A_TrayMenu.Check("3&")
		A_TrayMenu.Uncheck("4&")
		A_TrayMenu.Uncheck("5&")
		A_TrayMenu.Uncheck("6&")
		CurrentKeyMap := 0
		TraySetIcon("icon-off.ico")
		SplashText("Remapper disabled!")
	}
}
thWASD(*) {
	global CurrentKeyMap
	if (CurrentKeyMap != 1){
		Hotkey "*w", H_thWASD_w, "On"
		Hotkey "*w up", H_thWASD_w_u, "On"
		Hotkey "*a", H_thWASD_a, "On"
		Hotkey "*a up", H_thWASD_a_u, "On"
		Hotkey "*s", H_thWASD_s, "On"
		Hotkey "*s up", H_thWASD_s_u, "On"
		Hotkey "*d", H_thWASD_d, "On"
		Hotkey "*d up", H_thWASD_d_u, "On"
		Hotkey "*j", H_thWASD_j, "On"
		Hotkey "*j up", H_thWASD_j_u, "On"
		Hotkey "*k", H_thWASD_k, "On"
		Hotkey "*k up", H_thWASD_k_u, "On"
		Hotkey "*l", H_thWASD_l, "On"
		Hotkey "*l up", H_thWASD_l_u, "On"
		Hotkey "LShift", "Off"
		Hotkey "LShift up", "Off"
		A_TrayMenu.Uncheck("3&")
		A_TrayMenu.Check("4&")
		A_TrayMenu.Uncheck("5&")
		A_TrayMenu.Uncheck("6&")
		CurrentKeyMap := 1
		TraySetIcon("icon.ico")
		SplashText("Default Remapper enabled!")
	}
}
th9P1(*) {
	global CurrentKeyMap
	if (CurrentKeyMap != 2){
		Hotkey "*w", H_th9P1_w, "On"
		Hotkey "*w up", H_th9P1_w_u, "On"
		Hotkey "*a", H_th9P1_a, "On"
		Hotkey "*a up", H_th9P1_a_u, "On"
		Hotkey "*s", H_th9P1_s, "On"
		Hotkey "*s up", H_th9P1_s_u, "On"
		Hotkey "*d", H_th9P1_d, "On"
		Hotkey "*d up", H_th9P1_d_u, "On"
		Hotkey "*j", H_th9P1_j, "On"
		Hotkey "*j up", H_th9P1_j_u, "On"
		Hotkey "*k", H_th9P1_k, "On"
		Hotkey "*k up", H_th9P1_k_u, "On"
		Hotkey "*l", "Off"
		Hotkey "*l up", "Off"
		Hotkey "LShift", "Off"
		Hotkey "LShift up", "Off"
		A_TrayMenu.Uncheck("3&")
		A_TrayMenu.Uncheck("4&")
		A_TrayMenu.Check("5&")
		A_TrayMenu.Uncheck("6&")
		CurrentKeyMap := 2
		TraySetIcon("icon.ico")
		SplashText("Touhou 9 Player 1 Remapper enabled!")
	}
}
th9P2(*) {
	global CurrentKeyMap
	if (CurrentKeyMap != 3){
		Hotkey "*w", H_th9P2_w, "On"
		Hotkey "*w up", H_th9P2_w_u, "On"
		Hotkey "*a", H_th9P2_a, "On"
		Hotkey "*a up", H_th9P2_a_u, "On"
		Hotkey "*s", H_th9P2_s, "On"
		Hotkey "*s up", H_th9P2_s_u, "On"
		Hotkey "*d", H_th9P2_d, "On"
		Hotkey "*d up", H_th9P2_d_u, "On"
		Hotkey "*j", H_th9P2_j, "On"
		Hotkey "*j up", H_th9P2_j_u, "On"
		Hotkey "*k", H_th9P2_k, "On"
		Hotkey "*k up", H_th9P2_k_u, "On"
		Hotkey "*l", "Off"
		Hotkey "*l up", "Off"
		Hotkey "LShift", H_th9P2_shift, "On"
		Hotkey "LShift up", H_th9P2_shift_u, "On"
		A_TrayMenu.Uncheck("3&")
		A_TrayMenu.Uncheck("4&")
		A_TrayMenu.Uncheck("5&")
		A_TrayMenu.Check("6&")
		CurrentKeyMap := 3
		TraySetIcon("icon.ico")
		SplashText("Touhou 9 Player 2 Remapper enabled!")
	}
}

; The remaps
H_thWASD_w(*) {
	SendInput "{Blind}{up DownTemp}"
}
H_thWASD_w_u(*) {
	SendInput "{Blind}{up up}"
}
H_thWASD_a(*) {
	SendInput "{Blind}{left DownTemp}"
}
H_thWASD_a_u(*) {
	SendInput "{Blind}{left up}"
}
H_thWASD_s(*) {
	SendInput "{Blind}{down DownTemp}"
}
H_thWASD_s_u(*) {
	SendInput "{Blind}{down up}"
}
H_thWASD_d(*) {
	SendInput "{Blind}{right DownTemp}"
}
H_thWASD_d_u(*) {
	SendInput "{Blind}{right up}"
}
H_thWASD_j(*) {
	SendInput "{Blind}{z DownTemp}"
}
H_thWASD_j_u(*) {
	SendInput "{Blind}{z up}"
}
H_thWASD_k(*) {
	SendInput "{Blind}{x DownTemp}"
}
H_thWASD_k_u(*) {
	SendInput "{Blind}{x up}"
}
H_thWASD_l(*) {
	SendInput "{Blind}{c DownTemp}"
}
H_thWASD_l_u(*) {
	SendInput "{Blind}{c up}"
}

H_th9P1_w(*) {
	SendInput "{Blind}{t DownTemp}"
}
H_th9P1_w_u(*) {
	SendInput "{Blind}{t up}"
}
H_th9P1_a(*) {
	SendInput "{Blind}{f DownTemp}"
}
H_th9P1_a_u(*) {
	SendInput "{Blind}{f up}"
}
H_th9P1_s(*) {
	SendInput "{Blind}{b DownTemp}"
}
H_th9P1_s_u(*) {
	SendInput "{Blind}{b up}"
}
H_th9P1_d(*) {
	SendInput "{Blind}{h DownTemp}"
}
H_th9P1_d_u(*) {
	SendInput "{Blind}{h up}"
}
H_th9P1_j(*) {
	SendInput "{Blind}{z DownTemp}"
}
H_th9P1_j_u(*) {
	SendInput "{Blind}{z up}"
}
H_th9P1_k(*) {
	SendInput "{Blind}{x DownTemp}"
}
H_th9P1_k_u(*) {
	SendInput "{Blind}{x up}"
}

H_th9P2_w(*) {
	SendInput "{Blind}{Numpad8 DownTemp}"
}
H_th9P2_w_u(*) {
	SendInput "{Blind}{Numpad8 up}"
}
H_th9P2_a(*) {
	SendInput "{Blind}{Numpad4 DownTemp}"
}
H_th9P2_a_u(*) {
	SendInput "{Blind}{Numpad4 up}"
}
H_th9P2_s(*) {
	SendInput "{Blind}{Numpad2 DownTemp}"
}
H_th9P2_s_u(*) {
	SendInput "{Blind}{Numpad2 up}"
}
H_th9P2_d(*) {
	SendInput "{Blind}{Numpad6 DownTemp}"
}
H_th9P2_d_u(*) {
	SendInput "{Blind}{Numpad6 up}"
}
H_th9P2_j(*) {
	SendInput "{Blind}{Down DownTemp}"
}
H_th9P2_j_u(*) {
	SendInput "{Blind}{Down up}"
}
H_th9P2_k(*) {
	SendInput "{Blind}{Right DownTemp}"
}
H_th9P2_k_u(*) {
	SendInput "{Blind}{Right up}"
}
H_th9P2_shift(*) {
	SendInput "{Blind}{Left DownTemp}"
}
H_th9P2_shift_u(*) {
	SendInput "{Blind}{Left up}"
}