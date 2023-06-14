#!/usr/bin/env perl
use v5.36;

# DH  O.M.G

my @vals = ('',' + ',' - ');
for my $i (@vals) {
	for my $j (@vals) {
		for my $k (@vals) {
			for my $l (@vals) {
				for my $m (@vals) {
					for my $n (@vals) {
						for my $o (@vals) {
							for my $p (@vals) {
								for my $q (@vals) {
									my $string = join '','1',$i,'2',$j,'3',$l,'4',$m,'5',$n,'6',$o,'7',$p,'8',$q,'9';
									my $resp = eval $string;
									next unless $resp == 100;
									say qq{$resp = $string};
								}
							}
						}
					}
				}
			}
		}
	}
}
