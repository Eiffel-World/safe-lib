indexing
	description: 
	"[
			Instances of this class represent a non-selectable
			user interface object that displays a string or image.
			When SEPARATOR is specified, displays a single
			vertical or horizontal line.
			
			Styles:
			SEPARATOR, HORIZONTAL, VERTICAL
			SHADOW_IN, SHADOW_OUT, SHADOW_NONE
			CENTER, LEFT, RIGHT, WRAP
			
			Events:
			(none)
			
			Note: 
			Only one of SHADOW_IN, SHADOW_OUT and SHADOW_NONE may be specified.
			SHADOW_NONE is a HINT. Only one of HORIZONTAL and VERTICAL may be specified.
			Only one of CENTER, LEFT and RIGHT may be specified.
			
			IMPORTANT: This class is intended to be subclassed <em>only</em> within the SWT implementation.
	]"
	
	author: ""
	date: "$Date: 2004/08/30 19:41:21 $"
	revision: "$Revision: 1.1 $"

deferred class
	LABEL

inherit
	ABSTRACT_LABEL
		undefine
			release_handle
		end
	
	CONTROL
		rename
			window_proc_pointer as label_proc,
			window_class as label_class
		redefine
			make
		end
	
feature {NONE} -- Initialization

	make (p_parent : COMPOSITE; p_style : INTEGER) is
			-- Constructs a new instance of this class given its parent
			-- and a style value describing its behavior and appearance.
			--  <p>
			--  The style value is either one of the style constants defined in
			--  class <code>SWT</code> which is applicable to instances of this
			--  class, or must be built by <em>bitwise OR</em>'ing together 
			--  (that is, using the <code>int</code> "|" operator) two or more
			--  of those <code>SWT</code> style constants. The class description
			--  lists the style constants that are applicable to the class.
			--  Style bits are also inherited from superclasses.
			-- 
			-- @param parent a composite control which will be the parent of the new instance (cannot be null)
			-- @param style the style of control to construct
			-- 
			-- * @exception IllegalArgumentException <ul>
			-- *    <li>ERROR_NULL_ARGUMENT - if the parent is null</li>
			-- * </ul>
			-- * @exception SWTException <ul>
			-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the parent</li>
			-- *    <li>ERROR_INVALID_SUBCLASS - if this class is not an allowed subclass</li>
			-- * </ul>
			-- *
			-- @see SWT#SEPARATOR
			-- @see SWT#HORIZONTAL
			-- @see SWT#VERTICAL
			-- @see SWT#SHADOW_IN
			-- @see SWT#SHADOW_OUT
			-- @see SWT#SHADOW_NONE
			-- @see SWT#CENTER
			-- @see SWT#LEFT
			-- @see SWT#RIGHT
			-- @see SWT#WRAP
			-- @see Widget#checkSubclass
			-- @see Widget#getStyle
		do
			Precursor (p_parent, check_style (p_style))
		end

feature -- Access

	image : IMAGE
	
	font : INTEGER
	
