indexing
	description: "Query on a model [M], the result of the query is a reference to a type V"
	author: "Fafchamps Eric"
	date: "$Date: 2001/09/15 07:29:50 $"
	revision: "$Revision: 1.1 $"

deferred class EMI_QUERY[M,V]

inherit
	EMI_FEATURE[M]

	EMI_REFERENCE[V]

end -- class EMI_QUERY

--
-- Copyright: 2001, Eric Fafchamps, <eric.fafchamps@belgacom.net>
-- Released under the Eiffel Forum License <www.eiffel-forum.org>
-- See file <forum.txt>
--
