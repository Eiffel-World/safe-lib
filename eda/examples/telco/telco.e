indexing
	description	: "Telco benchmarks root class. Application of General Decimal Arithmetic Specification in Eiffel."

	library: "EDA"
	author: "Paul G. Crismer"
	
	date: "$Date: 2007/11/15 10:01:57 $"
	revision: "$Revision: 1.6 $"
	licensing: "See notice at end of class"

class TELCO

inherit

	KL_SHARED_FILE_SYSTEM

	DT_SHARED_SYSTEM_CLOCK

	KL_SHARED_ARGUMENTS
	
	KL_SHARED_EXCEPTIONS

	MA_DECIMAL_MATH
	
create

	make

feature -- Initialization

	make is
			-- Creation procedure.
		do
			io.put_string ("-- telco application %N-- %N-- Benchmark for Decimal Arithmetic%N")
			io.put_string ("--%N-- Eiffel implementation - EDA library%N--%N")
			process_parameters
			if arguments_ok then
				do_benchmark
			else
				print_usage
			end
		end
	
feature -- Access

	number_count : INTEGER

	long_distance_count : INTEGER
	
	input_file : KL_BINARY_INPUT_FILE

	output_file : KL_TEXT_OUTPUT_FILE

	default_context : MA_DECIMAL_CONTEXT

	last_number : MA_DECIMAL

	last_nibble : INTEGER
	
	input_file_name : STRING

	output_file_name : STRING
	
	arguments_ok : BOOLEAN

	tax, calculate : BOOLEAN
		
