All: summation
CC=gcc
BINDIR=bin

summation: summation.o
	$(CC) $@.o -g -o $(BINDIR)/$@

# rule to make any required .o file from its .s file
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

clean:
	rm $(BINDIR)/summation summation.o 