feature -- Measurement

	compute_size (whint, hhint : INTEGER; changed : BOOLEAN) : POINT is
		local
			l_width, l_height, l_border : INTEGER
			l_line_width : INTEGER
			l_bits : INTEGER
			is_icon, is_bitmap : BOOLEAN
			l_rectangle : RECTANGLE
			l_rect : RECT
			l_hdc : POINTER
			oldfont : POINTER
			newfont : XS_C_INT32
			l_flags : INTEGER
			l_length : INTEGER
			buffer : TCHAR
			ires : INTEGER
			pres : POINTER
			l_textmetric : TEXTMETRIC
		do
			check_widget
			l_border := get_border_width
			if Uint32_.u_and (style, swt.Style_separator) /= 0 then
				l_line_width := os.get_system_metrics (os.Sm_cxborder)
				if Uint32_.u_and (style, swt.Style_horizontal) /= 0 then
					l_width := Default_width_constant;
					l_height := l_line_width * 2
				else
					l_width := l_line_width * 2
					l_height := Default_height_constant
				end
				if whint /= swt.Default_value then
					l_width := wHint
				end
				if hhint /= swt.Default_value then
					l_height := hhint
				end
				l_width := l_width + l_border * 2
				l_height := l_height + l_border * 2
				create Result.make (l_width, l_height)
			else
					--	* NOTE: SS_BITMAP and SS_ICON are not single bit
					--	* masks so it is necessary to test for all of the
					--	* bits in these masks.
			
					l_bits := os.get_window_long_a (handle, os.Gwl_style)
					is_bitmap := Uint32_.u_and (l_bits, os.Ss_bitmap) = os.Ss_bitmap
					is_icon := Uint32_.u_and (l_bits, os.Ss_icon) = os.Ss_icon
					if is_bitmap or else is_icon then
						if image /= Void then
							l_rectangle := image.get_bounds
							l_width := l_rectangle.width
							l_height := l_rectangle.height
						end
					else
						l_hdc := os.get_dc (handle)
						create newfont.make
						newfont.put (os.send_message_a (handle, os.wm_getfont, 0, 0))
						oldfont := os.select_object (l_hdc, newfont.as_pointer)
						create l_rect.make_new_unshared 
						l_flags := Uint32_.u_or (os.dt_calcrect, Uint32_.u_or (os.dt_editcontrol, os.Dt_expandtabs))
						if Uint32_.u_and (style, swt.Style_wrap) /= 0 and then whint /= swt.Default_value then
							l_flags := Uint32_.u_or (l_flags, os.Dt_wordbreak)
							l_rect.set_right (whint)
						end
						l_length := os.get_window_text_length_a (handle)
						create buffer.make (l_length + 1)
						ires := os.get_window_text_a (handle, buffer.handle, l_length + 1)
						ires := os.draw_text_a (l_hdc, buffer.handle, l_length, l_rect.item, l_flags)
						l_width := l_rect.right - l_rect.left
						l_height := l_rect.bottom - l_rect.top
						if l_height = 0 then
							create l_textmetric.make_new_unshared
							ires := os.get_text_metrics_a (l_hdc, l_textmetric.item)
						end
						if newfont.item /= 0 then
							pres := os.select_object (l_hdc, oldfont)
						end
						ires := os.release_dc (handle, l_hdc)
					end
					if whint /= swt.Default_value then
						l_width := whint
					end
					if hhint /= swt.Default_value then
						l_height := hhint
					end
					l_width := l_width + l_border * 2
					l_height := l_height + l_border * 2
					
					--	* Feature in WinCE PPC.  Text labels have a trim
					--	* of one pixel wide on the right and left side.
					--	* The fix is to increase the size.
					if os.is_wince then
						if not is_bitmap and not is_icon then
							l_width := l_width + 2
						end
					end
			end
			create Result.make (l_width, l_height)
		end

