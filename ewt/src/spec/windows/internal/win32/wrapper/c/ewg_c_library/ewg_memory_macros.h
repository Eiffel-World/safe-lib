
// Memory related macros


#define ewg_reference_of(arg) &arg

#define ewg_add_pointer_and_integer(a_pointer, a_integer) (void*)((int)a_pointer + a_integer)

#define ewg_read_pointer(a_pointer,a_pos) *(void**)((int)a_pointer + a_pos)

#define ewg_put_pointer(a_pointer,a_value,a_pos) *(void**)((int)a_pointer + a_pos) = a_value

#define ewg_bitwise_or(a_value_1, a_value_2) (a_value_1 | a_value_2)
