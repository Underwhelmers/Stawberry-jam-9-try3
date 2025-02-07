The dialog supports for the next basic options:
	name: Change the name of the one speaking.
	image: Change the image of the one speaking, to the indicated sprite.
	text: Starts displaying that text on screen.
	option: When the text ends displaying, it shows the options.
		Choosing the option will run the indicated script, with the indicated parameters.
	script: This runs the given script with the given parameters after the text above ends.
	
For more experienced users there are the next options:
	gamestate: Set's and updates values for the dialog system to use later.
	start-nested-dialog: Allows to insert a dialog inside other dialog.
	stop-loading-options: This is for advance use only, it waits for a progress click before loading more.
	if: Allows to put conditions on the gamestate for running any action previously named.
(Examples and behaviour for this actions are bellow).

To use the dialog system you must ceate files with like this:
(Spaces can be placed at the start and end, but in the middle they count.)
"dialog> test1"  is the same as "dialog>test1" and the same as "  dialog >  test1   ".
but "dialog> test 1" is not the same as "dialog> test1".

======================== test_dialog.gdt ===============================
dialog> test1
name> Narrator
text> This will be displayed first. \n And the dialog will be assigned to the narrator.
text> Followed by this dialog.
text> Thirdly this dialog.
name> Instructor
image> spr_dialog_background
text> Now the instructor is talking. And there's an image for it.
option> What about options?.> start_dialog > test_dialog_followup
option> I understand.> dialog_close
========================================================================

====================== test_dialog_followup.gdt =============================
name> Other narrator
text> This is a second dialog.
text> The image dissapeared.
name> Instructor
image> spr_dialog_background
text> Now we are waiting you to continue.
script> dialog_close
========================================================================

Then to display the first dialog the run:
dialog_load_file("test_dialog.gdt");
start_dialog("test1");

Advanced uses explanation (gamestate):
The gamestate action will persist values even when the current dialog closes.

gamestate> count > quest 1 progress               // increase number in 1
gamestate> consume > quest 1 progress             // reduces number in 1
gamestate> tag true > quest 1 completed           // set boolean to true
gamestate> tag false > quest 1 in progress        // set boolean to false
gamestate> tag pending > npc 1 will give thanks   // set temporal to true
gamestate> set key > nickname > Allmighty         // set string value to a value
gamestate> set real > level > 4                   // set number value to a value

Types of gamestate:
Number: A number that starts in cero unless it is setted.

Boolean: true or false statements.

Temporal: true or false, that automatically sets itself to false after first true evaluation.

String: String gamestates are used as follows.
	In any part of the file you can add "@gs-some key;"
	Then you use "gamestate> set > some key > the one word value"
	It gets replaced BEFORE, parsing the line.
	So if you do:
gamestate> set> next dialog> following dialog
start-nested-dialog> @gs-next dialog;
	This will nest the dialog with key "following dialog" 
	And if you do:
gamestate> set> player nickname> Cricket
text> Hey @gs-player nickname;, you are late!
	Will display "Hey Clicket, you are late!"
