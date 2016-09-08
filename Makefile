DIST_FOLDER = dist
SRC_FOLDER = src

MAIN_FILE = $(SRC_FOLDER)/atoms.asy

.PHONY: dist

all: dist test

dist:
	bash ./tools/mkdist.sh

clean:
	-rm -rf doc

test:
	bash tools/test.sh

doc:
	doxygen Doxyfile

update-website: doc
	git push origin `git subtree split --prefix doc/html/ master`:gh-pages --force

