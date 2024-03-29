#!/usr/bin/env perl
use v5.36;

use Data::Dump qw/dump/;

my @examples = (
    '{%  youtube title="Title \"quoted\" done" %}',
    '{%  youtube title="Title with escaped backslash \\" %}',
);

sub line_parser {
    my $original_line = shift;
    my %line_parsed;

    if ( $original_line =~ /^{%\s+(\w+)(\s+.+)\s*%}/) {
        $line_parsed{name} = $1;

	    $original_line =~ s/\\"/\034/g;

        while ($original_line =~ /(\w+)="?(\d+|[\w\034\s]+)"?/cg) {
        	my $field_name = $1;
        	my $value = $2;
            $value =~ s/\034/"/g;
            $line_parsed{fields}->{$field_name} = $value;
        }
    }
     
    return \%line_parsed;
}

for my $elements (@examples) {
    my $lp = line_parser $elements;

    say dump($lp);
    say ' ';
}
