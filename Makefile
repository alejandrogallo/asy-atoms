DIST_FOLDER = dist
SRC_FOLDER = src

MAIN_FILE = $(SRC_FOLDER)/atoms.asy

.PHONY: dist
dist:
	bash ./tools/mkdist.sh

clean:
	-rm -rf $(DIST_FOLDER)


