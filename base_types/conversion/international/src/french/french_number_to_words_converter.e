indexing
	description: "Objet qui convertit un nombre dans sa représentation en mots"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 11:11:14 $"
	revision: "$Revision: 1.1 $"

class
	FRENCH_NUMBER_TO_WORDS_CONVERTER

inherit
	EINT_NUMBER_TO_WORDS_CONVERTER

	PLATFORM
		export
				{NONE} all
		end
feature -- Basic operations

	convert (a_number: DOUBLE) is
			-- Convert `a_number' into it's representation in words.
		local
			milliard,million,mille,unite,centime,vingt,cent: INTEGER
			estring: ESTRING
			a_double: DOUBLE
		do
			!!estring.make (200)

			if a_number < 0.0 then
				estring.string.append_string ("MOINS ")
				a_double := a_number.abs 
			else
				a_double := a_number
			end

			if a_double  > (2.0 ^ (integer_bits - 1)) then
				estring.string.append_string ("**")
				estring.string.append_string (a_double.out)
				estring.string.append_string (" > ")
				estring.string.append_string ((2.0 ^ (integer_bits - 1)).out)

			else
				if a_double = 0.0 then
					estring.string.append_string ("ZERO")
				else
					centime := ((a_double - a_double.truncated_to_integer) * 100).rounded

					milliard := (a_double / 1000000000).truncated_to_integer
					a_double := a_double.truncated_to_integer \\ 1000000000

					million := (a_double / 1000000).truncated_to_integer
					a_double := a_double.truncated_to_integer \\ 1000000

					mille := (a_double / 1000).truncated_to_integer
					a_double := a_double.truncated_to_integer \\ 1000

					unite := a_double.truncated_to_integer
					vingt := a_double.truncated_to_integer \\ 100

					cent := (a_double / 100).truncated_to_integer

					if milliard /= 0 then
						estring.append_string (converted_in_range_1_999 (milliard) )
						if milliard > 1 then 
							estring.string.append_string ("MILLIARDS ")
						else
							estring.string.append_string ("MILLIARD ")
						end
					end
	
					if million /= 0 then
						estring.append_string (converted_in_range_1_999 (million))
						if million > 1 then
							estring.string.append_string ("MILLIONS ")
						else	
							estring.string.append_string ("MILLION ")
						end
					end

					if mille >= 2 then
						estring.append_string (converted_in_range_1_999 (mille))
					end

					if mille >= 1 then
						estring.string.append_string ("MILLE ")
					end

					if unite /= 0 then
						estring.append_string (converted_in_range_1_999 (unite))
						if (cent > 1 and vingt = 0) or vingt = 80 then
							estring.put ('S', estring.count)
							estring.append_character (' ')
						end
					end

					if centime /= 0 then
						estring.string.append_string ("VIRGULE ")
						estring.append_string (converted_in_range_1_999 (centime))
					end
				end
				estring.prune_all_trailing (' ')
			end
			last_converted := estring.string	
		end

feature {NONE} -- Implementation

	converted_in_range_1_999 (an_integer: INTEGER): ESTRING is
			-- `an_integer (in range 1-999) converted in words.
		require
			in_range: an_integer >= 1 and an_integer <= 999
		local
			cent, vingt, e0, e1: INTEGER
		do
			!!Result.make (80)
			cent := an_integer // 100
			vingt := an_integer \\ 100
			e0 := an_integer \\ 10
			e1 := (an_integer // 10) \\ 10

			if cent > 0 then
				if cent > 1 then
					Result.string.append_string (unites.item (cent))
					Result.append_character (' ')
				end
				Result.string.append_string ("CENT ")
			end

			if vingt >= 20 then
				Result.string.append_string (dizaines.item (e1))
				if e0 = 0 then 
					Result.append_character (' ')
				else
					if e0 = 1 and  e1 /= 8 then
						Result.string.append_string (" ET ")
					else
						Result.append_character ('-')
					end
				end
			end

			if ( vingt > 0 and (vingt < 20 or e0 /= 0)) then
				if vingt < 20 then
					Result.string.append_string (unites.item (vingt))
				else
					Result.string.append_string (unites.item (e0))
				end
				Result.append_character (' ')
			end
		end

	unites: ARRAY [STRING] is
			-- Unites en francais.
		once
			Result := << "UN", "DEUX", "TROIS", "QUATRE", "CINQ", "SIX", "SEPT", "HUIT", "NEUF", "DIX", "ONZE", "DOUZE", "TREIZE", "QUATORZE", "QUINZE", "SEIZE", "DIX-SEPT", "DIX-HUIT", "DIX-NEUF" >> 
		end

	dizaines: ARRAY [STRING] is
			-- Dizaines en francais.
		once
			Result := << "DIX", "VINGT", "TRENTE", "QUARANTE", "CINQUANTE", "SOIXANTE", "SEPTANTE", "QUATRE-VINGT", "NONANTE" >>
		end

end -- class FRENCH_NUMBER_TO_WORDS_CONVERTER

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--