indexing
	description: "SWT general constants"
	author: "Paul G. Crismer & Eric Fafchamps"
	
	note: "All event types have been prefixed by 'event_' %
		% and all key codes have been prefixed by 'key_', %
		% all MessagBox styles by 'MB_' and %
		% all styles by 'style_'."
class
	SWT_CONSTANTS
	
feature -- Accesss

	MB_ABORT  : INTEGER is 512	--MessageBox style constant for an ABORT button. 

	event_Activate  : INTEGER is 26	--activate event type (value is 26) 

	ALPHA  : INTEGER is 4	--Input Method Editor style constant for alpha input behavior (value is 1<<2) 

	key_ALT  : INTEGER is 65536	--keyboard and/or mouse event mask indicating that the ALT key was pushed on the keyboard when the event was generated (value is 1<<16) 

	style_APPLICATION_MODAL  : INTEGER is 65536	--style constant for application modal behavior (value is 1<<16) ; Note that this is a HINT. 

	event_Arm  : INTEGER is 30	--arm event type (value is 30) 

	style_ARROW  : INTEGER is 4	--style constant for arrow button behavior (value is 1<<2)  

	key_ARROW_DOWN  : INTEGER is 16777218	--keyboard event constant representing the DOWN ARROW key (value is (1<<24)+2) 

	key_ARROW_LEFT  : INTEGER is 16777219	--keyboard event constant representing the LEFT ARROW key (value is (1<<24)+3) 

	key_ARROW_RIGHT  : INTEGER is 16777220	--keyboard event constant representing the RIGHT ARROW key (value is (1<<24)+4) 

	key_ARROW_UP  : INTEGER is 16777217	--keyboard event constant representing the UP ARROW key (value is (1<<24)+1) 

	style_BAR  : INTEGER is 2	--style constant for menu bar behavior (value is 1<<1)  

	BITMAP  : INTEGER is 0	--constant indicating that an image or operation is of type bitmap (value is 0) 

	font_BOLD  : INTEGER is 1	--font style constant indicating a bold weight font (value is 1<<0) 

	style_BORDER  : INTEGER is 2048	--style constant for bordered behavior (value is 1<<11) ; Note that this is a HINT. 

	style_BOTTOM  : INTEGER is 1024	--style constant for align bottom behavior (value is 1<<10, since align DOWN and align BOTTOM are considered the same)  

	BS  : CHARACTER is '%/8/'	--ASCII character convenience constant for the backspace character (value is the CHARACTER '\b') 

	key_BUTTON1  : INTEGER is 524288	--keyboard and/or mouse event mask indicating that mouse button one was pushed when the event was generated. 

	key_BUTTON2  : INTEGER is 1048576	--keyboard and/or mouse event mask indicating that mouse button two was pushed when the event was generated. 

	key_BUTTON3  : INTEGER is 2097152	--keyboard and/or mouse event mask indicating that mouse button three was pushed when the event was generated. 

	MB_CANCEL  : INTEGER is 256	--MessageBox style constant for a CANCEL button. 

	style_CASCADE  : INTEGER is 64	--style constant for cascade behavior (value is 1<<6)  

	style_CENTER  : INTEGER is 16777216	--style constant for align center behavior (value is 1<<24)  

	style_CHECK  : INTEGER is 32	--style constant for check box behavior (value is 1<<5)  

	style_CLIP_CHILDREN  : INTEGER is 4096	--style constant indicating that the window manager should clip a widget's children with respect to its viewable area. 

	style_CLIP_SIBLINGS  : INTEGER is 8192	--style constant indicating that the window manager should clip a widget's siblings with respect to its viewable area. 

	event_Close  : INTEGER is 64	--close event type (value is 21) 

	style_CLOSE  : INTEGER is 64	--style constant for close box trim (value is 1<<6, since we do not distinguish between CLOSE style and MENU style)  

	event_Collapse  : INTEGER is 18	--collapse event type (value is 18) 

	COLOR_BLACK  : INTEGER is 2	--default color black (value is 2) 

	COLOR_BLUE  : INTEGER is 9	--default color blue (value is 9) 

	COLOR_CYAN  : INTEGER is 13	--default color cyan (value is 13) 

	COLOR_DARK_BLUE  : INTEGER is 10	--default color dark blue (value is 10) 

	COLOR_DARK_CYAN  : INTEGER is 14	--default color dark cyan (value is 14) 

	COLOR_DARK_GRAY  : INTEGER is 16	--default color dark gray (value is 16) 

	COLOR_DARK_GREEN  : INTEGER is 6	--default color dark green (value is 6) 

	COLOR_DARK_MAGENTA  : INTEGER is 12	--default color dark magenta (value is 12) 

	COLOR_DARK_RED  : INTEGER is 4	--default color dark red (value is 4) 

	COLOR_DARK_YELLOW  : INTEGER is 8	--default color dark yello (value is 8) 

	COLOR_GRAY  : INTEGER is 15	--default color gray (value is 15) 

	COLOR_GREEN  : INTEGER is 5	--default color green (value is 5) 

	COLOR_INFO_BACKGROUND  : INTEGER is 29	--system color used to paint tooltip background areas (value is 29) 

	COLOR_INFO_FOREGROUND  : INTEGER is 28	--system color used to paint tooltip text (value is 28) 

	COLOR_LIST_BACKGROUND  : INTEGER is 25	--system color used to paint list background areas (value is 25) 

	COLOR_LIST_FOREGROUND  : INTEGER is 24	--system color used to paint list foreground areas (value is 24) 

	COLOR_LIST_SELECTION  : INTEGER is 26	--system color used to paint list selection background areas (value is 26) 

	COLOR_LIST_SELECTION_TEXT  : INTEGER is 27	--system color used to paint list selected text (value is 27) 

	COLOR_MAGENTA  : INTEGER is 11	--default color magenta (value is 11) 

	COLOR_RED  : INTEGER is 3	--default color red (value is 3) 

	COLOR_TITLE_BACKGROUND  : INTEGER is 31	--system color used to paint title background areas (value is 31) 

	COLOR_TITLE_BACKGROUND_GRADIENT  : INTEGER is 32	--system color used to paint title background gradient (value is 32) 

	COLOR_TITLE_FOREGROUND  : INTEGER is 30	--system color used to paint title text (value is 30) 

	COLOR_TITLE_INACTIVE_BACKGROUND  : INTEGER is 34	--system color used to paint inactive title background areas (value is 34) 

	COLOR_TITLE_INACTIVE_BACKGROUND_GRADIENT  : INTEGER is 35	--system color used to paint inactive title background gradient (value is 35) 

	COLOR_TITLE_INACTIVE_FOREGROUND  : INTEGER is 33	--system color used to paint inactive title text (value is 33) 

	COLOR_WHITE  : INTEGER is 1	--default color white (value is 1) 

	COLOR_WIDGET_BACKGROUND  : INTEGER is 22	--system color used to paint background areas (value is 22) 

	COLOR_WIDGET_BORDER  : INTEGER is 23	--system color used to paint border areas (value is 23) 

	COLOR_WIDGET_DARK_SHADOW  : INTEGER is 17	--system color used to paint dark shadow areas (value is 17) 

	COLOR_WIDGET_FOREGROUND  : INTEGER is 21	--system color used to paint foreground areas (value is 21) 

	COLOR_WIDGET_HIGHLIGHT_SHADOW  : INTEGER is 20	--system color used to paint highlight shadow areas (value is 20) 

	COLOR_WIDGET_LIGHT_SHADOW  : INTEGER is 19	--system color used to paint light shadow areas (value is 19) 

	COLOR_WIDGET_NORMAL_SHADOW  : INTEGER is 18	--system color used to paint normal shadow areas (value is 18) 

	COLOR_YELLOW  : INTEGER is 7	--default color yellow (value is 7) 

	key_CONTROL  : INTEGER is 262144	--keyboard and/or mouse event mask indicating that the CTRL key was pushed on the keyboard when the event was generated. 

	CR  : CHARACTER is '%/13/'	--ASCII character convenience constant for the carriage return character (value is the CHARACTER '\r') 

	key_CTRL  : INTEGER is 262144	--keyboard and/or mouse event mask indicating that the CTRL key was pushed on the keyboard when the event was generated (value is 1<<18) 

	CURSOR_APPSTARTING  : INTEGER is 3	--system app startup cursor (value is 3) 

	CURSOR_ARROW  : INTEGER is 0	--system arrow cursor (value is 0) 

	CURSOR_CROSS  : INTEGER is 2	--system cross hair cursor (value is 2) 

	CURSOR_HAND  : INTEGER is 21	--system hand cursor (value is 21) 

	CURSOR_HELP  : INTEGER is 4	--system help cursor (value is 4) 

	CURSOR_IBEAM  : INTEGER is 19	--system i-beam cursor (value is 19) 

	CURSOR_NO  : INTEGER is 20	--system "not allowed" cursor (value is 20) 

	CURSOR_SIZEALL  : INTEGER is 5	--system resize all directions cursor (value is 5) 

	CURSOR_SIZEE  : INTEGER is 12	--system resize east cursor (value is 12) 

	CURSOR_SIZEN  : INTEGER is 10	--system resize north cursor (value is 10) 

	CURSOR_SIZENE  : INTEGER is 14	--system resize north-east cursor (value is 14) 

	CURSOR_SIZENESW  : INTEGER is 6	--system resize north-east-south-west cursor (value is 6) 

	CURSOR_SIZENS  : INTEGER is 7	--system resize north-south cursor (value is 7) 

	CURSOR_SIZENW  : INTEGER is 17	--system resize north-west cursor (value is 17) 

	CURSOR_SIZENWSE  : INTEGER is 8	--system resize north-west-south-east cursor (value is 8) 

	CURSOR_SIZES  : INTEGER is 11	--system resize south cursor (value is 11) 

	CURSOR_SIZESE  : INTEGER is 15	--system resize south-east cursor (value is 15) 

	CURSOR_SIZESW  : INTEGER is 16	--system resize south-west cursor (value is 16) 

	CURSOR_SIZEW  : INTEGER is 13	--system resize west cursor (value is 13) 

	CURSOR_SIZEWE  : INTEGER is 9	--system resize west-east cursor (value is 9) 

	CURSOR_UPARROW  : INTEGER is 18	--system up arrow cursor (value is 18) 

	CURSOR_WAIT  : INTEGER is 1	--system wait cursor (value is 1) 

	DBCS  : INTEGER is 2	--Input Method Editor style constant for double byte input behavior (value is 1<<1) 

	event_Deactivate  : INTEGER is 27	--deactivate event type (value is 27) 

	DEFAULT  : INTEGER is -1	--indicates that a default should be used (value is -1) 

	event_DefaultSelection  : INTEGER is 14	--default selection event type (value is 14) 

	event_Deiconify  : INTEGER is 20	--de-iconify event type (value is 20) 

	DEL  : CHARACTER is '%/127/'	--ASCII character convenience constant for the delete character (value is the CHARACTER with value 127) 

	DIALOG_TRIM  : INTEGER is 2144	--trim style convenience constant for the most common dialog shell appearance (value is CLOSE|TITLE|BORDER)  

	event_Dispose  : INTEGER is 12	--dispose event type (value is 12) 

	DM_FILL_BACKGROUND  : INTEGER is 2	--GIF image disposal method constants indicating that the the previous images should be covered with the background color before displaying the next image (value is 2) 

	DM_FILL_NONE  : INTEGER is 1	--GIF image disposal method constants indicating that the disposal method is to do nothing. 

	DM_FILL_PREVIOUS  : INTEGER is 3	--GIF image disposal method constants indicating that the disposal method is to restore the previous picture (value is 3) 

	DM_UNSPECIFIED  : INTEGER is 0	--GIF image disposal method constants indicating that the disposal method is unspecified (value is 0) 

	style_DOWN  : INTEGER is 1024	--style constant for align down behavior (value is 1<<10, since align DOWN and align BOTTOM are considered the same)  

	DRAG  : INTEGER is 1	--indicates that a user-interface component is being dragged, for example dragging the thumb of a scroll bar (value is 1) 

	event_DragDetect  : INTEGER is 29	--drag detect event type (value is 29) 

	DRAW_DELIMITER  : INTEGER is 2	--draw constant indicating whether the string drawing operation should handle line-delimeters (value is 1<<1) 

	DRAW_MNEMONIC  : INTEGER is 8	--draw constant indicating whether the string drawing operation should handle mnemonics (value is 1<<3) 

	DRAW_TAB  : INTEGER is 4	--draw constant indicating whether the string drawing operation should expand TAB characters (value is 1<<2) 

	DRAW_TRANSPARENT  : INTEGER is 1	--draw constant indicating whether the drawing operation should fill the background (value is 1<<0) 

	style_DROP_DOWN  : INTEGER is 4	--style constant for drop down menu/list behavior (value is 1<<2)  

	key_END  : INTEGER is 16777224	--keyboard event constant representing the END key (value is (1<<24)+8) 

	ERROR_CANNOT_BE_ZERO  : INTEGER is 7	--SWT error constant indicating that a value which can not be zero was found to be (value is 7) 

	ERROR_CANNOT_GET_COUNT  : INTEGER is 36	--SWT error constant indicating that the underlying operating system was unable to provide count information (value is 36) 

	ERROR_CANNOT_GET_ENABLED  : INTEGER is 31	--SWT error constant indicating that the underlying operating system was unable to provide enabled/disabled state information (value is 31) 

	ERROR_CANNOT_GET_ITEM  : INTEGER is 8	--SWT error constant indicating that the underlying operating system was unable to provide the value of an item (value is 8) 

	ERROR_CANNOT_GET_ITEM_HEIGHT  : INTEGER is 11	--SWT error constant indicating that the underlying operating system was unable to provide the height of an item (value is 11) 

	ERROR_CANNOT_GET_SELECTION  : INTEGER is 9	--SWT error constant indicating that the underlying operating system was unable to provide the selection (value is 9) 

	ERROR_CANNOT_GET_TEXT  : INTEGER is 12	--SWT error constant indicating that the underlying operating system was unable to provide the text of a widget (value is 12) 

	ERROR_CANNOT_SET_ENABLED  : INTEGER is 30	--SWT error constant indicating that the underlying operating system was unable to set the enabled state (value is 30) 

	ERROR_CANNOT_SET_MENU  : INTEGER is 29	--SWT error constant indicating that the underlying operating system was unable to set the menu (value is 29) 

	ERROR_CANNOT_SET_SELECTION  : INTEGER is 28	--SWT error constant indicating that the underlying operating system was unable to set the selection of a widget (value is 28) 

	ERROR_CANNOT_SET_TEXT  : INTEGER is 13	--SWT error constant indicating that the underlying operating system was unable to set the text of a widget (value is 13) 

	ERROR_DEVICE_DISPOSED  : INTEGER is 45	--SWT error constant indicating that an attempt was made to invoke an SWT operation using a device which had already been disposed. 

	ERROR_FAILED_EXEC  : INTEGER is 46	--SWT error constant indicating that an exception happened when executing a runnable. 

	ERROR_FAILED_LOAD_LIBRARY  : INTEGER is 47	--SWT error constant indicating that an unsatisfied link error occured while attempting to load a library. 

	ERROR_GRAPHIC_DISPOSED  : INTEGER is 44	--SWT error constant indicating that an attempt was made to invoke an SWT operation using a graphics object which had already been disposed. 

	ERROR_INVALID_ARGUMENT  : INTEGER is 5	--SWT error constant indicating that an invalid argument was passed in (value is 5) 

	ERROR_INVALID_IMAGE  : INTEGER is 40	--SWT error constant indicating that a graphics operation was attempted with an image having an invalid format (value is 40) 

	ERROR_INVALID_PARENT  : INTEGER is 32	--SWT error constant indicating that a provided widget can not be used as a parent in the current operation (value is 32) 

	ERROR_INVALID_RANGE  : INTEGER is 6	--SWT error constant indicating that a value was found to be outside the allowable range (value is 6) 

	ERROR_INVALID_SUBCLASS  : INTEGER is 43	--SWT error constant indicating that an attempt was made to subclass an SWT widget class without implementing the checkSubclass() method. 

	ERROR_IO  : INTEGER is 39	--SWT error constant indicating that an input/output operation failed during the execution of an SWT operation (value is 39) 

	ERROR_ITEM_NOT_ADDED  : INTEGER is 14	--SWT error constant indicating that the underlying operating system was unable to add an item (value is 14) 

	ERROR_ITEM_NOT_REMOVED  : INTEGER is 15	--SWT error constant indicating that the underlying operating system was unable to remove an item (value is 15) 

	ERROR_MENU_NOT_BAR  : INTEGER is 33	--SWT error constant indicating that a menu which needed to have the menu bar style had some other style instead (value is 33) 

	ERROR_MENU_NOT_DROP_DOWN  : INTEGER is 21	--SWT error constant indicating that a menu which needed to have the drop down style had some other style instead (value is 21) 

	ERROR_MENU_NOT_POP_UP  : INTEGER is 37	--SWT error constant indicating that a menu which needed to have the pop up menu style had some other style instead (value is 37) 

	ERROR_MENUITEM_NOT_CASCADE  : INTEGER is 27	--SWT error constant indicating that a menu item which needed to have the cascade style had some other style instead (value is 27) 

	ERROR_NO_HANDLES  : INTEGER is 2	--SWT error constant indicating that no more handles for an operating system resource are available (value is 2) 

	ERROR_NO_MORE_CALLBACKS  : INTEGER is 3	--SWT error constant indicating that no more callback resources are available (value is 3) 

	ERROR_NOT_IMPLEMENTED  : INTEGER is 20	--SWT error constant indicating that a particular feature has not been implemented on this platform (value is 20) 

	ERROR_NULL_ARGUMENT  : INTEGER is 4	--SWT error constant indicating that a null argument was passed in (value is 4) 

	ERROR_THREAD_INVALID_ACCESS  : INTEGER is 22	--SWT error constant indicating that an attempt was made to invoke an SWT operation which can only be executed by the user-interface thread from some other thread (value is 22) 

	ERROR_UNSPECIFIED  : INTEGER is 1	--SWT error constant indicating that no error number was specified (value is 1) 

	ERROR_UNSUPPORTED_DEPTH  : INTEGER is 38	--SWT error constant indicating that a graphics operation was attempted with an image of an unsupported depth (value is 38) 

	ERROR_UNSUPPORTED_FORMAT  : INTEGER is 42	--SWT error constant indicating that a graphics operation was attempted with an image having a valid but unsupported format (value is 42) 

	ERROR_WIDGET_DISPOSED  : INTEGER is 24	--SWT error constant indicating that an attempt was made to invoke an SWT operation using a widget which had already been disposed. 

	ESC  : CHARACTER is '%/27/'	--ASCII character convenience constant for the escape character (value is the CHARACTER with value 27) 

	event_Expand  : INTEGER is 17	--expand event type (value is 17) 

	key_F1  : INTEGER is 16777226	--keyboard event constant representing the F1 key (value is (1<<24)+10) 

	key_F10  : INTEGER is 16777235	--keyboard event constant representing the F10 key (value is (1<<24)+19) 

	key_F11  : INTEGER is 16777236	--keyboard event constant representing the F11 key (value is (1<<24)+20) 

	key_F12  : INTEGER is 16777237	--keyboard event constant representing the F12 key (value is (1<<24)+21) 

	key_F2  : INTEGER is 16777227	--keyboard event constant representing the F2 key (value is (1<<24)+11) 

	key_F3  : INTEGER is 16777228	--keyboard event constant representing the F3 key (value is (1<<24)+12) 

	key_F4  : INTEGER is 16777229	--keyboard event constant representing the F4 key (value is (1<<24)+13) 

	key_F5  : INTEGER is 16777230	--keyboard event constant representing the F5 key (value is (1<<24)+14) 

	key_F6  : INTEGER is 16777231	--keyboard event constant representing the F6 key (value is (1<<24)+15) 

	key_F7  : INTEGER is 16777232	--keyboard event constant representing the F7 key (value is (1<<24)+16) 

	key_F8  : INTEGER is 16777233	--keyboard event constant representing the F8 key (value is (1<<24)+17) 

	key_F9  : INTEGER is 16777234	--keyboard event constant representing the F9 key (value is (1<<24)+18) 

	style_FLAT  : INTEGER is 8388608	--style constant for flat appearance. 

	event_FocusIn  : INTEGER is 15	--focus in event type (value is 15) 

	event_FocusOut  : INTEGER is 16	--focus out event type (value is 16) 

	style_FULL_SELECTION  : INTEGER is 65536	--style constant for full row selection behavior. 

	style_event_H_SCROLL  : INTEGER is 256	--style constant for horizontal scrollbar behavior (value is 1<<8)  

	event_HardKeyDown  : INTEGER is 33	--hardware key down event type (value is 33) 

	event_HardKeyUp  : INTEGER is 34	--hardware key up event type (value is 34) 

	event_Help  : INTEGER is 28	--help event type (value is 28) 

	event_Hide  : INTEGER is 23	--hide event type (value is 23) 

	style_HIDE_SELECTION  : INTEGER is 32768	--style constant for selection hiding behavior. 

	key_HOME  : INTEGER is 16777223	--keyboard event constant representing the HOME key (value is (1<<24)+7) 

	style_HORIZONTAL  : INTEGER is 256	--style constant for horizontal alignment or orientation behavior (value is 1<<8)  

	ICON  : INTEGER is 1	--constant indicating that an image or operation is of type icon (value is 1) 

	MB_ICON_ERROR  : INTEGER is 1	--MessageBox style constant for error icon behavior (value is 1) 

	MB_ICON_INFORMATION  : INTEGER is 2	--MessageBox style constant for information icon behavior (value is 1<<1) 

	MB_ICON_QUESTION  : INTEGER is 4	--MessageBox style constant for question icon behavior (value is 1<<2) 

	MB_ICON_WARNING  : INTEGER is 8	--MessageBox style constant for warning icon behavior (value is 1<<3) 

	MB_ICON_WORKING  : INTEGER is 16	--MessageBox style constant for "working" icon behavior (value is 1<<4) 

	event_Iconify  : INTEGER is 19	--iconify event type (value is 19) 

	MB_IGNORE  : INTEGER is 2048	--MessageBox style constant for an IGNORE button. 

	IMAGE_BMP  : INTEGER is 0	--image format constant indicating a Windows BMP format image (value is 0) 

	IMAGE_BMP_RLE  : INTEGER is 1	--image format constant indicating a run-length encoded Windows BMP format image (value is 1) 

	IMAGE_COPY  : INTEGER is 0	--Image constructor argument indicating that the new image should be a copy of the image provided as an argument (value is 0) 

	IMAGE_DISABLE  : INTEGER is 1	--Image constructor argument indicating that the new image should have the appearance of a "disabled" (using the platform's rules for how this should look) copy of the image provided as an argument (value is 1) 

	IMAGE_GIF  : INTEGER is 2	--image format constant indicating a GIF format image (value is 2) 

	IMAGE_GRAY  : INTEGER is 2	--Image constructor argument indicating that the new image should have the appearance of a "gray scaled" copy of the image provided as an argument (value is 2) 

	IMAGE_ICO  : INTEGER is 3	--image format constant indicating a ICO format image (value is 3) 

	IMAGE_JPEG  : INTEGER is 4	--image format constant indicating a JPEG format image (value is 4) 

	IMAGE_PNG  : INTEGER is 5	--image format constant indicating a PNG format image (value is 5) 

	IMAGE_UNDEFINED  : INTEGER is -1	--image format constant indicating an unknown image type (value is -1) 

	key_INSERT  : INTEGER is 16777225	--keyboard event constant representing the INSERT key (value is (1<<24)+9) 

	font_ITALIC  : INTEGER is 2	--font style constant indicating an italic font (value is 1<<1) 

	event_KeyDown  : INTEGER is 1	--key down event type (value is 1) 

	event_KeyUp  : INTEGER is 2	--key up event type (value is 2) 

	style_LEFT  : INTEGER is 16384	--style constant for align left behavior (value is 1<<14)  

	LF  : CHARACTER is '%/10/'	--ASCII character convenience constant for the line feed character (value is the CHARACTER '\n') 

	LINE_DASH  : INTEGER is 2	--line drawing style for dashed lines (value is 2) 

	LINE_DASHDOT  : INTEGER is 4	--line drawing style for alternating dash-dot lines (value is 4) 

	LINE_DASHDOTDOT  : INTEGER is 5	--line drawing style for dash-dot-dot lines (value is 5) 

	LINE_DOT  : INTEGER is 3	--line drawing style for dotted lines (value is 3) 

	LINE_SOLID  : INTEGER is 1	--line drawing style for solid lines (value is 1) 

	style_MAX  : INTEGER is 1024	--style constant for maximize box trim (value is 1<<10)  

	style_MENU  : INTEGER is 64	--style constant for shell menu trim (value is 1<<6, since we do not distinguish between CLOSE style and MENU style)  

	style_MIN  : INTEGER is 128	--style constant for minimize box trim (value is 1<<7)  

	style_MODELESS  : INTEGER is 0	--style constant for modeless behavior (value is 0) ; Note that this is a HINT. 

	event_Modify  : INTEGER is 24	--modify event type (value is 24) 

	event_MouseDoubleClick  : INTEGER is 8	--mouse double click event type (value is 8) 

	event_MouseDown  : INTEGER is 3	--mouse down event type (value is 3) 

	event_MouseEnter  : INTEGER is 6	--mouse enter event type (value is 6) 

	event_MouseExit  : INTEGER is 7	--Mouse exit event type (value is 7) 

	event_MouseHover  : INTEGER is 32	--mouse hover event type (value is 32) 

	event_MouseMove  : INTEGER is 5	--mouse move event type (value is 5) 

	event_MouseUp  : INTEGER is 4	--mouse up event type (value is 4) 

	event_Move  : INTEGER is 10	--move event type (value is 10) 

	style_MULTI  : INTEGER is 2	--style constant for multi-selection behavior in lists and multiple line support on text fields (value is 1<<1)  

	NATIVE  : INTEGER is 8	--Input Method Editor style constant for native input behavior (value is 1<<3) 

	MB_NO  : INTEGER is 128	--MessageBox style constant for NO button. 

	style_NO_BACKGROUND  : INTEGER is 262144	--style constant for no background behavior (value is 1<<18)  

	style_NO_FOCUS  : INTEGER is 524288	--style constant for does not take focus behavior (value is 1<<19) ; Note that this is a HINT. 

	style_NO_MERGE_PAINTS  : INTEGER is 2097152	--style constant for no paint event merging behavior (value is 1<<21)  

	style_NO_RADIO_GROUP  : INTEGER is 4194304	--style constant for preventing child radio group behavior (value is 1<<22)  

	style_NO_REDRAW_RESIZE  : INTEGER is 1048576	--style constant for no redraw on resize behavior (value is 1<<20)  

	style_NO_TRIM  : INTEGER is 8	--style constant to ensure no trimmings are used (value is 1<<3) ; Note that this overrides all other trim styles. 

	NONE  : INTEGER is 0	--a constant known to be zero (0), used in operations which take bit flags to indicate that "no bits are set" 

	font_NORMAL  : INTEGER is 0	--font style constant indicating a normal weight, non-italic font (value is 0) 

	NULL  : INTEGER is 0	--a constant known to be zero (0), used in operations which take pointers to indicate a null argument 

	MB_OK  : INTEGER is 32	--MessageBox style constant for an OK button. 

	style_ON_TOP  : INTEGER is 16384	--style constant for always on top behavior (value is 1<<14) ; Note that this is a HINT. 

	OPEN  : INTEGER is 4096	--FileDialog style constant for open file dialog behavior (value is 1<<12) 

	key_PAGE_DOWN  : INTEGER is 16777222	--keyboard event constant representing the PAGE DOWN key (value is (1<<24)+6) 

	key_PAGE_UP  : INTEGER is 16777221	--keyboard event constant representing the PAGE UP key (value is (1<<24)+5) 

	event_Paint  : INTEGER is 9	--paint event type (value is 9) 

	PHONETIC  : INTEGER is 16	--Input Method Editor style constant for phonetic input behavior (value is 1<<4) 

	style_POP_UP  : INTEGER is 8	--style constant for pop up menu behavior (value is 1<<3)  

	style_PRIMARY_MODAL  : INTEGER is 32768	--style constant for primary modal behavior (value is 1<<15) ; Note that this is a HINT. 

	style_PUSH  : INTEGER is 8	--style constant for push button behavior (value is 1<<3)  

	style_RADIO  : INTEGER is 16	--style constant for radio button behavior (value is 1<<4)  

	style_READ_ONLY  : INTEGER is 8	--style constant for read-only behavior (value is 1<<3)  

	event_Resize  : INTEGER is 16	--resize event type (value is 11) 

	style_RESIZE  : INTEGER is 16	--style constant for resize box trim (value is 1<<4)  

	MB_RETRY  : INTEGER is 1024	--MessageBox style constant for a RETRY button. 

	style_RIGHT  : INTEGER is 131072	--style constant for align right behavior (value is 1<<17)  

	ROMAN  : INTEGER is 32	--Input Method Editor style constant for romanicized input behavior (value is 1<<5) 

	SAVE  : INTEGER is 8192	--FileDialog style constant for save file dialog behavior (value is 1<<13) 

	event_Selection  : INTEGER is 13	--selection event type (value is 13) 

	style_SEPARATOR  : INTEGER is 2	--style constant for line separator behavior (value is 1<<1)  

	style_SHADOW_ETCHED_IN  : INTEGER is 16	--style constant for shadow etched in behavior (value is 1<<4) ; Note that this is a HINT. 

	style_SHADOW_ETCHED_OUT  : INTEGER is 64	--style constant for shadow etched out behavior (value is 1<<6) ; Note that this is a HINT. 

	style_SHADOW_IN  : INTEGER is 4	--style constant for shadow in behavior (value is 1<<2) ; Note that this is a HINT. 

	style_SHADOW_NONE  : INTEGER is 32	--style constant for no shadow behavior (value is 1<<5) ; Note that this is a HINT. 

	style_SHADOW_OUT  : INTEGER is 8	--style constant for shadow out behavior (value is 1<<3) ; Note that this is a HINT. 

	SHELL_TRIM  : INTEGER is 1264	--trim style convenience constant for the most common top level shell appearance (value is CLOSE|TITLE|MIN|MAX|RESIZE)  

	key_SHIFT  : INTEGER is 131072	--keyboard and/or mouse event mask indicating that the SHIFT key was pushed on the keyboard when the event was generated (value is 1<<17) 

	event_Show  : INTEGER is 22	--show event type (value is 22) 

	style_SIMPLE  : INTEGER is 64	--style constant for simple (not drop down) behavior (value is 1<<6)  

	style_SINGLE  : INTEGER is 4	--style constant for single selection behavior in lists and single line support on text fields (value is 1<<2)  

	style_SMOOTH  : INTEGER is 65536	--style constant for flat appearance. 

	style_SYSTEM_MODAL  : INTEGER is 131072	--style constant for system modal behavior (value is 1<<17) ; Note that this is a HINT. 

	style_TITLE  : INTEGER is 32	--style constant for title area trim (value is 1<<5)  

	style_TOGGLE  : INTEGER is 2	--style constant for toggle button behavior (value is 1<<1)  

	style_TOOL  : INTEGER is 4	--style constant for tool window behavior (value is 1<<2)  

	style_TOP  : INTEGER is 128	--style constant for align top behavior (value is 1<<7, since align UP and align TOP are considered the same)  

	TRANSPARENCY_ALPHA  : INTEGER is 1	--image transparency constant indicating that the image contains alpha transparency information (value is 1<<0) 

	TRANSPARENCY_MASK  : INTEGER is 2	--image transparency constant indicating that the image contains a transparency mask (value is 1<<1) 

	TRANSPARENCY_NONE  : INTEGER is 0	--image transparency constant indicating that the image contains no transparency information (value is 0) 

	TRANSPARENCY_PIXEL  : INTEGER is 4	--image transparency constant indicating that the image contains a transparent pixel (value is 1<<2) 

	event_Traverse  : INTEGER is 31	--traverse event type (value is 31) 

	TRAVERSE_ARROW_NEXT  : INTEGER is 64	--traversal event detail field value indicating that the key which designates that focus should be given to the previous tab item was pressed; typically, this is either the RIGHT-ARROW or DOWN-ARROW keys (value is 1<<6) 

	TRAVERSE_ARROW_PREVIOUS  : INTEGER is 32	--traversal event detail field value indicating that the key which designates that focus should be given to the previous tab item was pressed; typically, this is either the LEFT-ARROW or UP-ARROW keys (value is 1<<5) 

	TRAVERSE_ESCAPE  : INTEGER is 2	--traversal event detail field value indicating that the key which designates that a dialog should be cancelled was pressed; typically, this is the ESC key (value is 1<<1) 

	TRAVERSE_MNEMONIC  : INTEGER is 128	--traversal event detail field value indicating that a mnemonic key sequence was pressed (value is 1<<7) 

	TRAVERSE_NONE  : INTEGER is 0	--traversal event detail field value indicating that no traversal action should be taken. 

	TRAVERSE_PAGE_NEXT  : INTEGER is 512	--traversal event detail field value indicating that the key which designates that the next page of a multi-page window should be shown was pressed; typically, this is the CTRL-PAGEDOWN key sequence (value is 1<<9) 

	TRAVERSE_PAGE_PREVIOUS  : INTEGER is 256	--traversal event detail field value indicating that the key which designates that the previous page of a multi-page window should be shown was pressed; typically, this is the CTRL-PAGEUP key sequence (value is 1<<8) 

	TRAVERSE_RETURN  : INTEGER is 4	--traversal event detail field value indicating that the key which activates the default button in a dialog was pressed; typically, this is the ENTER key (value is 1<<2) 

	TRAVERSE_TAB_NEXT  : INTEGER is 16	--traversal event detail field value indicating that the key which designates that focus should be given to the next tab group was pressed; typically, this is the TAB key (value is 1<<4) 

	TRAVERSE_TAB_PREVIOUS  : INTEGER is 8	--traversal event detail field value indicating that the key which designates that focus should be given to the previous tab group was pressed; typically, this is the SHIFT-TAB key sequence (value is 1<<3) 

	style_UP  : INTEGER is 128	--style constant for align up behavior (value is 1<<7, since align UP and align TOP are considered the same)  

	style_V_SCROLL  : INTEGER is 512	--style constant for vertical scrollbar behavior (value is 1<<9)  

	event_Verify  : INTEGER is 25	--verify event type (value is 25) 

	style_VERTICAL  : INTEGER is 512	--style constant for vertical alignment or orientation behavior (value is 1<<9)  

	style_WRAP  : INTEGER is 64	--style constant for automatic line wrap behavior (value is 1<<6)  

	MB_YES  : INTEGER is 64	--MessageBox style constant for YES button. 
end
