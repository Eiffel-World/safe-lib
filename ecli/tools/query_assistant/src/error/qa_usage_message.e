indexing

	description:

			"Usage messages."

	library: "ECLI : Eiffel Call Level Interface (ODBC) Library. Project SAFE."
	copyright: "Copyright (c) 2001-2006, Paul G. Crismer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2010/11/30 15:51:13 $"

class QA_USAGE_MESSAGE

inherit
	QA_ERROR

create
	make

feature -- Initialization

	make (has_expat : BOOLEAN) is
		do
			default_template := usage_template
			create parameters.make (1, 2)
			parameters.put (argument_list, 1)
			if has_expat then
				parameters.put (has_expat_option, 2)
			else
				parameters.put (without_expat_option, 2)
			end
		end

feature {NONE} -- Implementation

	usage_template : STRING is "usage: $0 $2 $1"

	argument_list : STRING is "-input <input-file> -output_dir <output-directory> %
			 % -dsn <data-source-name> -user <user-name> -pwd <password> [-catalog <catalog>] [-schema <schema>] %
			 % [-access_routines_prefix <prefix> [-no_prototype]] [-max_length <max_length_for_long_data>] [-use_decimal] [-parent_cursor <class_name>] [-parent_modify <class_name> ][-force_string][-straight][-allow_integer_64][-allow_decimal]"

	has_expat_option : STRING is "(-expat|-eiffel)"
	without_expat_option : STRING is "-eiffel"

end -- class QA_USAGE_MESSAGE
