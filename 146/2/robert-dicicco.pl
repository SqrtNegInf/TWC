#!/usr/bin/env perl
use v5.36;

my $pval = '';
my $gpar = '';
#my $argc = scalar(@ARGV);
#die "Requires one fraction argument!\n" if($argc != 1);

@ARGV = ('3/5');

# hash contains fraction and its parent, top is designated by '0'
my %family = (
    '0'   => '0',
    '1/1' => '0',
    '1/2' => '1/1',
    '2/1' => '1/1',
    '1/3' => '1/2',
    '3/2' => '1/2',
    '2/3' => '2/1',
    '3/1' => '2/1',
    '1/4' => '1/3',
    '4/3' => '1/3',
    '3/5' => '3/2',
    '5/2' => '3/2',
    '2/5' => '2/3',
    '5/3' => '2/3',
    '3/4' => '3/1',
    '4/1' => '3/1',
);

if(exists($family{$ARGV[0]})){
    $pval = $family{$ARGV[0]};
    if(exists($family{$pval})){
        $gpar = $family{$pval};
        print("parent = $pval and grandparent = $gpar\n");
    }
} else {
    print("$ARGV[0] not found!\n");
}