feature -- Basic operations

	print_usage is
			-- Print usage message.
		do
			io.put_string ("Usage : telco [-input <filename>] [-output <filename>] [-nocalc] [-notax] %N")
			io.put_string ( "%T[-input <filename>]    Use <filename> as input,%N%
					%%T[-output <filename>]   Use <filename> as output,%N%
					%%T[-nocalc]              Do not calculate; reading/writing only,%N%
					%%T[-notax]               Do not calculate tax.%N")
		end
		
	do_benchmark is
			-- Do actual benchmarks.
		local
			sum_t, sum_b, sum_d : MA_DECIMAL
			number, price, base_tax, distance_tax, total_price : MA_DECIMAL
			base_rate, distance_rate : MA_DECIMAL
			base_tax_rate, distance_tax_rate : MA_DECIMAL
			price_context,  tax_context : MA_DECIMAL_CONTEXT
			long_distance : BOOLEAN
			t_start, t_end : DT_TIME				
		do
			--| establish math contexts
			create price_context.make_double
			price_context.set_digits (31)
			price_context.set_rounding_mode (price_context.Round_half_even)
			tax_context := clone (price_context)
			tax_context.set_rounding_mode (tax_context.Round_down)
			create default_context.make_double
			default_context.set_digits (31)
			
			--| create rates
			create base_rate.make_from_string_ctx ("0.0013", default_context)
			create distance_rate.make_from_string_ctx ("0.00894", default_context)
			create base_tax_rate.make_from_string_ctx ("0.0675", default_context)
			create distance_tax_rate.make_from_string_ctx ("0.0341", default_context) 			
			--| start measuring
			t_start := system_clock.time_now
			
			sum_t := base_rate.zero
			sum_b := base_rate.zero
			sum_d := base_rate.zero
			
			--| open files
			create input_file.make (input_file_name)
			create output_file.make (output_file_name)
			input_file.open_read
			output_file.open_write
			--| read file
			if input_file.is_open_read and then output_file.is_open_write then
				from
					read_number_from_bcd (input_file)
				until
					input_file.end_of_input
				loop
					number := last_number
					if calculate then
						long_distance := last_nibble \\ 2 = 1
						--| 1. Price
						set_shared_decimal_context (default_context)
						if long_distance then
							price := number * distance_rate
							long_distance_count := long_distance_count + 1
						else
							price := number * base_rate
						end
						price := price.rescale (-2, price_context)			
						if tax then
							--| 2. Basic tax
							set_shared_decimal_context (tax_context)
							base_tax := price * base_tax_rate
							base_tax := base_tax.rescale (-2, tax_context)
							sum_b := sum_b + base_tax
							total_price := price + base_tax					
							--| 3. Long distance calls
							if long_distance then
								distance_tax := price * distance_tax_rate
								distance_tax := distance_tax.rescale (-2, tax_context)
								sum_d := sum_d + distance_tax
								--| 4. total price
								total_price := total_price + distance_tax
							end
						else
							total_price := price
						end
						--| 5. compute totals
						sum_t := sum_t.add (total_price, tax_context)
						output_file.put_string (total_price.to_scientific_string)
						output_file.put_new_line
					else
						total_price := number
						output_file.put_string ("123456")
						output_file.put_new_line
					end
					--| 6. put string total
					--| read again
					read_number_from_bcd (input_file)				
				end			
				input_file.close
				output_file.close
			else
				io.put_string ("Error opening file : ")
				if not input_file.is_open_read then
					io.put_string (input_file.name)
				end
				if not output_file.is_open_write then
					io.put_string (output_file.name)
				end
				io.put_string ("%N")
			end	
			t_end := system_clock.time_now
			io.put_integer (number_count) io.put_string (" Numbers processed, with ") io.put_integer (long_distance_count) io.put_string (" long distance calls%N")
			io.put_string ("%NDuration : ") io.put_string ((t_end - t_start).to_canonical.precise_out) io.put_string ("  - hour:minute:second.millisecond%N")
			io.put_string ("%N%Tsum_t = ") io.put_string (sum_t.to_scientific_string) io.put_new_line
			io.put_string ("%Tsum_b = ") io.put_string (sum_b.to_scientific_string) io.put_new_line
			io.put_string ("%Tsum_d = ") io.put_string (sum_d.to_scientific_string) io.put_new_line

		end

	process_parameters is
		local
			telco_path : KL_PATHNAME
			eda_path_string, telco_path_string : STRING
			environment : KL_EXECUTION_ENVIRONMENT
			index : INTEGER
			arg : STRING
		do
			arguments_ok := True
			create environment
			eda_path_string := environment.variable_value ("EDA")
			telco_path ?= File_system.string_to_pathname (eda_path_string)
			telco_path.append_names (<<"examples", "telco">>)
			telco_path_string := File_system.pathname_to_string (telco_path)
			input_file_name := File_system.pathname (telco_path_string, "telco.test")
			output_file_name := File_system.pathname (telco_path_string, "telco.outc")
			tax := True
			calculate := True
			from
				index := 1
			until
				not arguments_ok or else index > Arguments.Argument_count
			loop
				arg := Arguments.argument (index)
				if arg.is_equal ("-input") then
					if index + 1 <= Arguments.argument_count then
						input_file_name := Arguments.argument (index + 1)
						if file_system.is_relative_pathname (input_file_name) then
							input_file_name := File_system.pathname (telco_path_string, input_file_name)
						end
						index := index + 2
					else
						io.put_string ("Expected input filename !")
						arguments_ok := False
					end
				elseif arg.is_equal ("-output") then
					if index + 1 <= Arguments.argument_count then
						output_file_name := Arguments.argument (index + 1)
						if file_system.is_relative_pathname (output_file_name) then
							output_file_name := File_system.pathname (telco_path_string, output_file_name)
						end
						index := index + 2
					else
						io.put_string ("Expected output filename !")
						arguments_ok := False
					end					
				elseif arg.is_equal ("-nocalc") then
					calculate := False
					index := index + 1
				elseif arg.is_equal ("-notax") then
					tax := False
					index := index + 1
				else
					arguments_ok := False
					io.put_string ("Unknown argument : '")
					io.put_string (arg)
					io.put_string ("'")
					io.put_new_line
				end
			end
		end
		
	read_number_from_bcd (a_file : KL_BINARY_INPUT_FILE) is
			-- Read number in `last_number' from packed decimal representation.
		local
			packed_string, number_string : STRING
			index : INTEGER
			lo, hi, l_count, zero_code, c_code : INTEGER
			c : CHARACTER
		do
			a_file.read_string (8)
			if not a_file.end_of_input then
				if calculate then
					packed_string := a_file.last_string
					bcd_parser.parse (packed_string)
					if not bcd_parser.error then
						last_number := bcd_parser.last_decimal
					else
						exceptions.raise ("Invalid file format : need 8 bytes packed decimal")						
					end
					last_nibble := bcd_parser.last_nibble
				else
					last_number := zero
				end
				number_count := number_count + 1
			end
		end

	bcd_parser : MA_DECIMAL_BCD_PARSER is
		once
			create Result
		end
		
	
end


