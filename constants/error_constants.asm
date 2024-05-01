
; ERROR_CONSTANTS.ASM
; Definicje błędów.

; CORRUPTED_SAVE_FILE      BŁĄD 00
; Nie można odczytać zapisu!
; Plik zapisu został zniszczony.

; SAVE_FILE_NOT_FOUND      BŁĄD 01
; Nie znaleziono zapisu!
; Plik zapisu nie istnieje.
; Nie powinno być możliwe zobaczenie tego błędu bez modyfikowania kodu.

; ERROR_UNKNOWN1           BŁĄD 02
; Powód nieznany!
; Powód błędu jest nieznany.
; W tej sytuacji gra nie działa dalej.

; INVALID_TEXT_COMMAND     BŁĄD 03
; Nieprawidłowe polecenie!
; W trakcie wyświetlania tekstu napotkano się na nieprawidłowe polecenie tekstowe.
; W tej sytuacji tekst nie zostaje wyświetlany dalej.

; ERROR_UNKNOWN2           BŁĄD 04
; Powód nieznany!
; Duplikat ERROR_UNKNOWN1.
; W tej sytuacji gra nie działa dalej.

; ERROR_UNKNOWN3           BŁĄD 05
; Powód nieznany!
; Duplikat ERROR_UNKNOWN1.
; W tej sytuacji gra nie działa dalej.

; ERROR_UNKNOWN4           BŁĄD 06
; Powód nieznany!
; Duplikat ERROR_UNKNOWN1.
; W tej sytuacji gra nie działa dalej.

; ERROR_CRASH1             BŁĄD 07
; ??? ???
; Napotkano się na nieprawidłową instrukcję.
; W tej sytuacji gra nie działa dalej.

; ERROR_CRASH2             BŁĄD 08
; ??? ???
; Napotkano się na nieprawidłową instrukcję.
; W tej sytuacji gra nie działa dalej.

; ERROR_CRASH3             BŁĄD 09
; ??? ???
; Napotkano się na nieprawidłową instrukcję.
; W tej sytuacji gra nie działa dalej.

; ERROR_CRASH4             BŁĄD 0A
; ??? ???
; Napotkano się na nieprawidłową instrukcję.
; W tej sytuacji gra nie działa dalej.

; ERROR_CRASH5             BŁĄD 0B
; ??? ???
; W tej sytuacji gra nie działa dalej.

; NO_WINDOWS_TO_POP        BŁĄD 0C
; ??? ???
; W tej sytuacji gra nie działa dalej.
	
	const_def
	const CORRUPTED_SAVE_FILE                 ; 00
	const SAVE_FILE_NOT_FOUND                 ; 01
	const ERROR_UNKNOWN1                      ; 02
	const INVALID_TEXT_COMMAND                ; 03
	const ERROR_UNKNOWN2                      ; 04
	const ERROR_UNKNOWN3                      ; 05
	const ERROR_UNKNOWN4                      ; 06
	const ERROR_CRASH1                        ; 07
	const ERROR_CRASH2                        ; 08
	const ERROR_CRASH3                        ; 09
	const ERROR_CRASH4                        ; 0A
	const ERROR_CRASH5                        ; 0B
	const NO_WINDOWS_TO_POP                   ; 0C
	