
#ifdef GOBO_EIFFEL_VE

#include <c/ewg_c_library/ewg_eiffel.h>

// Simple conversion from ANY to POINTER
void* ewg_object_to_pointer (EIF_REFERENCE a_object)
{
	 return (void*) a_object;
}

#endif
