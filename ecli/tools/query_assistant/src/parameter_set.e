indexing
	description: "Sets of parameters of an access modules"

	library: "Access_gen : Access Modules Generators utilities"
	
	author: "Paul G. Crismer"
	date: "$Date: 2003/08/19 15:58:07 $"
	revision: "$Revision: 1.5 $"

class
	PARAMETER_SET

inherit
	COLUMN_SET[MODULE_PARAMETER]
		redefine
			make
		end

creation
	make, make_with_parent_name
	
feature {NONE} -- Initialization

	make (a_name: STRING) is
		do
			Precursor (a_name)
			set_equality_tester (create {KL_EQUALITY_TESTER [MODULE_PARAMETER]})
		end

feature -- Status report

	has_samples : BOOLEAN is
			-- has this parameter set samples for all the parameters ?
		local
			sc : DS_SET_CURSOR[MODULE_PARAMETER]
		do
			from
				sc := new_cursor
				sc.start
				Result := True
			until
				sc.off
			loop
				Result := Result and sc.item.has_sample
				sc.forth
			end
		end
		
end -- class PARAMETER_SET
--
-- Copyright: 2000-2003, Paul G. Crismer, <pgcrism@users.sourceforge.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
