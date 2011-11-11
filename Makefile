w32time.exe: w32time.c
	gcc -O2 -o $@ -Wall $<

install: w32time.exe
	strip -s w32time.exe
	cp w32time.exe \gh\bin\w32\w32time.exe

.PHONY: clean distclean package
package: w32time.exe
	strip -s w32time.exe
	7za a -mx9 w32time.7z w32time.exe README.mkd

clean:
	rm -f w32time.exe

distclean: clean
	rm -f *.7z
