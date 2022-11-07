# Nick Hinke
# 11/05/2022
# 605.204 Computer Organization
# Module 10 Assignment
#
# Makefile to compile and link programs written for each problem
#

All: pr2-checkPrime pr3-guessNumber

CC=gcc
BINDIR=bin
OBJDIR=obj
SRCDIR=src

pr2-checkPrime: $(SRCDIR)/pr2-checkPrime.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

pr3-guessNumber: $(SRCDIR)/pr3-guessNumber.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

clean:
	rm $(BINDIR)/pr2-checkPrime $(OBJDIR)/pr2-checkPrime.o $(BINDIR)/pr3-guessNumber $(OBJDIR)/pr3-guessNumber.o 
