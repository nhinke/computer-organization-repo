All: checkChar checkGrade inputLoop maxInt
#LIB=libConversions.o
CC=gcc
BINDIR=bin

checkChar: checkChar.o
	$(CC) $@.o -g -o $(BINDIR)/$@

checkGrade: checkGrade.o
	$(CC) $@.o -g -o $(BINDIR)/$@

inputLoop: inputLoop.o
	$(CC) $@.o -g -o $(BINDIR)/$@

maxInt: maxInt.o
	$(CC) $@.o -g -o $(BINDIR)/$@

# rule to make any required .o file from its .s file
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

clean:
	rm checkChar checkGrade inputLoop maxInt
