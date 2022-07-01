#!/usr/local/bin/perl
use strict;
use warnings;

no lib '/usr/local/lib/perl5/site_perl/5.32.1';
no lib '/usr/local/lib/perl5/site_perl/5.32.0';

use Inline C => <<'__END__';

int wgetuid() {
	return getuid();
}
__END__

print "User ID: ".wgetuid()."\n";

