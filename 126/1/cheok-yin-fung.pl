#!/usr/bin/env perl

#perl -E '$_ = [grep {$_ !~ /1/} (1..$ARGV[0])]; say scalar @{$_}, "\n", "@{$_}"' 126

$_ = [grep {$_ !~ /1/} (1..200)]; print scalar @{$_}, "\n", "@{$_}"
