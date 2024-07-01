#!/usr/bin/env raku

my $str = 'Perl Weekly Challenge';
my @keys = ('l');

my $keys = [~] '<[', @keys, ']>';
$str.words.grep({ $_ !~~ m:i/ <$keys> / }).elems.say;
