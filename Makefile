src_dir := $(shell pwd)
bin_dir := /usr/local/bin
man_dir := /usr/local/share/man/man1

install:
	@if ! [ -f $(bin_dir)/bytes ]; then ln -s $(src_dir)/bytes.sh $(bin_dir)/bytes ; fi
	@if ! [ -f $(man_dir)/bytes.1.gz ]; then ln -s $(src_dir)/man/bytes.1.gz $(man_dir)/bytes.1.gz ; fi
