build = build
pkg = pkg

-include $(build)/settings

default: build

clean:
	rm -rf $(build)/*

build: $(build)/install

install: $(build)/install
	$<

$(build)/install: $(pkg)/install.in $(build)/settings
	@mkdir -p $(@D)
	cp $< $@
	chmod +x $@
	sed -i s@{{PREFIX}}@$(PREFIX)@g $@
	sed -i s@{{CACHEDIR}}@$(CACHEDIR)@g $@
	sed -i s@{{SHARED}}@$(SHARED)@g $@

.PHONY: default build clean install
