#!/usr/bin/env perl
use v5.36;

my $origin = $ARGV[0] || "/a//b/c/../../";

my @directories = grep { $_ ne "" && $_ ne "."  } split "/", $origin;

my @new_dirs = ();

for (@directories) {
    if ($_ ne "..") {
        push @new_dirs, $_;
    }
    else {
        pop @new_dirs;
    }
}

print ( "/" . (join "/", @new_dirs));
print "\n";
