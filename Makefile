dict-gen=python mb-tool/steno_dict.py

programs=rime
script?=ipa

.PHONY: all clean

all: $(foreach program,$(programs),$(program)-$(script))

rime-%: build-%
	cat build/$*.tsv | mb-tool/steno_format.sh rime > build/rime-$*.tsv

build-%:
	cat $*/table.tsv | $(dict-gen) $*/system.json $*/chordmap.tsv > build/$*.tsv

clean:
	rm build/*
