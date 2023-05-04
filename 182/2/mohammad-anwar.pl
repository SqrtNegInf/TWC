#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;

is common_path(
    [ '/a/b/c/1/x.pl',
      '/a/b/c/d/e/2/x.pl',
      '/a/b/c/d/3/x.pl',
      '/a/b/c/4/x.pl',
      '/a/b/c/d/5/x.pl',
    ]),
    '/a/b/c',
    'Example';

done_testing;

#
#
# METHOD

sub common_path($paths) {
    my @dirs;
    my $i = 9_999_99;
    foreach my $path (@$paths) {
        my @folders = split /\//, $path;
        shift @folders && pop @folders;
        $i = @folders if $i > @folders;
        push @dirs, \@folders;
    }

    my @common_path = ('');
    foreach my $j (0 .. $i-1) {
        my %paths = map { $_->[$j] => 1 } @dirs;
        last if (keys %paths != 1);
        push @common_path, keys %paths;
    }

    return join("/", @common_path);
}
