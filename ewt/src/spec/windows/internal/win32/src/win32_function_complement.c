#include <windows.h>
// Wraps call to function 'PtInRect' in a macro
BOOL ewg_function_PtInRect(LPCRECT __ewg_macro_parameter_lprc, POINT* __ewg_macro_parameter_pt) {
	return PtInRect ((LPCRECT) __ewg_macro_parameter_lprc,  *((POINT*)__ewg_macro_parameter_pt));
}

// Wraps call to function 'WindowFromPoint' in a macro
HWND ewg_function_WindowFromPoint(POINT* __ewg_macro_parameter_Point) {
 	return WindowFromPoint (*((POINT*)__ewg_macro_parameter_Point));
}

// Wraps call to function 'DragDetect' in a macro
BOOL  ewg_function_DragDetect(HWND __ewg_macro_parameter_anonymous_1, POINT* __ewg_macro_parameter_anonymous_2) {
	 return DragDetect ((HWND) __ewg_macro_parameter_anonymous_1, *((POINT*)__ewg_macro_parameter_anonymous_2));
}

#if(WINVER < 0x0500)
WINGDIAPI DWORD WINAPI SetLayout(IN HDC, IN DWORD) { /*do nothing*/ return 0; }
WINGDIAPI DWORD WINAPI GetLayout(IN HDC) { /*do nothing*/ return 0; }
#endif /* WINVER < 0x0500 */
