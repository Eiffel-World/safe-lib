
// Memory related functions
// TODO: who says 'signed char*' is one byte?
// etc

int ewg_read_integer_8 (void* a_pointer, int a_pos)
{
	 return (int)((signed char*)a_pointer)[a_pos];
}

void ewg_put_integer_8 (void* a_pointer, int a_int, int a_pos)
{
	 ((signed char*)a_pointer)[a_pos] = (signed char) a_int;
}

int ewg_read_integer_16 (void* a_pointer, int a_pos)
{
	 return (int)((int*)a_pointer)[a_pos];
}

void ewg_put_integer_16 (void* a_pointer, int a_int, int a_pos)
{
	 ((short*)a_pointer)[a_pos] = (short) a_int;
}

int ewg_read_integer_32 (void* a_pointer, int a_pos)
{
	 return (int)((int*)a_pointer)[a_pos];
}

void ewg_put_integer_32 (void* a_pointer, int a_int, int a_pos)
{
	 ((int*)a_pointer)[a_pos] = (int) a_int;
}

int ewg_read_integer (void* a_pointer, int a_pos)
{
	 return (int)((int*)a_pointer)[a_pos];
}

void ewg_put_integer (void* a_pointer, int a_int, int a_pos)
{
	 ((int*)a_pointer)[a_pos] = (int) a_int;
}

void* ewg_read_pointer (void* a_pointer, int a_pos)
{
	 return *(void**)((int)a_pointer + a_pos);
}

void ewg_put_pointer (void* a_pointer, void* a_value, int a_pos)
{
	 *(void**)((int)a_pointer + a_pos) = a_value;
}

void* ewg_add_pointer_and_integer (void* a_pointer, int a_integer)
{
	 return (void*)((int)a_pointer + a_integer);
}

int ewg_pointer_to_integer (void* a_pointer)
{
	 return (int)a_pointer;
}

void* ewg_integer_to_pointer (int a_integer)
{
	 return (void*)a_integer;
}
			   
void* ewg_reference_of (void* a_pointer)
{
	 return (void*)&a_pointer;
}

int ewg_sizeof_pointer ()
{
	 return sizeof (void*);
}

int ewg_sizeof_int ()
{
	 return sizeof (int);
}

int ewg_bitwise_integer_or (int a_value_1, int a_value_2)
{
	 return (a_value_1 | a_value_2);
}

			   
