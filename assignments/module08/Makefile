# Nick Hinke
# 10/23/2022
# 605.204 Computer Organization
# Module 8 Assignment
#
# Makefile to compile and link programs written for each problem
#

All: kphTest CToFTest InchesToFeetTest

BINDIR=bin
OBJDIR=obj
SRCDIR=src
LIB=$(OBJDIR)/libConversions.o
CC=gcc

kphTest: $(SRCDIR)/kphTest.s $(LIB)
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o $(LIB) -g -o $(BINDIR)/$@

CToFTest: $(SRCDIR)/CToFTest.s $(LIB)
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o $(LIB) -g -o $(BINDIR)/$@

InchesToFeetTest: $(SRCDIR)/InchesToFeetTest.s $(LIB)
	$(CC) $(SRCDIR)/$@.s -g -c -o $(OBJDIR)/$@.o
	$(CC) $(OBJDIR)/$@.o $(LIB) -g -o $(BINDIR)/$@

$(LIB): $(SRCDIR)/libConversions.s
	$(CC) $(SRCDIR)/libConversions.s -g -c -o $(LIB)

clean:
	rm $(BINDIR)/kphTest $(BINDIR)/CToFTest $(BINDIR)/InchesToFeetTest $(OBJDIR)/kphTest.o $(OBJDIR)/CToFTest.o $(OBJDIR)/InchesToFeetTest.o $(LIB)
