all:
	fatpack trace "$(PERLBREW_ROOT)/perls/$(PERLBREW_PERL)/bin/patchperl"
	fatpack packlists-for `cat fatpacker.trace` >packlists
	fatpack tree `cat packlists`
	(echo "#!/usr/bin/env perl"; fatpack file; cat "$(PERLBREW_ROOT)/perls/$(PERLBREW_PERL)/bin/patchperl")  > patchperl.manyshebangs
	awk '!(/^#!\// && ++c > 1)' patchperl.manyshebangs > patchperl
	rm -f patchperl.manyshebangs
	chmod +x patchperl


