#!/usr/bin/env perl

use v5.36;
use utf8;
use charnames ':full';
binmode(STDOUT, ':utf8');

my (@tests, $test);

@tests = ('ÃÊÍÒÙ', 'âÊíÒÙ', 'ĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİŁłŃńŐőŔŕŖŗŘřŚśŜŝŞş');

# loop over tests
for $test (@tests) {
	say qq[\nInput:  $test\nOutput: ] . makeover($test);
}

sub makeover {
	
	my ($result, $char, $name);

	# loop over characters within test
	while ($_[0] =~ m|(.)|g) {
		$char = $1;
		
		# get Unicode name for character
		$name = charnames::viacode(ord($char));
		
		# check if it is a modified latin letter and if so substitute unmodified letter
		if ($name =~ m|^LATIN CAPITAL LETTER (.)|) {
			$result .= $1;
		} elsif ($name =~ m|^LATIN SMALL LETTER (.)|) {
			$result .= lc($1);
			
		# or if not just copy input to output
		} else {
			$result .= $char;
		}
	}
	return $result;
}
