indexing
	description: "Page-tree node."
	author: ""
	date: "$Date: 2002/03/20 15:19:06 $"
	revision: "$Revision: 1.1 $"

deferred class
	PDF_PAGE_TREE_NODE

inherit
	PDF_OBJECT
		rename
		export
		undefine
			make, is_equal, copy
		redefine
		select
		end

feature {PDF_OBJECT} -- Access

	parent : PDF_PAGES

feature {PDF_OBJECT} -- Measurement

	count : INTEGER is
			-- count of leafs
		deferred
		end

	kids : DS_LIST [PDF_PAGE_TREE_NODE] is
			-- kids of this node
		require
			not_leaf: not is_page
		deferred
		end
		
feature -- Status report

	is_page : BOOLEAN is
			-- is this a page (leaf)
		deferred
		end
		
	is_tree_node : BOOLEAN is
			-- is this a pages tree node (by contrast to a leaf).
		do
			Result := not is_page
		end
		
feature {PDF_OBJECT} -- Element change

	set_parent (a_parent : PDF_PAGES) is
			-- 
		require
			exists: a_parent /= Void
			acyclic: a_parent.to_tree_node /= Current
		do
			parent := a_parent
		ensure
			parent = a_parent
		end

	add_kid (a_kid : PDF_PAGE_TREE_NODE) is
			-- add `a_page' page as last kid
		require
			a_kid /= Void
			not_leaf: not is_page
		local
			current_pages : PDF_PAGES
		do
			current_pages ?= Current
			check
				current_pages /= Void
			end
			a_kid.set_parent (current_pages)
			kids.put_last (a_kid)
		ensure
			kids.has (a_kid) and a_kid.parent = Current
		end

feature  {PDF_OBJECT} -- Conversion

	to_tree_node : PDF_PAGE_TREE_NODE is
			-- 
		do
			Result := Current
		end
		
end -- class PDF_PAGE_TREE_NODE
