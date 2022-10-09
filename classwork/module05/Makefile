All: Pass Mask Polynomial
#	@echo "Making all: make-test/Pass, make-test/Mask, make-test/Polynomial"

Pass: Pass.s
	@echo "\nMaking make-test/Pass:"
	gcc Pass.s -g -c -o make-test/Pass.o
	gcc make-test/Pass.o -g -o make-test/Pass

Mask: Mask.s
	@echo "\nMaking make-test/Mask:"
	gcc Mask.s -g -c -o make-test/Mask.o
	gcc make-test/Mask.o -g -o make-test/Mask

Polynomial: Polynomial.s
	@echo "\nMaking make-test/Polynomial:"
	gcc Polynomial.s -g -c -o make-test/Polynomial.o
	gcc make-test/Polynomial.o -g -o make-test/Polynomial

clean: 
	@echo "\nCleaning up:"
	rm Pass Mask Polynomial
