indexing
	description: "Objects that ..."
	author: ""
	date: "$Date: 2007/11/15 10:02:08 $"
	revision: "$Revision: 1.2 $"

class
	COLOR

inherit
	ABSTRACT_COLOR
	
create
	make
	
feature -- Initialization

	make (a_device : DEVICE; a_red, a_green, a_blue : INTEGER) is
			-- Constructs a new instance of this class given a device and the
			-- desired red, green and blue values expressed as ints in the range
			-- 0 to 255 (where 0 is black and 255 is full brightness). On limited
			-- color devices, the color instance created by this call may not have
			-- the same RGB values as the ones specified by the arguments. The
			-- RGB values on the returned instance will be the color values of 
			-- the operating system color.
			-- You must dispose the color when it is no longer required. 
		do
--FIXME
		end
		
	init (a_device : DEVICE; a_red, a_green, a_blue : INTEGER) is
			-- Allocates the OS resources
		do
--FIXME
		end
		
feature -- Access

	device : DEVICE
		
	get_red : INTEGER is
			-- The amount of red.
		do
--FIXME
		end

	get_green : INTEGER is
			-- Amount of green.
		do
--FIXME
		end

	get_blue : INTEGER is
			-- Amount of blue.
		do
--FIXME
		end
		
	get_rgb : RGB is
			-- Corresponding RGB.
		do
--FIXME
		end
		
feature -- Measurement

feature -- Status report

	is_resource_disposed : BOOLEAN is
		do
--FIXME
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

	dispose_resource is
		do
--FIXME
		end

		
feature -- Obsolete

feature -- Inapplicable

	win32_new (a_device : DEVICE; a_handle : POINTER) : COLOR is
		do
--FIXME
		end
		
feature {NONE} -- Implementation

end -- class COLOR
