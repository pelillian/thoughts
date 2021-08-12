BUILD_DIR := build

THOUGHTS := $(wildcard thoughts/*)

all: $(THOUGHTS)

$(THOUGHTS): $(BUILD_DIR)
	pandoc --bibliography=$@/biblio.bib --csl ieee.csl -s $@/main.tex -o $(BUILD_DIR)/$@.md
	pandoc -t markdown_strict --citeproc -M link-citations=True --bibliography=$@/biblio.bib --csl ieee.csl -s $(BUILD_DIR)/$@.md -o $(BUILD_DIR)/$@.md

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)/thoughts
