#!/usr/bin/env raku
# Ryan Thompson <rjt@cpan.org>

sub even_re { +@_.grep(/^(\d\d)+$/) }
