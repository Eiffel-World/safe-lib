indexing
	description: 
	
		"[
			 Instances of this class manage the operating system resources that
			 implement SWT's RGB color model. To create a color you can either
			 specify the individual color components as integers in the range 
			 0 to 255 or provide an instance of an <code>RGB</code>. 
			 
			 Application code must explicitly invoke the <code>Color.dispose_resource</code> 
			 method to release the operating system resources managed by each instance
			 when those instances are no longer required.
		]"
		
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

deferred class
	ABSTRACT_COLOR

inherit
	DISPOSABLE_RESOURCE
	
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
		require
			a_device_not_void: a_device /= Void
			a_red_within_limits: 0 <= a_red and a_red <= 255
			a_green_within_limits: 0 <= a_green and a_green <= 255
			a_blue_within_limits: 0 <= a_blue and a_blue <= 255
		deferred
		end
		
	init (a_device : DEVICE; a_red, a_green, a_blue : INTEGER) is
			-- Allocates the OS resources
		require
			a_device_not_void: a_device /= Void
			a_red_within_limits: 0 <= a_red and a_red <= 255
			a_green_within_limits: 0 <= a_green and a_green <= 255
			a_blue_within_limits: 0 <= a_blue and a_blue <= 255
		deferred
		end
		
feature -- Access

	device : DEVICE is
			-- Device where this color was created.
		deferred
		end
		
	get_red : INTEGER is
			-- The amount of red.
		deferred
		ensure
			color_within_limits: 0 <= Result and Result <= 255
		end

	get_green : INTEGER is
			-- Amount of green.
		deferred
		ensure
			color_within_limits: 0 <= Result and Result <= 255
		end

	get_blue : INTEGER is
			-- Amount of blue.
		deferred
		ensure
			color_within_limits: 0 <= Result and Result <= 255
		end
		
	get_rgb : RGB is
			-- Corresponding RGB.
		deferred
		ensure
			rgb_not_void: Result /= Void
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

end -- class ABSTRACT_COLOR
