indexing
	description: "Routines that give access to C memory."
	author: "Paul G. Crismer"
	
	library: "XS_C : eXternal Support C"
	
	date: "$Date: 2003/08/26 19:34:50 $"
	revision: "$Revision: 1.2 $"
	licensing: "See notice at end of class"

class
	XS_C_MEMORY_ROUTINES

feature {NONE} -- Implementation

	c_memory_put_char (pointer : POINTER; c : CHARACTER)  is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_put_char"
		ensure
			char_set: c_memory_get_char (pointer) = c
		end

	c_memory_put_int8 (pointer : POINTER; v : INTEGER)  is
		require
			valid_pointer: pointer /= default_pointer
			int8_limits: v >= -256 and v < 256
		external "C"
		alias "c_memory_put_int8"
		ensure
			int8_set: c_memory_get_int8 (pointer) = v
		end

	c_memory_put_int16 (pointer : POINTER; v : INTEGER) is
		require
			valid_pointer: pointer /= default_pointer
			int16_limits: v >= -16384 and v < 16384
		external "C"
		alias "c_memory_put_int16"
		ensure
			int16_set: c_memory_get_int16 (pointer) = v
		end

	c_memory_put_uint8 (pointer : POINTER; v : INTEGER)  is
		require
			valid_pointer: pointer /= default_pointer
			uint8_limits: v >= 0 and v < 256 
		external "C"
		alias "c_memory_put_uint8"
		ensure
			uint8_set: c_memory_get_uint8 (pointer) = v
		end

	c_memory_put_uint16 (pointer : POINTER; v : INTEGER) is
		require
			valid_pointer: pointer /= default_pointer
			uint16_limits: v >= 0 and v < 65536
		external "C"
		alias "c_memory_put_uint16"
		ensure
			uint16_set: c_memory_get_uint16 (pointer) = v
		end

	c_memory_put_int32 (pointer : POINTER; v : INTEGER) is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_put_int32"
		ensure
			int32_set: c_memory_get_int32 (pointer) = v
		end

	c_memory_put_real (pointer : POINTER; v : REAL)  is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_put_real"
		ensure
			real_set: c_memory_get_real (pointer) = v
		end

	c_memory_put_double (pointer : POINTER; v : DOUBLE) is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_put_double"
		ensure
			double_set: c_memory_get_double (pointer) = v
		end

	c_memory_put_pointer (pointer : POINTER; v : POINTER) is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_put_pointer"
		ensure
			pointer_set: c_memory_get_pointer (pointer) = v
		end

	c_memory_get_char (pointer : POINTER) : CHARACTER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_char"
		end

	c_memory_get_int8 (pointer : POINTER) : INTEGER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_int8"
		end

	c_memory_get_int16 (pointer : POINTER) : INTEGER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_int16"
		end

	c_memory_get_uint8 (pointer : POINTER) : INTEGER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_uint8"
		end

	c_memory_get_uint16 (pointer : POINTER) : INTEGER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_uint16"
		end

	c_memory_get_int32 (pointer : POINTER) : INTEGER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_int32"
		end

	c_memory_get_real (pointer : POINTER) : REAL is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_real"
		end

	c_memory_get_double (pointer : POINTER) : DOUBLE is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_double"
		end

	c_memory_get_pointer (pointer : POINTER) : POINTER is
		require
			valid_pointer: pointer /= default_pointer
		external "C"
		alias "c_memory_get_pointer"
		end

end -- class XS_C_MEMORY_ROUTINES
--
-- Copyright: 2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
