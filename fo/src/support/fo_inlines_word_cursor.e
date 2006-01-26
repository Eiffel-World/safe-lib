indexing
	description: "Objects that..."

	usage: ""
	quality: ""
	refactoring: ""

	status: "see notice at end of class";
	date: "$Date: 2006/01/26 18:27:04 $";
	revision: "$Revision: 1.1 $";
	author: ""

class FO_INLINES_WORD_CURSOR

create
	make
	
feature {NONE} -- Initialization

	make (inlines : DS_LIST[FO_INLINE]) is
		do
			internal_cursor := inlines.new_cursor
		end
		
feature -- Access

	item_text : STRING is
		do
			Result := word_text
		end
		
	
	item_width : FO_MEASUREMENT is
		do
			Result := word_width
		end

	item_begin : DS_PAIR[FO_INLINE, INTEGER] is			
		do
			Result := word_begin
		end
	
	item_end : DS_PAIR[FO_INLINE, INTEGER] is
		do
			Result := word_end
		end
		
	item_inlines : DS_LIST[FO_INLINE] is
		do
			Result := word_inlines
		end
		
	item_character (n : INTEGER) : DS_PAIR[FO_INLINE,INTEGER] is		
		local
			count, i : INTEGER
			c : DS_LIST_CURSOR[FO_INLINE]
		do
			from
				c := item_inlines.new_cursor
				c.start
				count := 0
			until
				c.off or else count = n
			loop
				from
					if count = 0 then
						i := word_begin.second
					else
						i := 1
					end
					
				until
					count = n or else i > c.item.count or else c.off
				loop
					i := i + 1
					count := count + 1				
				end
				if count < n then
					c.forth
				end
			end
			if count = n then
				create Result.make (c.item, i - 1)
			end
		end
				
feature -- Measurement

feature -- Comparison

