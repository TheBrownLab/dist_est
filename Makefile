.SUFFIXES: .c .f .o .a  .def .exp .dll .exe 

FFLAGS=-O3
CFLAGS=-O3
CC=gcc
F77=gfortran

SOURCES=$(wildcard -f *.c *.f)
OBJS=$(foreach i,$(SOURCES),$(basename $i).o)

dist_est: $(OBJS)
	$(F77) $(FFLAGS) -o dist_est $(OBJS) -lm -fcommon

.c.o:
	$(CC)  $(CFLAGS) $($*-CFLAGS) -c $< -o $@ -fcommon

.f.o:
	$(F77) $(FFLAGS) $($*-FFLAGS) -c $< -o $@ -fcommon

clean :
	-rm *.o dist_est