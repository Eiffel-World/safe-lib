indexing
	description	: "System's root class"
	note		: "Initial version automatically generated"

class
	HELLO

creation
	make

feature -- Initialization

	make is
			-- Creation procedure.
		local
			a_shell : SHELL
			a_display : DISPLAY
		do
			Create a_display.make
			Create a_shell.make_by_display (a_display)
		end

end -- class HELLO
