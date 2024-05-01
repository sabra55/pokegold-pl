; EKRAN BŁĘDU
; Wyświetla błąd zawarty w wWhichError.

_ErrorScreen::
	call ClearScreen
	call LoadStandardFont
	call LoadFontsExtra
	hlcoord TEXTBOX_X, TEXTBOX_Y - 2
	ld b, TEXTBOX_INNERH + 2
	ld c, TEXTBOX_INNERW
	call Textbox
	call GetErrorString
	hlcoord TEXTBOX_X + 1, TEXTBOX_Y
	call PlaceString
	call WaitPressAorB_BlinkCursor
	jp DoAppropriateErrorAction
	
; Wybierz poprawny napis względem błędu.
GetErrorString:
	ld a, [wWhichError]
	ld c, a 
	ld b, 0
	ld hl, .stringTable
	add hl, bc
	add hl, bc ; dwa razy
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
	
.stringTable:
	dw .saveFileCorruptedText
	dw .saveFileNotFoundText
	dw .errorUnknown1
	dw .invalidTextCommand
	dw .errorUnknown2
	dw .errorUnknown3
	dw .errorUnknown4
	dw .errorCrash1
	dw .errorCrash2
	dw .errorCrash3
	dw .errorCrash4
	dw .errorCrash5
	dw .noWindowsToPop

.saveFileCorruptedText:
	db   "BŁĄD     NUMER  00"
	next "Nie można odczytać"
	next "zapisu!@"
	
.saveFileNotFoundText:
	db   "BŁĄD     NUMER  01"
	next "Zapis nie"
	next "istnieje!@"
	
.errorUnknown1:
	db   "BŁĄD     NUMER  02"
	next "Powód nieznany!@"
	
.invalidTextCommand:
	db   "BŁĄD     NUMER  03"
	next "Nieprawidłowe"
	next "polecenie!@"
	
.errorUnknown2:
	db   "BŁĄD     NUMER  04"
	next "Powód nieznany!@"

.errorUnknown3:
	db   "BŁĄD     NUMER  05"
	next "Powód nieznany!@"

.errorUnknown4:
	db   "BŁĄD     NUMER  06"
	next "Powód nieznany!@"

.errorCrash1:
	db   "BŁĄD     NUMER  07"
	next "???"
	next "???@"

.errorCrash2:
	db   "BŁĄD     NUMER  08"
	next "???"
	next "???@"

.errorCrash3:
	db   "BŁĄD     NUMER  09"
	next "???"
	next "???@"

.errorCrash4:
	db   "BŁĄD     NUMER  0A"
	next "???"
	next "???@"

.errorCrash5:
	db   "BŁĄD     NUMER  0B"
	next "???"
	next "???@"
	
.noWindowsToPop:
	db   "BŁĄD     NUMER  0C"
	next "???"
	next "???@"

; Zrób, co wymaga błąd.
DoAppropriateErrorAction:
	ld a, [wWhichError]
	
	; Nie robimy nic dla błędów 00 i 01.
	cp ERROR_UNKNOWN1
	ret c
	
	; Błąd 03 zatrzymuje wyświetlanie tekstu.
	; Jest to zrobione gdzie indziej, więc nic tu po nas.
	cp INVALID_TEXT_COMMAND
	ret z
	
	; Jeżeli doszliśmy tutaj, złapaliśmy typ błędu, który zaniechał grę.
	; Dlatego nie możemy dopuścić, aby kod wrócił skąd przyszedł.
.loop:
	halt
	jr .loop
	