feature -- Status report

	off : BOOLEAN is
		do
			Result := word_off
		end
		
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

	item_head (width : FO_MEASUREMENT) is
		require
			width_less_item_width: width /= Void and (width < item_width)
		local
			wbegin : like word_begin
			wcount : INTEGER
			wwidth, cwidth : FO_MEASUREMENT
			done : BOOLEAN
			cpair, cpairlast : DS_PAIR[FO_INLINE,INTEGER]
			wtext : STRING
			c : CHARACTER
		do
			from
				create wwidth.points (0)
				wcount := 1
				create wbegin.make (word_begin.first, word_begin.second)
				create wtext.make (item_text.count)
				done := False			
			until
				done or else wcount > item_text.count
			loop
				cpair := item_character (wcount)
				c := cpair.first.item (cpair.second)
				cwidth := cpair.first.character_width (c)
				if wwidth + cwidth > width then
					done := True
				else
					cpairlast := cpair
					wtext.append_character (c)
					wwidth := wwidth + cwidth
					wcount := wcount + 1
				end
			end
			--| always one character too far
			wcount := wcount - 1
			if wcount <= item_text.count then
				check done: done end
				--| [wcount + 1 ..] = remaining word
				remaining_subword_begin := item_character (wcount + 1)
				remaining_subword_end := word_end
				--| [1..wcount] = new word.
				word_end := cpairlast
				from
					item_inlines.start
				until
					item_inlines.off or else item_inlines.item_for_iteration = word_end.first
				loop
					item_inlines.forth
				end
				create {DS_LINKED_LIST[FO_INLINE]}remaining_subword.make
				if word_end.first = remaining_subword_begin.first then
					remaining_subword.put_last (word_end.first)
				end	
				--| save then remove inlines for remaining_subword							
				from
					item_inlines.forth
				until
					item_inlines.off
				loop
					remaining_subword.put_last (item_inlines.item_for_iteration)
					item_inlines.remove_at	
				end
				remaining_subword_width := item_width - wwidth
				word_width := wwidth
				remaining_subword_text := item_text.substring (wcount + 1, item_text.count)
				word_text := item_text.substring (1, wcount)
			end
		ensure
			item_width_le_width: item_width <= width
		end
		
	append_item (line : FO_LINE) is
			-- append item to `line'.
		local
			item_inlines_cursor : DS_LIST_CURSOR[FO_INLINE]
		do
			if item_begin.first = item_end.first then
				line.add_inline (item_begin.first.substring (item_begin.second, item_end.second.min (item_end.first.count)))
			else	
				from
					item_inlines_cursor := item_inlines.new_cursor
					item_inlines_cursor.start
				until
					item_inlines_cursor.off
				loop
					if item_inlines_cursor.item = item_begin.first then 
						line.add_inline (item_begin.first.substring (item_begin.second, item_begin.first.count))
					elseif item_inlines_cursor.item = item_end.first then
						line.add_inline (item_end.first.substring (1, item_end.second))
					else
						line.add_inline (item_inlines_cursor.item)
					end
					item_inlines_cursor.forth
				end
			end
		end
		
	start is
		do
			word_start
		end
		
	forth is
		do
			word_forth
		end
		
feature -- Obsolete

feature -- Inapplicable

feature -- Constants

feature {NONE} -- Implementation

	remaining_subword : like word_inlines
	
	remaining_subword_begin : like word_begin
	remaining_subword_end : like word_end
	remaining_subword_text : like item_text
	remaining_subword_width : like item_width
	
	word_start is	
		do
			internal_cursor.start
			word_state := state_start
			if not internal_cursor.off then
				word_off := False
				create word_begin.make (internal_cursor.item, 1)
				get_word
			else
				word_off := True
			end
		end
		
	word_forth is
		require
			not word_off
		do
			if next_word_begin /= Void then
				word_begin := clone (next_word_begin)
			else
				--| FIXME
			end
			get_word

		end
		
	word_off : BOOLEAN

	state_nl : INTEGER is 10
	state_start : INTEGER is 0
	state_word_letter : INTEGER is 1
	state_word_blank : INTEGER is 2
	state_done : INTEGER is 100
	
	word_state : INTEGER
	
	word_done : BOOLEAN
			
	get_word is
		local
			c : CHARACTER
		do
			if remaining_subword /= Void then
				word_begin := remaining_subword_begin
				word_end := remaining_subword_end
				word_inlines := remaining_subword
				remaining_subword := Void
				word_text := remaining_subword_text
				word_width := remaining_subword_width
			else
				create {DS_LINKED_LIST[FO_INLINE]}word_inlines.make
				create word_end.make (word_begin.first, word_begin.second)
				create word_text.make (100)
				create word_width.points (0)
				from
					--| sweep through different inlines
					word_done := False
					must_consume_last_char := False
				until
					internal_cursor.off or else word_done
				loop
					from
						--| sweep through characters in same inline
					until
						word_end.second > internal_cursor.item.count or else word_done
					loop				
						c := internal_cursor.item.item (word_end.second)
						handle_state (c)
					end
					forth_internal_cursor
				end
				if internal_cursor.off then
				    if word_text.is_empty and not must_consume_last_char then	
						word_off := True
					else
						handle_state (last_char)
					end
				end
				if not word_off then
	--			print (word_text)
	--			print (c_new_line)
	--			io.read_line
				end
			end
		end

	handle_state (c : CHARACTER) is
		do
			inspect word_state
			when state_nl then
				handle_nl_state (c)
			when state_word_letter then
				handle_wl_state (c)
			when state_word_blank then
				handle_wb_state (c)
			else
				handle_start (c)
			end
		end
		
	handle_start (c : CHARACTER) is
		do
			if is_new_line_character (c) then
				word_state := state_nl
			elseif is_break_character (c) then
				word_state := state_word_blank
			else
				word_state := state_word_letter
			end
			forth_word_end
			set_last_char (c)
		end
		
	handle_nl_state (c : CHARACTER) is		
		do
			word_finish
			word_state := state_start
			set_last_char (c)
		end
		
	handle_wl_state (c: CHARACTER) is
		do
			if is_new_line_character (c) then
				word_finish
				word_state := state_start
			elseif is_break_character (c) then
				word_append_last_char
				word_state := state_word_blank
			else
				word_append_last_char
				word_state := state_word_letter
			end
			set_last_char (c)
		end
		
	handle_wb_state (c: CHARACTER) is
		do
			if is_new_line_character (c) then
				word_finish
				word_state := state_start
			elseif is_break_character (c) then
				word_append_last_char
				word_state := state_word_blank
			else
				word_finish
				word_state := state_start
			end
			set_last_char (c)
		end
		
	word_finish is
			-- finish current word appending last_char to it
		do
			word_text.append_character (last_char)
			must_consume_last_char := False
			word_width := word_width + internal_cursor.item.character_width (last_char)
			if word_end.second > 1 then
				create next_word_begin.make (word_end.first, word_end.second)				
				word_end.put_second (word_end.second - 1)
			else
				create next_word_begin.make (word_end.first, 1)
				word_end := last_word_end			
			end
			word_done := True
		end
		
	word_append_last_char is
		do
			word_text.append_character (last_char)
			must_consume_last_char := False
			word_width := word_width + last_char_inline.character_width (last_char)	
			forth_word_end		
		end

	forth_word_end is		
		do
			if not internal_cursor.off then
				word_end.put_second (word_end.second + 1)
			end
		end

	forth_internal_cursor is		
		do
			if not word_done then
--				--| Add current internal_cursor.item to word
--				word_item.put_last (last_char_inline)
				--| Advance to next inline
				internal_cursor.forth
				if not internal_cursor.off then
					create last_word_end.make (word_end.first, word_end.second - 1)
					word_end.put_first (internal_cursor.item)
					word_end.put_second (1)
				else
					--| adjust end
					word_end.put_second (word_end.second - 1)
				end
			end
		end
		
	internal_cursor : DS_LIST_CURSOR[FO_INLINE]
	
	word_inlines : DS_LIST[FO_INLINE]

	word_length : INTEGER
	word_text : STRING
	
	word_begin : DS_PAIR[FO_INLINE, INTEGER]
	word_end : DS_PAIR[FO_INLINE, INTEGER]
	
	next_word_begin : DS_PAIR [FO_INLINE, INTEGER]
	
	last_char : CHARACTER
	last_char_inline : FO_INLINE
	
	set_last_char (c: CHARACTER) is
		do
			last_char := c
			if not internal_cursor.off then
				last_char_inline := internal_cursor.item
				if not word_inlines.has (last_char_inline) then
					word_inlines.put_last (last_char_inline)
				end
			end
			must_consume_last_char := True
		end
		
	must_consume_last_char : BOOLEAN
	
	last_word_end : DS_PAIR[FO_INLINE,INTEGER]
	
	word_width : FO_MEASUREMENT

	render_cursor : DS_LIST_CURSOR[FO_LINE]

	is_break_character (c : CHARACTER) : BOOLEAN is	
		do
			inspect c
			when ' ', '%T', '-', '/' then
				Result := True
			else
				
			end
		end
		
	is_new_line_character (c : CHARACTER) : BOOLEAN is
		do
			inspect c
			when '%N' then
				Result := True
			else
				
			end
		end
		
	is_discardable_character (c : CHARACTER) : BOOLEAN is
		do
			
		end


end
