indexing
	description: 
	
		"[
			SWT general constants.
			All event types have been prefixed by 'event_' ,
 			all key codes have been prefixed by 'key_', 
 			all MessageBox styles by 'messagebox_' and 
 			all styles by 'style_' and
 			all font style by 'font_' and
 			DEFAULT has been renamed DEFAULT_value.

			Note that some of the constants provided by this class represent optional, appearance related aspects 
			of widgets which are available either only on some window systems, or for a differing set of widgets on each window system. 
			These constants are marked as HINT. The set of widgets which support a particular HINT may change from release to release, 
			although we typically will not withdraw support for a HINT once it is made available.
		]"
		
	date: "$Date: 2006/03/07 17:10:10 $";
	revision: "$Revision: 1.7 $";
	
	version: "SWT 3.0"
	
	author: "Paul G. Crismer & Eric Fafchamps"
	licensing: "See notice at end of class"
	
class
	SWT_CONSTANTS
	
feature -- Accesss

	BITMAP : INTEGER is 0
		-- Constant indicating that an image or operation is of type bitmap (value is 0). 

	COLOR_BLACK : INTEGER is 2
		-- Default color black (value is 2). 

	COLOR_BLUE : INTEGER is 9
		-- Default color blue (value is 9). 

	COLOR_CYAN : INTEGER is 13
		-- Default color cyan (value is 13). 

	COLOR_DARK_BLUE : INTEGER is 10
		-- Default color dark blue (value is 10). 

	COLOR_DARK_CYAN : INTEGER is 14
		-- Default color dark cyan (value is 14). 

	COLOR_DARK_GRAY : INTEGER is 16
		-- Default color dark gray (value is 16). 

	COLOR_DARK_GREEN : INTEGER is 6
		-- Default color dark green (value is 6). 

	COLOR_DARK_MAGENTA : INTEGER is 12
		-- Default color dark magenta (value is 12). 

	COLOR_DARK_RED : INTEGER is 4
		-- Default color dark red (value is 4). 

	COLOR_DARK_YELLOW : INTEGER is 8
		-- Default color dark yello (value is 8). 

	COLOR_GRAY : INTEGER is 15
		-- Default color gray (value is 15). 

	COLOR_GREEN : INTEGER is 5
		-- Default color green (value is 5). 

	COLOR_INFO_BACKGROUND : INTEGER is 29
		-- System color used to paint tooltip background areas (value is 29). 

	COLOR_INFO_FOREGROUND : INTEGER is 28
		-- System color used to paint tooltip text (value is 28). 

	COLOR_LIST_BACKGROUND : INTEGER is 25
		-- System color used to paint list background areas (value is 25). 

	COLOR_LIST_FOREGROUND : INTEGER is 24
		-- System color used to paint list foreground areas (value is 24). 

	COLOR_LIST_SELECTION : INTEGER is 26
		-- System color used to paint list selection background areas (value is 26). 

	COLOR_LIST_SELECTION_TEXT : INTEGER is 27
		-- System color used to paint list selected text (value is 27). 

	COLOR_MAGENTA : INTEGER is 11
		-- Default color magenta (value is 11). 

	COLOR_RED : INTEGER is 3
		-- Default color red (value is 3). 

	COLOR_TITLE_BACKGROUND : INTEGER is 31
		-- System color used to paint title background areas (value is 31). 

	COLOR_TITLE_BACKGROUND_GRADIENT : INTEGER is 32
		-- System color used to paint title background gradient (value is 32). 

	COLOR_TITLE_FOREGROUND : INTEGER is 30
		-- System color used to paint title text (value is 30). 

	COLOR_TITLE_INACTIVE_BACKGROUND : INTEGER is 34
		-- System color used to paint inactive title background areas (value is 34). 

	COLOR_TITLE_INACTIVE_BACKGROUND_GRADIENT : INTEGER is 35
		-- System color used to paint inactive title background gradient (value is 35). 

	COLOR_TITLE_INACTIVE_FOREGROUND : INTEGER is 33
		-- System color used to paint inactive title text (value is 33). 

	COLOR_WHITE : INTEGER is 1
		-- Default color white (value is 1). 

	COLOR_WIDGET_BACKGROUND : INTEGER is 22
		-- System color used to paint background areas (value is 22). 

	COLOR_WIDGET_BORDER : INTEGER is 23
		-- System color used to paint border areas (value is 23). 

	COLOR_WIDGET_DARK_SHADOW : INTEGER is 17
		-- System color used to paint dark shadow areas (value is 17). 

	COLOR_WIDGET_FOREGROUND : INTEGER is 21
		-- System color used to paint foreground areas (value is 21). 

	COLOR_WIDGET_HIGHLIGHT_SHADOW : INTEGER is 20
		-- System color used to paint highlight shadow areas (value is 20). 

	COLOR_WIDGET_LIGHT_SHADOW : INTEGER is 19
		-- System color used to paint light shadow areas (value is 19). 

	COLOR_WIDGET_NORMAL_SHADOW : INTEGER is 18
		-- System color used to paint normal shadow areas (value is 18). 

	COLOR_YELLOW : INTEGER is 7
		-- Default color yellow (value is 7). 

	CURSOR_APPSTARTING : INTEGER is 3
		-- System app startup cursor (value is 3). 

	CURSOR_ARROW : INTEGER is 0
		-- System arrow cursor (value is 0). 

	CURSOR_CROSS : INTEGER is 2
		-- System cross hair cursor (value is 2). 

	CURSOR_HAND : INTEGER is 21
		-- System hand cursor (value is 21). 

	CURSOR_HELP : INTEGER is 4
		-- System help cursor (value is 4). 

	CURSOR_IBEAM : INTEGER is 19
		-- System i-beam cursor (value is 19). 

	CURSOR_NO : INTEGER is 20
		-- System "not allowed" cursor (value is 20). 

	CURSOR_SIZEALL : INTEGER is 5
		-- System resize all directions cursor (value is 5). 

	CURSOR_SIZEE : INTEGER is 12
		-- System resize east cursor (value is 12). 

	CURSOR_SIZEN : INTEGER is 10
		-- System resize north cursor (value is 10). 

	CURSOR_SIZENE : INTEGER is 14
		-- System resize north-east cursor (value is 14). 

	CURSOR_SIZENESW : INTEGER is 6
		-- System resize north-east-south-west cursor (value is 6). 

	CURSOR_SIZENS : INTEGER is 7
		-- System resize north-south cursor (value is 7). 

	CURSOR_SIZENW : INTEGER is 17
		-- System resize north-west cursor (value is 17). 

	CURSOR_SIZENWSE : INTEGER is 8
		-- System resize north-west-south-east cursor (value is 8). 

	CURSOR_SIZES : INTEGER is 11
		-- System resize south cursor (value is 11). 

	CURSOR_SIZESE : INTEGER is 15
		-- System resize south-east cursor (value is 15). 

	CURSOR_SIZESW : INTEGER is 16
		-- System resize south-west cursor (value is 16). 

	CURSOR_SIZEW : INTEGER is 13
		-- System resize west cursor (value is 13). 

	CURSOR_SIZEWE : INTEGER is 9
		-- System resize west-east cursor (value is 9). 

	CURSOR_UPARROW : INTEGER is 18
		-- System up arrow cursor (value is 18). 

	CURSOR_WAIT : INTEGER is 1
		-- System wait cursor (value is 1). 

	DEFAULT_value : INTEGER is -1
		-- Indicates that a default should be used (value is -1). 

	DIALOG_TRIM : INTEGER is 2144
		-- Trim style convenience constant for the most common dialog shell appearance (value is CLOSE|TITLE|BORDER).  

	DM_FILL_BACKGROUND : INTEGER is 2
		-- GIF image disposal method constants indicating that the the previous images should be covered with the background color before displaying the next image (value is 2). 

	DM_FILL_NONE : INTEGER is 1
		-- GIF image disposal method constants indicating that the disposal method is to do nothing; that is, to leave the previous image in place (value is 1). 

	DM_FILL_PREVIOUS : INTEGER is 3
		-- GIF image disposal method constants indicating that the disposal method is to restore the previous picture (value is 3). 

	DM_UNSPECIFIED : INTEGER is 0
		-- GIF image disposal method constants indicating that the disposal method is unspecified (value is 0). 

	DRAG : INTEGER is 1
		-- Indicates that a user-interface component is being dragged, for example dragging the thumb of a scroll bar (value is 1). 

	DRAW_DELIMITER : INTEGER is 2
		-- Draw constant indicating whether the string drawing operation should handle line-delimeters (value is 1<<1). 

	DRAW_MNEMONIC : INTEGER is 8
		-- Draw constant indicating whether the string drawing operation should handle mnemonics (value is 1<<3). 

	DRAW_TAB : INTEGER is 4
		-- Draw constant indicating whether the string drawing operation should expand TAB characters (value is 1<<2). 

	DRAW_TRANSPARENT : INTEGER is 1
		-- Draw constant indicating whether the drawing operation should fill the background (value is 1<<0). 

	ERROR_CANNOT_BE_ZERO : INTEGER is 7
		-- SWT error constant indicating that a value which can not be zero was found to be (value is 7). 

	ERROR_CANNOT_GET_COUNT : INTEGER is 36
		-- SWT error constant indicating that the underlying operating system was unable to provide count information (value is 36). 

	ERROR_CANNOT_GET_ENABLED : INTEGER is 31
		-- SWT error constant indicating that the underlying operating system was unable to provide enabled/disabled state information (value is 31). 

	ERROR_CANNOT_GET_ITEM : INTEGER is 8
		-- SWT error constant indicating that the underlying operating system was unable to provide the value of an item (value is 8). 

	ERROR_CANNOT_GET_ITEM_HEIGHT : INTEGER is 11
		-- SWT error constant indicating that the underlying operating system was unable to provide the height of an item (value is 11). 

	ERROR_CANNOT_GET_SELECTION : INTEGER is 9
		-- SWT error constant indicating that the underlying operating system was unable to provide the selection (value is 9). 

	ERROR_CANNOT_GET_TEXT : INTEGER is 12
		-- SWT error constant indicating that the underlying operating system was unable to provide the text of a widget (value is 12). 

	ERROR_CANNOT_SET_ENABLED : INTEGER is 30
		-- SWT error constant indicating that the underlying operating system was unable to set the enabled state (value is 30). 

	ERROR_CANNOT_SET_MENU : INTEGER is 29
		-- SWT error constant indicating that the underlying operating system was unable to set the menu (value is 29). 

	ERROR_CANNOT_SET_SELECTION : INTEGER is 28
		-- SWT error constant indicating that the underlying operating system was unable to set the selection of a widget (value is 28). 

	ERROR_CANNOT_SET_TEXT : INTEGER is 13
		-- SWT error constant indicating that the underlying operating system was unable to set the text of a widget (value is 13). 

	ERROR_DEVICE_DISPOSED : INTEGER is 45
		-- SWT error constant indicating that an attempt was made to invoke an SWT operation using a device which had already been disposed (value is 45). 

	ERROR_FAILED_EXEC : INTEGER is 46
		-- SWT error constant indicating that an exception happened when executing a runnable (value is 46). 

	ERROR_FAILED_LOAD_LIBRARY : INTEGER is 47
		-- SWT error constant indicating that an unsatisfied link error occured while attempting to load a library (value is 47). 

	ERROR_GRAPHIC_DISPOSED : INTEGER is 44
		-- SWT error constant indicating that an attempt was made to invoke an SWT operation using a graphics object which had already been disposed (value is 44). 

	ERROR_INVALID_ARGUMENT : INTEGER is 5
		-- SWT error constant indicating that an invalid argument was passed in (value is 5). 

	ERROR_INVALID_IMAGE : INTEGER is 40
		-- SWT error constant indicating that a graphics operation was attempted with an image having an invalid format (value is 40). 

	ERROR_INVALID_PARENT : INTEGER is 32
		-- SWT error constant indicating that a provided widget can not be used as a parent in the current operation (value is 32). 

	ERROR_INVALID_RANGE : INTEGER is 6
		-- SWT error constant indicating that a value was found to be outside the allowable range (value is 6). 

	ERROR_INVALID_SUBCLASS : INTEGER is 43
		-- SWT error constant indicating that an attempt was made to subclass an SWT widget class without implementing the checkSubclass() method (value is 43).  

	ERROR_IO : INTEGER is 39
		-- SWT error constant indicating that an input/output operation failed during the execution of an SWT operation (value is 39). 

	ERROR_ITEM_NOT_ADDED : INTEGER is 14
		-- SWT error constant indicating that the underlying operating system was unable to add an item (value is 14). 

	ERROR_ITEM_NOT_REMOVED : INTEGER is 15
		-- SWT error constant indicating that the underlying operating system was unable to remove an item (value is 15). 

	ERROR_MENUITEM_NOT_CASCADE : INTEGER is 27
		-- SWT error constant indicating that a menu item which needed to have the cascade style had some other style instead (value is 27). 

	ERROR_MENU_NOT_BAR : INTEGER is 33
		-- SWT error constant indicating that a menu which needed to have the menu bar style had some other style instead (value is 33). 

	ERROR_MENU_NOT_DROP_DOWN : INTEGER is 21
		-- SWT error constant indicating that a menu which needed to have the drop down style had some other style instead (value is 21). 

	ERROR_MENU_NOT_POP_UP : INTEGER is 37
		-- SWT error constant indicating that a menu which needed to have the pop up menu style had some other style instead (value is 37). 

	ERROR_NOT_IMPLEMENTED : INTEGER is 20
		-- SWT error constant indicating that a particular feature has not been implemented on this platform (value is 20). 

	ERROR_NO_HANDLES : INTEGER is 2
		-- SWT error constant indicating that no more handles for an operating system resource are available (value is 2). 

	ERROR_NO_MORE_CALLBACKS : INTEGER is 3
		-- SWT error constant indicating that no more callback resources are available (value is 3). 

	ERROR_NULL_ARGUMENT : INTEGER is 4
		-- SWT error constant indicating that a null argument was passed in (value is 4). 

	ERROR_THREAD_INVALID_ACCESS : INTEGER is 22
		-- SWT error constant indicating that an attempt was made to invoke an SWT operation which can only be executed by the user-interface thread from some other thread (value is 22). 

	ERROR_UNSPECIFIED : INTEGER is 1
		-- SWT error constant indicating that no error number was specified (value is 1). 

	ERROR_UNSUPPORTED_DEPTH : INTEGER is 38
		-- SWT error constant indicating that a graphics operation was attempted with an image of an unsupported depth (value is 38). 

	ERROR_UNSUPPORTED_FORMAT : INTEGER is 42
		-- SWT error constant indicating that a graphics operation was attempted with an image having a valid but unsupported format (value is 42). 

	ERROR_WIDGET_DISPOSED : INTEGER is 24
		-- SWT error constant indicating that an attempt was made to invoke an SWT operation using a widget which had already been disposed (value is 24). 

	ICON : INTEGER is 1
		-- Constant indicating that an image or operation is of type icon (value is 1). 

	IMAGE_BMP : INTEGER is 0
		-- Image format constant indicating a Windows BMP format image (value is 0). 

	IMAGE_BMP_RLE : INTEGER is 1
		-- Image format constant indicating a run-length encoded Windows BMP format image (value is 1). 

	IMAGE_COPY : INTEGER is 0
		-- The Image constructor argument indicating that the new image should be a copy of the image provided as an argument (value is 0). 

	IMAGE_DISABLE : INTEGER is 1
		-- The Image constructor argument indicating that the new image should have the appearance of a "disabled" (using the platform's rules for how this should look) copy of the image provided as an argument (value is 1). 

	IMAGE_GIF : INTEGER is 2
		-- Image format constant indicating a GIF format image (value is 2). 

	IMAGE_GRAY : INTEGER is 2
		-- The Image constructor argument indicating that the new image should have the appearance of a "gray scaled" copy of the image provided as an argument (value is 2). 

	IMAGE_ICO : INTEGER is 3
		-- Image format constant indicating a ICO format image (value is 3). 

	IMAGE_JPEG : INTEGER is 4
		-- Image format constant indicating a JPEG format image (value is 4). 

	IMAGE_PNG : INTEGER is 5
		-- Image format constant indicating a PNG format image (value is 5). 

	IMAGE_TIFF : INTEGER is 6
		-- Image format constant indicating a TIFF format image (value is 6). 

	IMAGE_UNDEFINED : INTEGER is -1
		-- Image format constant indicating an unknown image type (value is -1). 

	accelerator_KEYCODE_BIT : INTEGER is 16777216
		-- Accelerator constant used to differentiate a key code from a unicode character.  

	accelerator_KEY_MASK : INTEGER is 16842751
		-- Accelerator constant used to extract the key stroke portion of an accelerator.  

	LINE_DASH : INTEGER is 2
		-- Line drawing style for dashed lines (value is 2). 

	LINE_DASHDOT : INTEGER is 4
		-- Line drawing style for alternating dash-dot lines (value is 4). 

	LINE_DASHDOTDOT : INTEGER is 5
		-- Line drawing style for dash-dot-dot lines (value is 5). 

	LINE_DOT : INTEGER is 3
		-- Line drawing style for dotted lines (value is 3). 

	LINE_SOLID : INTEGER is 1
		-- Line drawing style for solid lines (value is 1). 

	MOVEMENT_CHAR : INTEGER is 1
		-- The character movement type (value is 1<<0). 

	MOVEMENT_CLUSTER : INTEGER is 2
		-- The cluster movement type (value is 1<<1). 

	MOVEMENT_WORD : INTEGER is 4
		-- The word movement type (value is 1<<2). 

	SHELL_TRIM : INTEGER is 1264
		-- Trim style convenience constant for the most common top level shell appearance (value is CLOSE|TITLE|MIN|MAX|RESIZE).  

	TRANSPARENCY_ALPHA : INTEGER is 1
		-- Image transparency constant indicating that the image contains alpha transparency information (value is 1<<0). 

	TRANSPARENCY_MASK : INTEGER is 2
		-- Image transparency constant indicating that the image contains a transparency mask (value is 1<<1). 

	TRANSPARENCY_NONE : INTEGER is 0
		-- Image transparency constant indicating that the image contains no transparency information (value is 0). 

	TRANSPARENCY_PIXEL : INTEGER is 4
		-- Image transparency constant indicating that the image contains a transparent pixel (value is 1<<2). 

	TRAVERSE_ARROW_NEXT : INTEGER is 64
		-- Traversal event detail field value indicating that the key which designates that focus should be given to the previous tab item was pressed; typically, this is either the RIGHT-ARROW or DOWN-ARROW keys (value is 1<<6). 

	TRAVERSE_ARROW_PREVIOUS : INTEGER is 32
		-- Traversal event detail field value indicating that the key which designates that focus should be given to the previous tab item was pressed; typically, this is either the LEFT-ARROW or UP-ARROW keys (value is 1<<5). 

	TRAVERSE_ESCAPE : INTEGER is 2
		-- Traversal event detail field value indicating that the key which designates that a dialog should be cancelled was pressed; typically, this is the ESC key (value is 1<<1). 

	TRAVERSE_MNEMONIC : INTEGER is 128
		-- Traversal event detail field value indicating that a mnemonic key sequence was pressed (value is 1<<7). 

	TRAVERSE_NONE : INTEGER is 0
		-- Traversal event detail field value indicating that no traversal action should be taken (value is 0). 

	TRAVERSE_PAGE_NEXT : INTEGER is 512
		-- Traversal event detail field value indicating that the key which designates that the next page of a multi-page window should be shown was pressed; typically, this is the CTRL-PAGEDOWN key sequence (value is 1<<9). 

	TRAVERSE_PAGE_PREVIOUS : INTEGER is 256
		-- Traversal event detail field value indicating that the key which designates that the previous page of a multi-page window should be shown was pressed; typically, this is the CTRL-PAGEUP key sequence (value is 1<<8). 

	TRAVERSE_RETURN : INTEGER is 4
		-- Traversal event detail field value indicating that the key which activates the default button in a dialog was pressed; typically, this is the ENTER key (value is 1<<2). 

	TRAVERSE_TAB_NEXT : INTEGER is 16
		-- Traversal event detail field value indicating that the key which designates that focus should be given to the next tab group was pressed; typically, this is the TAB key (value is 1<<4). 

	TRAVERSE_TAB_PREVIOUS : INTEGER is 8
		-- Traversal event detail field value indicating that the key which designates that focus should be given to the previous tab group was pressed; typically, this is the SHIFT-TAB key sequence (value is 1<<3). 

	character_BS : CHARACTER is '%/8/'
		-- ASCII character convenience constant for the backspace character (value is the char '\b'). 

	character_CR : CHARACTER is '%/13/'
		-- ASCII character convenience constant for the carriage return character (value is the char '\r'). 

	character_DEL : CHARACTER is '%/127/'
		-- ASCII character convenience constant for the delete character (value is the char with value 127). 

	character_ESC : CHARACTER is '%/27/'
		-- ASCII character convenience constant for the escape character (value is the char with value 27). 

	character_LF : CHARACTER is '%/10/'
		-- ASCII character convenience constant for the line feed character (value is the char '\n'). 

	character_TAB : CHARACTER is '%/9/'
		-- ASCII character convenience constant for the tab character (value is the char '\t'). 

	constant_NONE : INTEGER is 0
		-- A constant known to be zero (0), used in operations which take bit flags to indicate that "no bits are set". 

	constant_NULL : INTEGER is 0
		-- A constant known to be zero (0), used in operations which take pointers to indicate a null argument. 

	constant_None : INTEGER is 0
		-- A constant known to be zero (0), used in operations which take bit flags to indicate that "no bits are set". 

	event_Activate : INTEGER is 26
		-- The activate event type (value is 26). 

	event_Arm : INTEGER is 30
		-- The arm event type (value is 30). 

	event_Collapse : INTEGER is 18
		-- The collapse event type (value is 18). 

	event_Deactivate : INTEGER is 27
		-- The deactivate event type (value is 27). 

	event_Default_selection : INTEGER is 14
		-- The default selection event type (value is 14). 

	event_Deiconify : INTEGER is 20
		-- The de-iconify event type (value is 20). 

	event_Dispose : INTEGER is 12
		-- The dispose event type (value is 12). 

	event_Drag_detect : INTEGER is 29
		-- The drag detect event type (value is 29). 

	event_Expand : INTEGER is 17
		-- The expand event type (value is 17). 

	event_Focus_in : INTEGER is 15
		-- The focus in event type (value is 15). 

	event_Focus_out : INTEGER is 16
		-- The focus out event type (value is 16). 

	event_Hard_key_down : INTEGER is 33
		-- The hardware key down event type (value is 33). 

	event_Hard_key_up : INTEGER is 34
		-- The hardware key up event type (value is 34). 

	event_Hide : INTEGER is 23
		-- The hide event type (value is 23). 

	event_Iconify : INTEGER is 19
		-- The iconify event type (value is 19). 

	event_Key_down : INTEGER is 1
		-- The key down event type (value is 1). 

	event_Key_up : INTEGER is 2
		-- The key up event type (value is 2). 

	event_Menu_detect : INTEGER is 35
		-- The menu detect event type (value is 35). 

	event_Modify : INTEGER is 24
		-- The modify event type (value is 24). 

	event_Mouse_double_click : INTEGER is 8
		-- The mouse double click event type (value is 8). 

	event_Mouse_down : INTEGER is 3
		-- mouse down event type (value is 3) 

	event_Mouse_enter : INTEGER is 6
		-- The mouse enter event type (value is 6). 

	event_Mouse_exit : INTEGER is 7
		-- The mouse exit event type (value is 7). 

	event_Mouse_hover : INTEGER is 32
		-- The mouse hover event type (value is 32). 

	event_Mouse_move : INTEGER is 5
		-- The mouse move event type (value is 5). 

	event_Mouse_up : INTEGER is 4
		-- The mouse up event type (value is 4). 

	event_Move : INTEGER is 10
		-- The move event type (value is 10). 

	event_Paint : INTEGER is 9
		-- The paint event type (value is 9). 

	event_Selection : INTEGER is 13
		-- The selection event type (value is 13). 

	event_Set_data : INTEGER is 36
		-- The set data event type (value is 36). 

	event_Show : INTEGER is 22
		-- The show event type (value is 22). 

	event_Traverse : INTEGER is 31
		-- The traverse event type (value is 31). 

	event_Verify : INTEGER is 25
		-- The verify event type (value is 25). 

	file_file_OPEN : INTEGER is 4096
		-- The FileDialog style constant for open file dialog behavior (value is 1<<12). 

	file_file_SAVE : INTEGER is 8192
		-- The FileDialog style constant for save file dialog behavior (value is 1<<13). 

	font_BOLD : INTEGER is 1
		-- The font style constant indicating a bold weight font (value is 1<<0). 

	font_ITALIC : INTEGER is 2
		-- The font style constant indicating an italic font (value is 1<<1). 

	font_NORMAL : INTEGER is 0
		-- The font style constant indicating a normal weight, non-italic font (value is 0). 

	ime_ALPHA : INTEGER is 4
		-- Input Method Editor style constant for alpha input behavior (value is 1<<2). 

	ime_DBCS : INTEGER is 2
		-- Input Method Editor style constant for double byte input behavior (value is 1<<1). 

	ime_NATIVE : INTEGER is 8
		-- Input Method Editor style constant for native input behavior (value is 1<<3). 

	ime_PHONETIC : INTEGER is 16
		-- Input Method Editor style constant for phonetic input behavior (value is 1<<4). 

	ime_ROMAN : INTEGER is 32
		-- Input Method Editor style constant for romanicized input behavior (value is 1<<5). 

	key_ALT : INTEGER is 65536
		-- keyboard and/or mouse event mask indicating that the ALT key was pushed on the keyboard when the event was generated (value is 1<<16). 

	key_ARROW_DOWN : INTEGER is 16777218
		-- Keyboard event constant representing the DOWN ARROW key (value is (1<<24)+2). 

	key_ARROW_LEFT : INTEGER is 16777219
		-- Keyboard event constant representing the LEFT ARROW key (value is (1<<24)+3). 

	key_ARROW_RIGHT : INTEGER is 16777220
		-- Keyboard event constant representing the RIGHT ARROW key (value is (1<<24)+4). 

	key_ARROW_UP : INTEGER is 16777217
		-- Keyboard event constant representing the UP ARROW key (value is (1<<24)+1). 

	key_BREAK : INTEGER is 16777302
		-- Keyboard event constant representing the break key (value is (1<<24)+86). 

	key_BUTTON1 : INTEGER is 524288
		-- Keyboard and/or mouse event mask indicating that mouse button one was pushed when the event was generated.  

	key_BUTTON2 : INTEGER is 1048576
		-- Keyboard and/or mouse event mask indicating that mouse button two was pushed when the event was generated.  

	key_BUTTON3 : INTEGER is 2097152
		-- Keyboard and/or mouse event mask indicating that mouse button three was pushed when the event was generated.  

	key_CAPS_LOCK : INTEGER is 16777298
		-- Keyboard event constant representing the caps lock key (value is (1<<24)+82). 

	key_COMMAND : INTEGER is 4194304
		-- Keyboard and/or mouse event mask indicating that the COMMAND key was pushed on the keyboard when the event was generated (value is 1<<22). 

	key_CONTROL : INTEGER is 262144
		-- Keyboard and/or mouse event mask indicating that the CTRL key was pushed on the keyboard when the event was generated.  

	key_CTRL : INTEGER is 262144
		-- Keyboard and/or mouse event mask indicating that the CTRL key was pushed on the keyboard when the event was generated (value is 1<<18). 

	key_END : INTEGER is 16777224
		-- Keyboard event constant representing the END key (value is (1<<24)+8). 

	key_F1 : INTEGER is 16777226
		-- Keyboard event constant representing the F1 key (value is (1<<24)+10). 

	key_F10 : INTEGER is 16777235
		-- Keyboard event constant representing the F10 key (value is (1<<24)+19). 

	key_F11 : INTEGER is 16777236
		-- Keyboard event constant representing the F11 key (value is (1<<24)+20). 

	key_F12 : INTEGER is 16777237
		-- Keyboard event constant representing the F12 key (value is (1<<24)+21). 

	key_F13 : INTEGER is 16777238
		-- Keyboard event constant representing the F13 key (value is (1<<24)+22). 

	key_F14 : INTEGER is 16777239
		-- Keyboard event constant representing the F14 key (value is (1<<24)+23). 

	key_F15 : INTEGER is 16777240
		-- Keyboard event constant representing the F15 key (value is (1<<24)+24). 

	key_F2 : INTEGER is 16777227
		-- Keyboard event constant representing the F2 key (value is (1<<24)+11). 

	key_F3 : INTEGER is 16777228
		-- Keyboard event constant representing the F3 key (value is (1<<24)+12). 

	key_F4 : INTEGER is 16777229
		-- Keyboard event constant representing the F4 key (value is (1<<24)+13). 

	key_F5 : INTEGER is 16777230
		-- Keyboard event constant representing the F5 key (value is (1<<24)+14). 

	key_F6 : INTEGER is 16777231
		-- Keyboard event constant representing the F6 key (value is (1<<24)+15). 

	key_F7 : INTEGER is 16777232
		-- Keyboard event constant representing the F7 key (value is (1<<24)+16). 

	key_F8 : INTEGER is 16777233
		-- Keyboard event constant representing the F8 key (value is (1<<24)+17). 

	key_F9 : INTEGER is 16777234
		-- Keyboard event constant representing the F9 key (value is (1<<24)+18). 

	key_HELP : INTEGER is 16777297
		-- Keyboard event constant representing the help key (value is (1<<24)+81).  

	key_HOME : INTEGER is 16777223
		-- Keyboard event constant representing the HOME key (value is (1<<24)+7). 

	key_Help : INTEGER is 28
		-- Keyboard event constant representing the help key (value is (1<<24)+81).  

	key_INSERT : INTEGER is 16777225
		-- Keyboard event constant representing the INSERT key (value is (1<<24)+9). 

	key_KEYPAD_0 : INTEGER is 16777264
		-- Keyboard event constant representing the numeric key pad zero key (value is (1<<24)+48). 

	key_KEYPAD_1 : INTEGER is 16777265
		-- Keyboard event constant representing the numeric key pad one key (value is (1<<24)+49). 

	key_KEYPAD_2 : INTEGER is 16777266
		-- Keyboard event constant representing the numeric key pad two key (value is (1<<24)+50). 

	key_KEYPAD_3 : INTEGER is 16777267
		-- Keyboard event constant representing the numeric key pad three key (value is (1<<24)+51). 

	key_KEYPAD_4 : INTEGER is 16777268
		-- Keyboard event constant representing the numeric key pad four key (value is (1<<24)+52). 

	key_KEYPAD_5 : INTEGER is 16777269
		-- Keyboard event constant representing the numeric key pad five key (value is (1<<24)+53). 

	key_KEYPAD_6 : INTEGER is 16777270
		-- Keyboard event constant representing the numeric key pad six key (value is (1<<24)+54). 

	key_KEYPAD_7 : INTEGER is 16777271
		-- Keyboard event constant representing the numeric key pad seven key (value is (1<<24)+55). 

	key_KEYPAD_8 : INTEGER is 16777272
		-- Keyboard event constant representing the numeric key pad eight key (value is (1<<24)+56). 

	key_KEYPAD_9 : INTEGER is 16777273
		-- Keyboard event constant representing the numeric key pad nine key (value is (1<<24)+57). 

	key_KEYPAD_ADD : INTEGER is 16777259
		-- Keyboard event constant representing the numeric key pad add key (value is (1<<24)+43). 

	key_KEYPAD_CR : INTEGER is 16777296
		-- Keyboard event constant representing the numeric key pad enter key (value is (1<<24)+80). 

	key_KEYPAD_DECIMAL : INTEGER is 16777262
		-- Keyboard event constant representing the numeric key pad decimal key (value is (1<<24)+46). 

	key_KEYPAD_DIVIDE : INTEGER is 16777263
		-- Keyboard event constant representing the numeric key pad divide key (value is (1<<24)+47). 

	key_KEYPAD_EQUAL : INTEGER is 16777277
		-- Keyboard event constant representing the numeric key pad equal key (value is (1<<24)+61). 

	key_KEYPAD_MULTIPLY : INTEGER is 16777258
		-- Keyboard event constant representing the numeric key pad multiply key (value is (1<<24)+42). 

	key_KEYPAD_SUBTRACT : INTEGER is 16777261
		-- Keyboard event constant representing the numeric key pad subtract key (value is (1<<24)+45). 

	key_NUM_LOCK : INTEGER is 16777299
		-- Keyboard event constant representing the num lock key (value is (1<<24)+83). 

	key_PAGE_DOWN : INTEGER is 16777222
		-- Keyboard event constant representing the PAGE DOWN key (value is (1<<24)+6). 

	key_PAGE_UP : INTEGER is 16777221
		-- Keyboard event constant representing the PAGE UP key (value is (1<<24)+5). 

	key_PAUSE : INTEGER is 16777301
		-- Keyboard event constant representing the pause key (value is (1<<24)+85). 

	key_PRINT_SCREEN : INTEGER is 16777303
		-- Keyboard event constant representing the break key (value is (1<<24)+87). 

	key_SCROLL_LOCK : INTEGER is 16777300
		-- Keyboard event constant representing the scroll lock key (value is (1<<24)+84). 

	key_SHIFT : INTEGER is 131072
		-- Keyboard and/or mouse event mask indicating that the SHIFT key was pushed on the keyboard when the event was generated (value is 1<<17). 

	messagebox_ABORT : INTEGER is 512
		-- The MessageBox style constant for an ABORT button; the only valid combination is ABORT|RETRY|IGNORE (value is 1<<9). 

	messagebox_CANCEL : INTEGER is 256
		-- The MessageBox style constant for a CANCEL button; valid combinations are OK|CANCEL, YES|NO|CANCEL, RETRY|CANCEL (value is 1<<8). 

	messagebox_ICON_ERROR : INTEGER is 1
		-- The MessageBox style constant for error icon behavior (value is 1). 

	messagebox_ICON_INFORMATION : INTEGER is 2
		-- The MessageBox style constant for information icon behavior (value is 1<<1). 

	messagebox_ICON_QUESTION : INTEGER is 4
		-- The MessageBox style constant for question icon behavior (value is 1<<2). 

	messagebox_ICON_WARNING : INTEGER is 8
		-- The MessageBox style constant for warning icon behavior (value is 1<<3). 

	messagebox_ICON_WORKING : INTEGER is 16
		-- The MessageBox style constant for "working" icon behavior (value is 1<<4). 

	messagebox_IGNORE : INTEGER is 2048
		-- The MessageBox style constant for an IGNORE button; the only valid combination is ABORT|RETRY|IGNORE (value is 1<<11). 

	messagebox_NO : INTEGER is 128
		-- The MessageBox style constant for NO button; valid combinations are YES|NO, YES|NO|CANCEL (value is 1<<7). 

	messagebox_OK : INTEGER is 32
		-- The MessageBox style constant for an OK button; valid combinations are OK, OK|CANCEL (value is 1<<5). 

	messagebox_RETRY : INTEGER is 1024
		-- The MessageBox style constant for a RETRY button; valid combinations are ABORT|RETRY|IGNORE, RETRY|CANCEL (value is 1<<10). 

	messagebox_YES : INTEGER is 64
		-- The MessageBox style constant for YES button; valid combinations are YES|NO, YES|NO|CANCEL (value is 1<<6). 

	style_APPLICATION_MODAL : INTEGER is 65536
		-- Style constant for application modal behavior (value is 1<<16).  

	style_ARROW : INTEGER is 4
		-- Style constant for arrow button behavior (value is 1<<2).  

	style_BAR : INTEGER is 2
		-- Style constant for menu bar behavior (value is 1<<1).  

	style_BEGINNING : INTEGER is 1
		-- Style constant for vertical alignment or orientation behavior (value is 1).  

	style_BORDER : INTEGER is 2048
		-- Style constant for bordered behavior (value is 1<<11).  

	style_BOTTOM : INTEGER is 1024
		-- Style constant for align bottom behavior (value is 1<<10, since align DOWN and align BOTTOM are considered the same).  

	style_CASCADE : INTEGER is 64
		-- Style constant for cascade behavior (value is 1<<6).  

	style_CENTER : INTEGER is 16777216
		-- Style constant for align center behavior (value is 1<<24).  

	style_CHECK : INTEGER is 32
		-- Style constant for check box behavior (value is 1<<5).  

	style_CLIP_CHILDREN : INTEGER is 4096
		-- Style constant indicating that the window manager should clip a widget's children with respect to its viewable area.  

	style_CLIP_SIBLINGS : INTEGER is 8192
		-- Style constant indicating that the window manager should clip a widget's siblings with respect to its viewable area.  

	style_CLOSE : INTEGER is 64
		-- Style constant for close box trim (value is 1<<6, since we do not distinguish between CLOSE style and MENU style).  

	style_Close : INTEGER is 21
		-- Style constant for close box trim (value is 1<<6, since we do not distinguish between CLOSE style and MENU style).  

	style_DOWN : INTEGER is 1024
		-- Style constant for align down behavior (value is 1<<10, since align DOWN and align BOTTOM are considered the same).  

	style_DROP_DOWN : INTEGER is 4
		-- Style constant for drop down menu/list behavior (value is 1<<2).  

	style_EMBEDDED : INTEGER is 16777216
		-- Style constant to allow embedding (value is 1<<24).  

	style_FILL : INTEGER is 4
		-- Style constant for vertical alignment or orientation behavior (value is 4).  

	style_FLAT : INTEGER is 8388608
		-- Style constant for flat appearance.  

	style_FULL_SELECTION : INTEGER is 65536
		-- Style constant for full row selection behavior.  

	style_HIDE_SELECTION : INTEGER is 32768
		-- Style constant for selection hiding behavior when the widget loses focus (value is 1<<15).  

	style_HORIZONTAL : INTEGER is 256
		-- Style constant for horizontal alignment or orientation behavior (value is 1<<8).  

	style_H_SCROLL : INTEGER is 256
		-- Style constant for horizontal scrollbar behavior (value is 1<<8).  

	style_INDETERMINATE : INTEGER is 2
		-- Style constant for progress bar behavior (value is 1<<1).  

	style_LEAD : INTEGER is 16384
		-- Style constant for leading alignment (value is 1<<14).  

	style_LEFT : INTEGER is 16384
		-- Style constant for align left behavior (value is 1<<14).  

	style_LEFT_TO_RIGHT : INTEGER is 33554432
		-- Style constant for left to right orientation (value is 1<<25).  

	style_MAX : INTEGER is 1024
		-- Style constant for maximize box trim (value is 1<<10).  

	style_MENU : INTEGER is 64
		-- Style constant for shell menu trim (value is 1<<6, since we do not distinguish between CLOSE style and MENU style).  

	style_MIN : INTEGER is 128
		-- Style constant for minimize box trim (value is 1<<7).  

	style_MIRRORED : INTEGER is 134217728
		-- Style constant to indicate coordinate mirroring (value is 1<<27).  

	style_MODELESS : INTEGER is 0
		-- Style constant for modeless behavior (value is 0).  

	style_MULTI : INTEGER is 2
		-- Style constant for multi-selection behavior in lists and multiple line support on text fields (value is 1<<1).  

	style_NO_BACKGROUND : INTEGER is 262144
		-- Style constant for no background behavior (value is 1<<18).  

	style_NO_FOCUS : INTEGER is 524288
		-- Style constant for does not take focus behavior (value is 1<<19).  

	style_NO_MERGE_PAINTS : INTEGER is 2097152
		-- Style constant for no paint event merging behavior (value is 1<<21).  

	style_NO_RADIO_GROUP : INTEGER is 4194304
		-- Style constant for preventing child radio group behavior (value is 1<<22).  

	style_NO_REDRAW_RESIZE : INTEGER is 1048576
		-- Style constant for no redraw on resize behavior (value is 1<<20).  

	style_NO_TRIM : INTEGER is 8
		-- Style constant to ensure no trimmings are used (value is 1<<3).  

	style_ON_TOP : INTEGER is 16384
		-- Style constant for always on top behavior (value is 1<<14).  

	style_PASSWORD : INTEGER is 4194304
		-- Style constant for password behavior (value is 1<<22).  

	style_POP_UP : INTEGER is 8
		-- Style constant for pop up menu behavior (value is 1<<3).  

	style_PRIMARY_MODAL : INTEGER is 32768
		-- Style constant for primary modal behavior (value is 1<<15).  

	style_PUSH : INTEGER is 8
		-- Style constant for push button behavior (value is 1<<3).  

	style_RADIO : INTEGER is 16
		-- Style constant for radio button behavior (value is 1<<4).  

	style_READ_ONLY : INTEGER is 8
		-- Style constant for read-only behavior (value is 1<<3).  

	style_RESIZE : INTEGER is 16
		-- Style constant for resize box trim (value is 1<<4).  

	style_RIGHT : INTEGER is 131072
		-- Style constant for align right behavior (value is 1<<17).  

	style_RIGHT_TO_LEFT : INTEGER is 67108864
		-- Style constant for right to left orientation (value is 1<<26).  

	style_Resize : INTEGER is 11
		-- Style constant for resize box trim (value is 1<<4).  

	style_SEPARATOR : INTEGER is 2
		-- Style constant for line separator behavior (value is 1<<1).  

	style_SHADOW_ETCHED_IN : INTEGER is 16
		-- Style constant for shadow etched in behavior (value is 1<<4).  

	style_SHADOW_ETCHED_OUT : INTEGER is 64
		-- Style constant for shadow etched out behavior (value is 1<<6).  

	style_SHADOW_IN : INTEGER is 4
		-- Style constant for shadow in behavior (value is 1<<2).  

	style_SHADOW_NONE : INTEGER is 32
		-- Style constant for no shadow behavior (value is 1<<5).  

	style_SHADOW_OUT : INTEGER is 8
		-- Style constant for shadow out behavior (value is 1<<3).  

	style_SIMPLE : INTEGER is 64
		-- Style constant for simple (not drop down) behavior (value is 1<<6).  

	style_SINGLE : INTEGER is 4
		-- Style constant for single selection behavior in lists and single line support on text fields (value is 1<<2).  

	style_SMOOTH : INTEGER is 65536
		-- Style constant for flat appearance.  

	style_SYSTEM_MODAL : INTEGER is 131072
		-- Style constant for system modal behavior (value is 1<<17).  

	style_TITLE : INTEGER is 32
		-- Style constant for title area trim (value is 1<<5).  

	style_TOGGLE : INTEGER is 2
		-- Style constant for toggle button behavior (value is 1<<1).  

	style_TOOL : INTEGER is 4
		-- Style constant for tool window behavior (value is 1<<2).  

	style_TOP : INTEGER is 128
		-- Style constant for align top behavior (value is 1<<7, since align UP and align TOP are considered the same).  

	style_TRAIL : INTEGER is 131072
		-- Style constant for trailiing alignment (value is 1<<17).  

	style_UP : INTEGER is 128
		-- Style constant for align up behavior (value is 1<<7, since align UP and align TOP are considered the same).  

	style_VERTICAL : INTEGER is 512
		-- Style constant for vertical alignment or orientation behavior (value is 1<<9).  

	style_VIRTUAL : INTEGER is 268435456
		-- Style constant to allow virtual data (value is 1<<28).  

	style_V_SCROLL : INTEGER is 512
		-- Style constant for vertical scrollbar behavior (value is 1<<9).  

	style_WRAP : INTEGER is 64
		-- Style constant for automatic line wrap behavior (value is 1<<6).  

end

-- Copyright: 2003, Paul G. Crismer & Eric Fafchamps, <pgcrism@users.sourceforge.net> & <efa@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