feature {LABEL} -- Status report

	check_style (a_style : INTEGER) : INTEGER is
			-- checked `a_style'
		do
			if Uint32_.u_and (a_style, swt.Style_separator) /= 0 then
				Result := check_bits (a_style, swt.style_vertical, swt.Style_horizontal, 0, 0, 0, 0)
				Result := check_bits (Result, swt.style_shadow_out, swt.style_shadow_in, swt.style_shadow_none, 0, 0, 0)
			else
				Result := check_bits (a_style, swt.style_left, swt.style_center, swt.style_right, 0, 0, 0)
			end
		end

feature -- Status setting

feature -- Cursor movement

feature -- Element change

feature -- Removal

feature -- Resizing

feature -- Transformation

feature -- Conversion

feature -- Duplication

feature -- Miscellaneous

feature -- Basic operations

feature -- Obsolete

feature -- Inapplicable

feature {NONE} -- Implementation

	label_class : TCHAR is
			-- Label WIN32 window class.
		once
			create Result.make_from_string ("STATIC")
		end
		
	label_proc : POINTER is
			-- Window procedure of label class.
		local
			lp_wnd_class : WNDCLASS
			lresult : INTEGER
		once
			create lp_wnd_class.make_new_unshared
			lresult := os.get_class_info_a (default_pointer, label_class.handle, lp_wnd_class.item)
			Result := lp_wnd_class.lpfnwndproc
		end

	call_window_proc (msg: INTEGER; wparam: INTEGER; lparam: INTEGER) : INTEGER is
		do
			if handle = default_pointer then
				Result := 0
			else
				Result := os.call_window_proc_a (label_proc, handle, msg, wparam, lparam)
			end
		end
		
invariant
	invariant_clause: True -- Your invariant here

--public class Label extends Control {
--	Image image;
--	int font;

--
--/**
-- * Returns a value which describes the position of the
-- * text or image in the receiver. The value will be one of
-- * <code>LEFT</code>, <code>RIGHT</code> or <code>CENTER</code>
-- * unless the receiver is a <code>SEPARATOR</code> label, in 
-- * which case, <code>NONE</code> is returned.
-- *
-- * @return the alignment 
-- *
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public int getAlignment () {
--	checkWidget ();
--	if ((style & SWT.SEPARATOR) != 0) return 0;
--	if ((style & SWT.LEFT) != 0) return SWT.LEFT;
--	if ((style & SWT.CENTER) != 0) return SWT.CENTER;
--	if ((style & SWT.RIGHT) != 0) return SWT.RIGHT;
--	return SWT.LEFT;
--}
--
--/**
-- * Returns the receiver's image if it has one, or null
-- * if it does not.
-- *
-- * @return the receiver's image
-- *
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public Image getImage () {
--	checkWidget ();
--	return image;
--}
--
--String getNameText () {
--	return getText ();
--}
--
--/**
-- * Returns the receiver's text, which will be an empty
-- * string if it has never been set or if the receiver is
-- * a <code>SEPARATOR</code> label.
-- *
-- * @return the receiver's text
-- *
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public String getText () {
--	checkWidget ();
--	if ((style & SWT.SEPARATOR) != 0) return "";
--	int length = OS.GetWindowTextLength (handle);
--	if (length == 0) return "";
--	TCHAR buffer = new TCHAR (getCodePage (), length + 1);
--	OS.GetWindowText (handle, buffer, length + 1);
--	return buffer.toString (0, length);
--}
--
--/*
--* Not currently used.
--*/
--boolean getWrap () {
--	int bits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	if ((bits & (OS.SS_RIGHT | OS.SS_CENTER)) != 0) return true;
--	if ((bits & OS.SS_LEFTNOWORDWRAP) != 0) return false;
--	return true;
--}
--
--boolean mnemonicHit (char key) {
--	Composite control = this.parent;
--	while (control != null) {
--		Control [] children = control._getChildren ();
--		int index = 0;
--		while (index < children.length) {
--			if (children [index] == this) break;
--			index++;
--		}
--		index++;
--		if (index < children.length) {
--			if (children [index].setFocus ()) return true;
--		}
--		control = control.parent;
--	}
--	return false;
--}
--
--boolean mnemonicMatch (char key) {
--	char mnemonic = findMnemonic (getText ());
--	if (mnemonic == '\0') return false;
--	return Character.toUpperCase (key) == Character.toUpperCase (mnemonic);
--}
--
--void releaseWidget () {
--	super.releaseWidget ();
--	image = null;
--}
--
--/**
-- * Controls how text and images will be displayed in the receiver.
-- * The argument should be one of <code>LEFT</code>, <code>RIGHT</code>
-- * or <code>CENTER</code>.  If the receiver is a <code>SEPARATOR</code>
-- * label, the argument is ignored and the alignment is not changed.
-- *
-- * @param alignment the new alignment 
-- *
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public void setAlignment (int alignment) {
--	checkWidget ();
--	if ((style & SWT.SEPARATOR) != 0) return;
--	if ((alignment & (SWT.LEFT | SWT.RIGHT | SWT.CENTER)) == 0) return;
--	style &= ~(SWT.LEFT | SWT.RIGHT | SWT.CENTER);
--	style |= alignment & (SWT.LEFT | SWT.RIGHT | SWT.CENTER);
--	int bits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	/*
--	* Feature in Windows.  The windows label does not align
--	* the bitmap or icon.  Any attempt to set alignment bits
--	* such as SS_CENTER cause the label to display text.  The
--	* fix is to disallow alignment.
--	*
--	* NOTE: SS_BITMAP and SS_ICON are not single bit
--	* masks so it is necessary to test for all of the
--	* bits in these masks.
--	*/
--	if ((bits & OS.SS_BITMAP) == OS.SS_BITMAP) return;
--	if ((bits & OS.SS_ICON) == OS.SS_ICON) return;
--	bits &= ~(OS.SS_LEFTNOWORDWRAP | OS.SS_CENTER | OS.SS_RIGHT);
--	if ((style & SWT.LEFT) != 0 && (style & SWT.WRAP) == 0) {
--		bits |= OS.SS_LEFTNOWORDWRAP;
--	}
--	if ((style & SWT.CENTER) != 0) bits |= OS.SS_CENTER;
--	if ((style & SWT.RIGHT) != 0) bits |= OS.SS_RIGHT;
--	OS.SetWindowLong (handle, OS.GWL_STYLE, bits);
--	OS.InvalidateRect (handle, null, true);
--}
--
--public boolean setFocus () {
--	checkWidget();
--	return false;
--}
--
--/**
-- * Sets the receiver's image to the argument, which may be
-- * null indicating that no image should be displayed.
-- *
-- * @param image the image to display on the receiver (may be null)
-- *
-- * @exception IllegalArgumentException <ul>
-- *    <li>ERROR_INVALID_ARGUMENT - if the image has been disposed</li> 
-- * </ul>
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public void setImage (Image image) {
--	checkWidget ();
--	if ((style & SWT.SEPARATOR) != 0) return;
--	int hImage = 0, imageBits = 0, fImageType = 0;
--	if (image != null) {
--		if (image.isDisposed()) error(SWT.ERROR_INVALID_ARGUMENT);
--		hImage = image.handle;
--		switch (image.type) {
--			case SWT.BITMAP:
--				imageBits = OS.SS_BITMAP;
--				fImageType = OS.IMAGE_BITMAP;
--				break;
--			case SWT.ICON:
--				imageBits = OS.SS_ICON;
--				fImageType = OS.IMAGE_ICON;
--				break;
--			default:
--				return;
--		}
--	}
--	this.image = image;
--	RECT rect = new RECT ();
--	OS.GetWindowRect (handle, rect);
--	int newBits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	int oldBits = newBits;
--	newBits &= ~(OS.SS_BITMAP | OS.SS_ICON);
--	newBits |= imageBits | OS.SS_REALSIZEIMAGE | OS.SS_CENTERIMAGE;
--	if (newBits != oldBits) {
--		OS.SetWindowLong (handle, OS.GWL_STYLE, newBits);
--	}
--	OS.SendMessage (handle, OS.STM_SETIMAGE, fImageType, hImage);
--	/*
--	* Feature in Windows.  When STM_SETIMAGE is used to set the
--	* image for a static control, Windows either streches the image
--	* to fit the control or shrinks the control to fit the image.
--	* While not stricly wrong, neither of these is desirable.
--	* The fix is to stop Windows from stretching the image by
--	* using SS_REALSIZEIMAGE and SS_CENTERIMAGE, allow Windows
--	* to shrink the control, and then restore the control to the
--	* original size.
--	*/
--	int flags = OS.SWP_NOZORDER | OS.SWP_DRAWFRAME | OS.SWP_NOACTIVATE | OS.SWP_NOMOVE;
--	OS.SetWindowPos (handle, 0, 0, 0, rect.right - rect.left, rect.bottom - rect.top, flags);
--	OS.InvalidateRect (handle, null, true);
--}
--
--/**
-- * Sets the receiver's text.
-- * <p>
-- * This method sets the widget label.  The label may include
-- * the mnemonic character and line delimiters.
-- * </p>
-- * <p>
-- * Mnemonics are indicated by an '&amp' that causes the next
-- * character to be the mnemonic.  When the user presses a
-- * key sequence that matches the mnemonic, focus is assigned
-- * to the control that follows the label. On most platforms,
-- * the mnemonic appears underlined but may be emphasised in a
-- * platform specific manner.  The mnemonic indicator character
-- *'&amp' can be escaped by doubling it in the string, causing
-- * a single '&amp' to be displayed.
-- * </p>
-- * 
-- * @param string the new text
-- *
-- * @exception IllegalArgumentException <ul>
-- *    <li>ERROR_NULL_ARGUMENT - if the text is null</li>
-- * </ul>
-- * @exception SWTException <ul>
-- *    <li>ERROR_WIDGET_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_THREAD_INVALID_ACCESS - if not called from the thread that created the receiver</li>
-- * </ul>
-- */
--public void setText (String string) {
--	checkWidget ();
--	if (string == null) error (SWT.ERROR_NULL_ARGUMENT);
--	if ((style & SWT.SEPARATOR) != 0) return;
--	int newBits = OS.GetWindowLong (handle, OS.GWL_STYLE), oldBits = newBits;
--	newBits &= ~(OS.SS_BITMAP | OS.SS_ICON | OS.SS_REALSIZEIMAGE | OS.SS_CENTERIMAGE);
--	if ((style & SWT.LEFT) != 0 && (style & SWT.WRAP) == 0) newBits |= OS.SS_LEFTNOWORDWRAP;
--	if ((style & SWT.CENTER) != 0) newBits |= OS.SS_CENTER;
--	if ((style & SWT.RIGHT) != 0) newBits |= OS.SS_RIGHT;
--	if (newBits != oldBits) {
--		/*
--		* Bug in Windows.  When the style of a label is SS_BITMAP
--		* or SS_ICON, the label does not remember the font that is
--		* set in WM_SETFONT.  The fix is to remember the font and
--		* return the font in WM_GETFONT and to reset the font when
--		* the style is changed from SS_BITMAP or SS_ICON to a style
--		* that displays text.
--		*/
--		int hFont = OS.SendMessage (handle, OS.WM_GETFONT, 0, 0);
--		OS.SetWindowLong (handle, OS.GWL_STYLE, newBits);
--		if (hFont != 0) OS.SendMessage (handle, OS.WM_SETFONT, hFont, 0);
--	}
--	string = Display.withCrLf (string);
--	TCHAR buffer = new TCHAR (getCodePage (), string, true);
--	OS.SetWindowText (handle, buffer);
--}
--
--/*
--* Not currently used.
--*/
--void setWrap (boolean wrap) {
--	int bits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	if ((bits & (OS.SS_RIGHT | OS.SS_CENTER)) != 0) return;
--	bits &= ~OS.SS_LEFTNOWORDWRAP;
--	if (!wrap) bits |= OS.SS_LEFTNOWORDWRAP;
--	OS.SetWindowLong (handle, OS.GWL_STYLE, bits);
--	OS.InvalidateRect (handle, null, true);
--}
--
--int widgetExtStyle () {
--	int bits = super.widgetExtStyle () & ~OS.WS_EX_CLIENTEDGE;
--	if ((style & SWT.BORDER) != 0) return bits | OS.WS_EX_STATICEDGE;
--	return bits;
--}
--
--int widgetStyle () {
--	int bits = super.widgetStyle () | OS.SS_NOTIFY;
--	if ((style & SWT.SEPARATOR) != 0) return bits | OS.SS_OWNERDRAW;
--	if ((style & SWT.CENTER) != 0) return bits | OS.SS_CENTER;
--	if ((style & SWT.RIGHT) != 0) return bits | OS.SS_RIGHT;
--	if ((style & SWT.WRAP) != 0) return bits | OS.SS_LEFT;
--	return bits | OS.SS_LEFTNOWORDWRAP;
--}
--
--TCHAR windowClass () {
--	return LabelClass;
--}
--
--int windowProc () {
--	return LabelProc;
--}
--
--LRESULT WM_ERASEBKGND (int wParam, int lParam) {
--	LRESULT result = super.WM_ERASEBKGND (wParam, lParam);
--	if (result != null) return result;
--	if ((style & SWT.SEPARATOR) != 0) return LRESULT.ONE;
--	/*
--	* Bug in Windows.  When a label has the SS_BITMAP
--	* or SS_ICON style, the label does not draw the
--	* background.  The fix is to draw the background
--	* when the label is showing a bitmap or icon.
--	*
--	* NOTE: SS_BITMAP and SS_ICON are not single bit
--	* masks so it is necessary to test for all of the
--	* bits in these masks.
--	*/
--	int bits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	boolean isBitmap = (bits & OS.SS_BITMAP) == OS.SS_BITMAP;
--	boolean isIcon = (bits & OS.SS_ICON) == OS.SS_ICON;
--	if (isBitmap || isIcon) {
--		drawBackground (wParam);
--		return LRESULT.ONE;
--	}
--	return result;
--}
--
--LRESULT WM_GETFONT (int wParam, int lParam) {
--	LRESULT result = super.WM_GETFONT (wParam, lParam);
--	if (result != null) return result;
--	/*
--	* Bug in Windows.  When the style of a label is SS_BITMAP
--	* or SS_ICON, the label does not remember the font that is
--	* set in WM_SETFONT.  The fix is to remember the font and
--	* return the font in WM_GETFONT.
--	*/
--	if (font == 0) font = defaultFont ();
--	return new LRESULT (font);
--}
--
--LRESULT WM_SETFONT (int wParam, int lParam) {
--	/*
--	* Bug in Windows.  When the style of a label is SS_BITMAP
--	* or SS_ICON, the label does not remember the font that is
--	* set in WM_SETFONT.  The fix is to remember the font and
--	* return the font in WM_GETFONT.
--	*/
--	return super.WM_SETFONT (font = wParam, lParam);
--}
--
--LRESULT WM_SIZE (int wParam, int lParam) {
--	LRESULT result = super.WM_SIZE (wParam, lParam);
--	/*
--	* It is possible (but unlikely), that application
--	* code could have disposed the widget in the resize
--	* event.  If this happens, end the processing of the
--	* Windows message by returning the result of the
--	* WM_SIZE message.
--	*/
--	if (isDisposed ()) return result;
--	if ((style & SWT.SEPARATOR) != 0) {
--		OS.InvalidateRect (handle, null, true);
--		return result;
--	}
--	
--	/*
--	* Bug in Windows.  For some reason, a label with
--	* SS_BITMAP or SS_ICON and SS_CENTER does not redraw
--	* properly when resized.  Only the new area is drawn
--	* and the old area is not cleared.  The fix is to
--	* force the redraw.
--	*
--	* NOTE: SS_BITMAP and SS_ICON are not single bit
--	* masks so it is necessary to test for all of the
--	* bits in these masks.
--	*/
--	int bits = OS.GetWindowLong (handle, OS.GWL_STYLE);
--	boolean isBitmap = (bits & OS.SS_BITMAP) == OS.SS_BITMAP;
--	boolean isIcon = (bits & OS.SS_ICON) == OS.SS_ICON;
--	if (isBitmap || isIcon) {
--		OS.InvalidateRect (handle, null, true);
--		return result;
--	}
--		
--	/*
--	* Bug in Windows.  For some reason, a label with
--	* style SS_LEFT, SS_CENTER or SS_RIGHT does not
--	* redraw the text in the new position when resized.
--	* Note that SS_LEFTNOWORDWRAP does not have the
--	* problem.  The fix is to force the redraw.
--	*/
--	if ((style & (SWT.WRAP | SWT.CENTER | SWT.RIGHT)) != 0) {
--		OS.InvalidateRect (handle, null, true);
--		return result;
--	}
--	
--	return result;
--}
--
--LRESULT wmDrawChild (int wParam, int lParam) {
--	DRAWITEMSTRUCT struct = new DRAWITEMSTRUCT ();
--	OS.MoveMemory (struct, lParam, DRAWITEMSTRUCT.sizeof);
--	drawBackground (struct.hDC);
--	if ((style & SWT.SHADOW_NONE) != 0) return null;
--	RECT rect = new RECT ();
--	int lineWidth = OS.GetSystemMetrics (OS.SM_CXBORDER);
--	int flags = OS.EDGE_ETCHED;
--	if ((style & SWT.SHADOW_IN) != 0) flags = OS.EDGE_SUNKEN;
--	if ((style & SWT.HORIZONTAL) != 0) {
--		int bottom = struct.top + Math.max (lineWidth * 2, (struct.bottom - struct.top) / 2);
--		OS.SetRect (rect, struct.left, struct.top, struct.right, bottom);
--		OS.DrawEdge (struct.hDC, rect, flags, OS.BF_BOTTOM);
--	} else {
--		int right = struct.left + Math.max (lineWidth * 2, (struct.right - struct.left) / 2);
--		OS.SetRect (rect, struct.left, struct.top, right, struct.bottom);
--		OS.DrawEdge (struct.hDC, rect, flags, OS.BF_RIGHT);
--	}
--	return null;
--}

end -- class LABEL
