# Nick Hinke
# 11/13/2022
# 605.204 Computer Organization
# Module 11 Assignment
#
# Makefile to compile and link programs written for each problem
#

All: pr1-recursiveMult pr2-recursiveFib

CC=gcc
BINDIR=bin
OBJDIR=obj
SRCDIR=src

pr1-recursiveMult: $(SRCDIR)/pr1-recursiveMult.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

pr2-recursiveFib: $(SRCDIR)/pr2-recursiveFib.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

clean:
	rm $(BINDIR)/pr1-recursiveMult $(OBJDIR)/pr1-recursiveMult.o $(BINDIR)/pr2-recursiveFib $(OBJDIR)/pr2-recursiveFib.o 
