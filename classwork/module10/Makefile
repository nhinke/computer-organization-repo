All: loopCounter maxInArray processGrades
CC=gcc
BINDIR=bin

loopCounter: loopCounter.o
	$(CC) $@.o -g -o $(BINDIR)/$@

maxInArray: maxInArray.o
	$(CC) $@.o -g -o $(BINDIR)/$@

processGrades: processGrades.o
	$(CC) $@.o -g -o $(BINDIR)/$@

# rule to make any required .o file from its .s file
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@

clean:
	rm $(BINDIR)/loopCounter $(BINDIR)/maxInArray $(BINDIR)/processGrades loopCounter.o maxInArray.o processGrades.o
