indexing
	description: 
	
		"[
			Instances of this class provide a bridge between application
			code and assistive technology clients. Many platforms provide
			default accessible behavior for most widgets, and this class
			allows that default behavior to be overridden. Applications
			can get the default Accessible object for a control by sending
			it <code>getAccessible</code>, and then add an accessible listener
			to override simple items like the name and help string, or they
			can add an accessible control listener to override complex items.
			As a rule of thumb, an application would only want to use the
			accessible control listener to implement accessibility for a
			custom control.
		]"
		
	author: ""
	date: "$Date: 2004/07/06 20:15:17 $"
	revision: "$Revision: 1.1 $"

class
	ABSTRACT_ACCESSIBLE

feature -- Access

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

end -- class ABSTRACT_ACCESSIBLE
