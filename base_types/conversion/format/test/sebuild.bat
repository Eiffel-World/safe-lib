 
set LIBS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib
set SEFLAGS=-case_insensitive -no_style_warning
set BUILDFLAGS=
set TARGET=format_test
set CREATION=make

compile %SEFLAGS% %BUILDFLAGS% %LIBS% %TARGET% %CREATION% -trace

pause
