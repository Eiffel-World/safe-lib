#include <windows.h>

#include <win32_struct_complement.h>
#include <win32_function_complement.h>
#include <win32_callback_complement.h>

#if(WINVER < 0x0500)
WINGDIAPI DWORD WINAPI SetLayout(IN HDC, IN DWORD);
WINGDIAPI DWORD WINAPI GetLayout(IN HDC);
#endif /* WINVER < 0x0500 */
