# Nick Hinke
# 12/11/2022
# 605.204 Computer Organization
# Final
#
# Makefile to compile and link programs written for each problem
#

All: loopingIntegerInputStats

CC=gcc
BINDIR=bin
OBJDIR=obj
SRCDIR=src

loopingIntegerInputStats: $(SRCDIR)/loopingIntegerInputStats.s
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o -g -o $(BINDIR)/$@

clean:
	rm $(BINDIR)/loopingIntegerInputStats $(OBJDIR)/loopingIntegerInputStats.o

