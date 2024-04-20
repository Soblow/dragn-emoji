SVGS := $(wildcard *.svg)
SVGS_PLONT := $(wildcard plont/*.svg)
PNGS := $(SVGS:%.svg=%.png)
PNGS_PLONT := $(SVGS_PLONT:%.svg=%.png)

.PHONY: clean

dragn-emoji.tar.gz: $(PNGS) $(PNGS_PLONT)
	tar -c $? | gzip > $@

%.nooptim.png: %.svg
	convert -background none -geometry 256x256 $< $@

%.png: %.nooptim.png
	oxipng -o max --out $@ $<

clean:
	find . -maxdepth 1 -name '*.png' -delete
	rm -f dragn-emoji.tar.gz
