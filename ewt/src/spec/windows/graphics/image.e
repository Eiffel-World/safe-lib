indexing
	description: 
	
		"[
			Objects that ...
		]"

	author: ""
	date: "$Date: 2004/08/30 19:41:21 $"
	revision: "$Revision: 1.2 $"

class
	IMAGE

inherit
	ABSTRACT_IMAGE

feature -- Access

	transparent_pixel : INTEGER is do Result := -1 end
	
	handle : POINTER

	get_bounds : RECTANGLE is
--/**
-- * Returns the bounds of the receiver. The rectangle will always
-- * have x and y values of 0, and the width and height of the
-- * image.
-- *
-- * @return a rectangle specifying the image's bounds
-- *
-- * @exception SWTException <ul>
-- *    <li>ERROR_GRAPHIC_DISPOSED - if the receiver has been disposed</li>
-- *    <li>ERROR_INVALID_IMAGE - if the image is not a bitmap or an icon</li>
-- * </ul>
-- */
--public Rectangle getBounds() {
		do
--	if (isDisposed()) SWT.error(SWT.ERROR_GRAPHIC_DISPOSED);
--	switch (type) {
--		case SWT.BITMAP:
--			BITMAP bm = new BITMAP();
--			OS.GetObject(handle, BITMAP.sizeof, bm);
--			return new Rectangle(0, 0, bm.bmWidth, bm.bmHeight);
--		case SWT.ICON:
--			if (OS.IsWinCE) {
--				return new Rectangle(0, 0, data.width, data.height);
--			} else {
--				ICONINFO info = new ICONINFO();
--				OS.GetIconInfo(handle, info);
--				int hBitmap = info.hbmColor;
--				if (hBitmap == 0) hBitmap = info.hbmMask;
--				bm = new BITMAP();
--				OS.GetObject(hBitmap, BITMAP.sizeof, bm);
--				if (hBitmap == info.hbmMask) bm.bmHeight /= 2;
--				if (info.hbmColor != 0) OS.DeleteObject(info.hbmColor);
--				if (info.hbmMask != 0) OS.DeleteObject(info.hbmMask);
--				return new Rectangle(0, 0, bm.bmWidth, bm.bmHeight);
--			}
--		default:
--			SWT.error(SWT.ERROR_UNSUPPORTED_FORMAT);
--			return null;
--	}
--}
		end
		
feature -- Measurement

feature -- Status report

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

invariant
	invariant_clause: True -- Your invariant here

end -- class IMAGE
