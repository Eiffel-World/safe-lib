CC = cl
ISE_PLATFORM=windows
CFLAGS = -c -Ox -W2 -I$(ISE_EIFFEL)\studio\spec\$(ISE_PLATFORM)\include -I.
OBJ = xs_c_msc.obj

all:: xs_c_var clean xs_c_msc.lib

.c.obj:
	$(CC) $(CFLAGS) ..\..\C\$< 

xs_c_msc.lib: $(OBJ) ..\..\C\xs_c.h
	-del $@
	lib /OUT:$@ $(OBJ)

xs_c_msc.obj: xs_c_var ..\..\C\xs_c.c ..\..\C\xs_c.h
	$(CC) $(CFLAGS) -o xs_c_msc.obj ..\..\C\xs_c.c
#	-ren xs_c.obj xs_c_msc.obj

clean:
	-del *.obj
	-del *.lib

xs_c_var:
! IFNDEF SAFE
!    ERROR SAFE environment variable not set ! Set it first, then make the build.
! ENDIF
! IFNDEF ISE_EIFFEL
!    ERROR ISE_EIFFEL environment variable not set ! Set it first, then make the build.
! ENDIF