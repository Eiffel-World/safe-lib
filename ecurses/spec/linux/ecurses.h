/* 
 * Include file for ecurses, the eiffel library to (N)Curses
 *
 * Released under the Eiffel Forum Licence, or the LGPL
 * 
 * Author : Paul G. Crismer (pgcrism@ibm.net)
 * 
 * $Version: $
 * $Date: 2000/01/07 11:33:25 $
 * 
*/
#include <ncurses.h>
#include <eif_eiffel.h>

#define ecurses_cursor_x(w) ((w)->_curx)
#define ecurses_cursor_y(w) ((w)->_cury)

