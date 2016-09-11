DIST_FOLDER = dist
SRC_FOLDER = src

MAIN_FILE = $(SRC_FOLDER)/atoms.asy

.PHONY: dist doc update-website examples

all: dist test

dist: ## Create distribution
	bash ./tools/mkdist.sh

clean:
	-rm -rf doc

test: ## Run the tests
	bash tools/test.sh

tags:
	ctags -R \
		--language-force=C \
		-f tags \
		src/ /usr/share/asymptote/

doc:
	doxygen Doxyfile

examples:
	make -C examples

update-website: doc ## Update documentation
	#git push origin `git subtree split --prefix doc/html/ master`:gh-pages --force
	git checkout gh-pages
	for i in *; do echo $$i; [ $$i = doc ] || rm -rf $$i; done
	mv doc/html/* .
	rm -rf doc/
	git add .
	git commit -m "Automatic update"
	git push --force origin gh-pages
	git checkout master
	

help: ## Prints help for targets with comments
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

