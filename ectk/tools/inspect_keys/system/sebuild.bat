 
set LIBS=ecurses_c.lib pdcurses.lib panel.lib
set SEFLAGS=-case_insensitive -no_style_warning
set BUILDFLAGS=-I%ECURSES%\spec\se\windows
set TARGET=inspector
set CREATION=make

compile %SEFLAGS% %BUILDFLAGS% %LIBS% %TARGET% %CREATION%

pause
