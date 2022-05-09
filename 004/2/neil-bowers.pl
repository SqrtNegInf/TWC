#!/usr/bin/env perl
use File::Slurper qw/ read_lines /;

my $word_file       = 'words';
my $input_signature = signature('crate');

print join("\n", grep { signature($_) eq $input_signature } read_lines($word_file)), "\n";

sub signature
{
    return join('', sort split('', $_[0]))
}
