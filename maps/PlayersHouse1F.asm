	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FMeetMomScene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoopScene,    SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FMeetMomScene:
	sdefer MeetMomScript
	end

PlayersHouse1FNoopScene:
	end

MeetMomScript:
	applymovement PLAYER, PlayersHouseDownstairsMovement
	playmusic MUSIC_MOM
	turnobject PLAYERSHOUSE1F_MOM1, UP
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
	opentext
	writetext ElmsLookingForYouText
	promptbutton
	getstring STRING_BUFFER_4, PokegearName
	scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	yesorno
	iffalse .ExplainPhone
	sjump .KnowPhone

.KnowPhone:
	writetext KnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.ExplainPhone:
	writetext DontKnowTheInstructionsText
	promptbutton
	sjump .FinishPhone

.FinishPhone:
	writetext InstructionsNextText
	waitbutton
	closetext
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	special RestartMapMusic
	end

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

PlayersHouseDownstairsMovement:
	step DOWN
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	step_end

MomWalksBackMovement:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "O, <PLAYER>…! Nasz"
	line "sąsiad, PROF. ELM,"
	cont "cię szukał."

	para "Mówił, że chce,"
	line "żebyś zrobił coś"
	cont "dla niego."

	para "Oh! Prawie zapom-"
	line "niałam! Twój #-"

	para "GEAR wrócił z nap-"
	line "rawy!"

	para "Proszę bardzo!"
	done

MomGivesPokegearText:
	text "#MON GEAR, czy"
	line "po prostu #-"
	cont "GEAR."

	para "Jest niezbędny dla"
	line "dobrych trenerów."

	para "Oh, nie ustawi-"
	line "liśmy dnia tygod-"
	cont "nia."

	para "Nie możemy o tym"
	line "zapomnieć!"
	done

IsItDSTText:
	text "Czy to czas let-"
	line "ni?"
	done

ComeHomeForDSTText:
	text "Przyjdź do domu,"
	line "aby skompensować"
	
	para "za zmianę czasu"
	line "letniego."

	para "Przy okazji, wiesz"
	line "jak korzystać z"
	cont "TELEFONU?"
	done

KnowTheInstructionsText:
	text "Włączasz #GEAR"
	line "i wybierasz ikonę"
	cont "TELEFONU, nie?"
	done

DontKnowTheInstructionsText:
	text "Przeczytam"
	line "instrukcje."

	para "Włącz #GEAR i"
	line "wybierz ikonę"
	cont "TELEFONU."
	done

InstructionsNextText:
	text "Numery telefonu są"
	line "zapisywane w pa-"
	cont "mięci."

	para "Po prostu wybie-"
	line "rasz do kogo"
	cont "chcesz dzwonić."

	para "No, nie jest to"
	line "wygodne?"
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM na ciebie"
	line "czeka."

	para "Dawaj, synku!"
	done

SoWhatWasProfElmsErrandText:
	text "Więc, co chciał"
	line "PROF. ELM?"

	para "…"

	para "To nie brzmi pros-"
	line "to."

	para "Ale powinieneś się"
	line "cieszyć, że ludzie"
	cont "polegają na tobie."
	done

ImBehindYouText:
	text "<PLAYER>, dawaj!"

	para "Jestem za tobą"
	line "cały czas!"
	done

PlayersHouse1FStoveText:
	text "Specjalność mamy!"

	para "BURGER WULKANU"
	line "CINNABAR!"
	done

PlayersHouse1FSinkText:
	text "Zlew jest czysty."
	line "Mama go tak lubi."
	done

PlayersHouse1FFridgeText:
	text "Zobaczmy, co w"
	line "lodówce…"

	para "ŚWIEŻA WODA i"
	line "pyszna LEMONIADA!"
	done

PlayersHouse1FTVText:
	text "Na telewizorze gra"
	line "film: Chłopczyk"

	para "z odległej krainy"
	line "spóźnia się do la-"
	cont "boratorium…"

	para "Też się powinienem"
	line "śpieszyć!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
