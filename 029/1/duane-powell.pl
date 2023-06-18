#!/usr/bin/env perl
use v5.36;

use Text::Glob::Expand;

my $glob = Text::Glob::Expand->parse('Perl {Daily,Weekly,Monthly,Yearly} Challenge');
my $permutations = $glob->explode_format("");
say foreach (sort keys %{$permutations} );

sub usage {
        print <<EOU;
Usage: $0 'brace-expansion'

Note: 'brace-expansion' must be quoted to surpress bash brace expansion, ironic.
Examples:
        $0 'Perl {Daily,Weekly,Monthly,Yearly} Challenge'       # PWC 29
        $0 'It{{em,alic}iz,erat}e{d,}'                          # test from RosettaCode
        $0 '{,{,gotta have{ ,\\, again\\, }}more }cowbell!'       # ''
        $0 'mkdir -p ~/project/{src,docs,test,foo}'             # practical usage
        $0 'apt-get install lib{file-find-rule,test-more}-perl' # ''
EOU
        exit;
}
 
