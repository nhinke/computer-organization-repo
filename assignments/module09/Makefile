# Nick Hinke
# 10/30/2022
# 605.204 Computer Organization
# Module 9 Assignment
#
# Makefile to compile and link programs written for each problem
#

All: checkCharLogical checkCharNoLogicals checkGrade maxInt

CC=gcc
BINDIR=bin
OBJDIR=obj
SRCDIR=src

checkCharLogical: $(SRCDIR)/checkCharLogical.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

checkCharNoLogicals: $(SRCDIR)/checkCharNoLogicals.s 
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

checkGrade: $(SRCDIR)/checkGrade.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

maxInt: $(SRCDIR)/maxInt.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

clean:
	rm $(BINDIR)/checkCharLogical $(BINDIR)/checkCharNoLogicals $(BINDIR)/checkGrade $(BINDIR)/maxInt $(OBJDIR)/checkCharLogical.o $(OBJDIR)/checkCharNoLogicals.o $(OBJDIR)/checkGrade.o $(OBJDIR)/maxInt.o
