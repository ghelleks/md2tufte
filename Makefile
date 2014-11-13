# The files that create all the other files
SOURCE = sample.md 
SOURCE += sample.yaml

TARGET_DIR = output

# All the different files we'll create
HTML_TARGET = $(TARGET_DIR)/sample.html
REVEALJS_TARGET = $(TARGET_DIR)/sample-presentation.html
PDF_TARGET = $(TARGET_DIR)/sample.pdf
ODT_TARGET = $(TARGET_DIR)/sample.odt

TARGET = $(HTML_TARGET) $(REVEALJS_TARGET) $(PDF_TARGET) $(ODT_TARGET)

# reveal.js options
REVEALJS_THEME := sky
REVEALJS_CSS := md2tufte.css

# latex options
LATEX_TEMPLATE := pandoc-templates/handout.tex
LATEX_PREAMBLE := latex-preamble.tex

# pandoc options
PANDOC := pandoc -f markdown+mmd_title_block --slide-level=2 --smart 
#OFFLINE := -s --self-contained
OFFLINE := -s
 
# build everything by default
all: output_dir $(TARGET)

output_dir:
		mkdir -p $(TARGET_DIR)

#
# generate reveal.js files
%-presentation.html: $(SOURCE)
		$(PANDOC) $(OFFLINE) --self-contained -t revealjs -V theme=$(REVEALJS_THEME) --css=$(REVEALJS_CSS) -o $@ $(SOURCE)

# generate html file
%.html: $(SOURCE)
		$(PANDOC) -o $@ $(SOURCE)

# generate pdf file
pdf: $(PDF_TARGET)
%.pdf: $(SOURCE) $(LATEX_TEMPLATE) $(LATEX_PREAMBLE)
		$(PANDOC) -V links-as-notes -H $(LATEX_PREAMBLE) --template $(LATEX_TEMPLATE) -o $@ $(SOURCE)

# generate odt file
odt: $(ODT_TARGET)
%.odt: $(SOURCE)
		$(PANDOC) -o $@ $(SOURCE)

# delete everything we make
clean:
	@rm -vrf $(TARGET)
