indexing

	description:

		"Basic Mathematical operations that are not portable"

	library: "Eiffel Wrapper Generator Library"
	copyright: "Copyright (c) 1999, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2003/12/29 16:54:52 $"
	revision: "$Revision: 1.1 $"

class
	EWG_DOUBLE_MATH

inherit








feature 


	pi_constant: DOUBLE is  3.1415926535897932384626

	cosine (v: DOUBLE): DOUBLE is
		do
			Result := v.cos
		end

	sine (v: DOUBLE): DOUBLE is
		do
			Result := v.sin
		end

	floor (v: DOUBLE): DOUBLE is
		do
			Result := v.floor
		end







end



