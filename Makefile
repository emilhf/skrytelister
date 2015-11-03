LIST_DIR=lists
PDF_DIR=pdfs
LISTS=$(wildcard $(LIST_DIR)/*.md)
OUTPUTS=$(patsubst $(LIST_DIR)/%.md, $(PDF_DIR)/%.pdf, $(LISTS))

print-%: ; @echo $*=$($*)

$(PDF_DIR)/%.pdf: $(LIST_DIR)/%.md
	pandoc $< -o $@

clean:
	rm -rf $(PDF_DIR)/*

all: $(OUTPUTS)

.PHONY: all clean
