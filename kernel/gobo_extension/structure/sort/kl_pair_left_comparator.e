indexing

	description: 
	
		"Objects that compare the first element of DS_PAIRs"

	author: "Paul G. Crismer"
	date: "$Date: 2007/11/15 10:02:10 $"
	revision: "$Revision: 1.2 $"

class
	KL_PAIR_FIRST_COMPARATOR [G,K]

inherit
	KL_COMPARATOR [DS_PAIR[G,K]]
	
create
	make
	
feature {NONE} -- Initialization

	make (a_comparator : like first_comparator) is
		require
			a_comparator_not_void: a_comparator /= Void
		do
			first_comparator := a_comparator
		ensure
			first_comparator_set: first_comparator = a_comparator
		end
		
feature -- Access

	first_comparator : KL_COMPARATOR [G]
	
feature -- Status report

	less_than (a, b : DS_PAIR[G,K]) : BOOLEAN is
		do
			Result := first_comparator.less_than (a.first, b.first)
		end

invariant

	first_comparator_not_void: first_comparator /= Void

end -- class KL_PAIR_LEFT_COMPARATOR
