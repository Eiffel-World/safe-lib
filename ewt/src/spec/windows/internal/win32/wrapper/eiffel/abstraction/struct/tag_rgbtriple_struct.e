-- This file has been generated by EWG. Do not edit. Changes will be lost!
class TAG_RGBTRIPLE_STRUCT

inherit

	EWG_STRUCT

	TAG_RGBTRIPLE_STRUCT_EXTERNAL
		export
			{NONE} all
		end

creation

	make_new_unshared,
	make_new_shared,
	make_unshared,
	make_shared

feature {NONE} -- Implementation

	sizeof: INTEGER is
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	get_rgbtblue: INTEGER is
			-- Access member `rgbtBlue'
		do
			Result := get_rgbtblue_external (item)
		end

	set_rgbtblue (a_value: INTEGER) is
			-- Set member `rgbtBlue'
		do
			set_rgbtblue_external (item, a_value)
		ensure
			a_value_set: a_value = get_rgbtblue
		end

	get_rgbtgreen: INTEGER is
			-- Access member `rgbtGreen'
		do
			Result := get_rgbtgreen_external (item)
		end

	set_rgbtgreen (a_value: INTEGER) is
			-- Set member `rgbtGreen'
		do
			set_rgbtgreen_external (item, a_value)
		ensure
			a_value_set: a_value = get_rgbtgreen
		end

	get_rgbtred: INTEGER is
			-- Access member `rgbtRed'
		do
			Result := get_rgbtred_external (item)
		end

	set_rgbtred (a_value: INTEGER) is
			-- Set member `rgbtRed'
		do
			set_rgbtred_external (item, a_value)
		ensure
			a_value_set: a_value = get_rgbtred
		end

end