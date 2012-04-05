CC = gcc
PREFIX = \tools

w32time.exe: w32time.c
	$(CC) -O2 -o $@ -Wall $<
	strip -s $@

.PHONY: clean distclean install package
install: w32time.exe
	cp $< $(PREFIX)\$<

package: w32time.exe
	7za a -mx9 w32time.7z $< README.mkd

clean:
	rm -f w32time.exe

distclean: clean
	rm -f *.7z
