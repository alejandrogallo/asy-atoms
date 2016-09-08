DIST_FOLDER = dist
SRC_FOLDER = src

MAIN_FILE = $(SRC_FOLDER)/atoms.asy

.PHONY: dist

all: dist test

dist:
	bash ./tools/mkdist.sh

clean:
	-rm -rf $(DIST_FOLDER)

test:
	bash tools/test.sh
