
// Copied from ePosix

#if ( (! defined(GOBO_EIFFEL_SE)) && (! defined(GOBO_EIFFEL_ISE)) && (! defined(GOBO_EIFFEL_VE)) )
#error Eiffel vendor unknown. Please define GOBO_EIFFEL_XXX.
#endif

#ifdef GOBO_EIFFEL_ISE
#ifndef eif_h
#define eif_h
#include <eif_portable.h>
#include <eif_hector.h>
#include <eif_macros.h>
#endif
#endif

#ifdef GOBO_EIFFEL_SE
// TODO: on SE eif_adopt/eif_wean need to lock/unlock the object (so that it wont be collected)
#define eif_access(x)x
#define eif_adopt(x)x
#define eif_wean(x)
#endif

#ifdef GOBO_EIFFEL_VE
#include "cecil.h"
#ifndef EIF_OBJ
#ifndef EIF_OBJ
#define EIF_OBJ EIF_REFERENCE
#endif
#ifndef EIF_PROCEDURE
#define EIF_PROCEDURE EIF_PROC
#endif
#endif

// TODO: VE provides `eif_access', `eif_adopt' and `eif_wean'
// but `eif_adopt' doesn't return anything, find a way to overcome
// this incompatibility
#define eif_access(x)x
#define eif_adopt(x)x
#define eif_wean(x)
#endif

#ifndef NULL
#define NULL ((void*)0)
#endif
