indexing
class
	TEST_DECIMAL_ECLI

creation
	make
	
feature
	make is 
		local
			nm : ECLI_NAMED_METADATA
			my_decimal, ten : EDA_DECIMAL
			ctx : EDA_MATH_CONTEXT
			insert : ECLI_STATEMENT
			table_exists : BOOLEAN
		do 
			create session.make ("Northwind", "","");

--			create session.make ("firebird", "","");
--			create session.make ("ecli_db", "","");
			session.connect
			if session.is_connected then
				create stmt.make (session)
				create nm.make (Void, Void, "TEST_DECIMAL");
				create tables_cursor.make (nm, session)
				tables_cursor.start
				table_exists := not tables_cursor.off
				tables_cursor.close
				if table_exists then
					stmt.set_sql ("drop table TEST_DECIMAL")
					stmt.execute
				else
				end
				tables_cursor := Void
				--| create table and populate
				stmt.set_sql ("[
create table TEST_DECIMAL (d18 NUMERIC(18,0), d182 NUMERIC (18,2), dl83 NUMERIC (18,3), d184 NUMERIC(18,4))
]")
--				stmt.set_sql ("[
--create table TEST_DECIMAL (d18 DECIMAL(18,0), d182 DECIMAL (18,2), dl83 DECIMAL (5,3), d184 DECIMAL(18,4))
--]")
--					stmt.set_sql ("[
--	create table TEST_DECIMAL (d18 CURRENCY, d182 CURRENCY, dl83 CURRENCY, d184 CURRENCY)
--	]")
				stmt.execute
				if stmt.is_ok then
					-- populate
					stmt.set_sql ("insert into TEST_DECIMAL VALUES (123456789012345678,'1234567890123456.78', '25.212', '12345678901234.5678')")
					stmt.execute
					stmt.go_after
				end
				create decimal_18_0.make(19,0)
				create decimal_18_2.make(18,2)
				create decimal_5_3.make (5,3)
				create decimal_18_4.make(18,4)
				
				--| 1 insert
				create ctx.make (189,0)
				create my_decimal.make_from_string_ctx ("1234567890123456.78", ctx)
				my_decimal.set_shared_decimal_context (ctx)
				create ten.make_from_integer (10)
				decimal_18_0.set_from_decimal (my_decimal)
				my_decimal := my_decimal / ten
				decimal_18_2.set_from_decimal (my_decimal)
				my_decimal := my_decimal / ten
				decimal_18_4.set_from_decimal (my_decimal)
				create insert.make (session)
				insert.set_sql ("insert into TEST_DECIMAL (d18) VALUES (?)")
				test_insert (insert, decimal_18_0)
				insert.set_sql ("insert into TEST_DECIMAL (d182) VALUES (?)")
				test_insert (insert, decimal_18_2)
				insert.set_sql ("insert into TEST_DECIMAL (dl83) VALUES (?)")
				test_insert (insert, decimal_18_4)
				insert.set_sql ("insert into TEST_DECIMAL (d184) VALUES (?)")
				test_insert (insert, decimal_18_4)
				--|
				create decimal_18_0.make(19,0)
				create decimal_18_2.make(18,2)
				create decimal_5_3.make (5,3)
				create decimal_18_4.make(18,4)
				create stmt.make (session)
				stmt.set_sql ("select * from TEST_DECIMAL")
				stmt.execute
				stmt.describe_results
				if stmt.is_ok then
					from
						stmt.set_results (<<decimal_18_0, decimal_18_2, decimal_5_3, decimal_18_4>>)
						stmt.start
					until not stmt.is_ok or else stmt.off 
					loop
--						print ("price=")
--						print (decimal_18_0.out)
--						print ("%N")
--						print (decimal_18_0.as_decimal.to_scientific_string)
						print (decimal_18_0.out)
						print ("%T")
						print (decimal_18_2.out)
						print ("%T")
						print (decimal_5_3.out)
						print ("%T")
						print (decimal_18_4.out)
						print ("%T")
						print ("%N")
						decimal_18_0.set_null
						decimal_18_2.set_null
						decimal_5_3.set_null
						decimal_18_4.set_null
						stmt.forth
					end
				else
					print (stmt.diagnostic_message)
				end
				stmt.close
			end
		end

	test_insert (insert : ECLI_STATEMENT; value : ECLI_DECIMAL) is
		do
				insert.set_parameters (<<value>>)
				print ("Trying to insert%T")
						print (value.out)
						print ("%T")
				insert.bind_parameters
				insert.execute			
				if not insert.is_ok then
					print ("Error : %T")	
					print (insert.cli_state)
					print (" ")
					print (insert.native_code.out)
					print (" ")
					print (insert.diagnostic_message)
					print ("%N")
				else
					print ("OK%N")
				end
		end
		
	session : ECLI_SESSION
	stmt : ECLI_STATEMENT
	
	decimal_18_0 : ECLI_DECIMAL
	decimal_18_2 : ECLI_DECIMAL
	decimal_5_3 : ECLI_DECIMAL
	decimal_18_4 : ECLI_DECIMAL

	tables_cursor: ECLI_TABLES_CURSOR	
end