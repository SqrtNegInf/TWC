#!/usr/bin/env perl
use v5.36;

use Test::More;

my $text = do { local $/; open my $in, "<", "input.txt" or die "$!"; <$in> };
$text =~ tr/."(),//ds;
$text =~ s/\s+/ /g;
$text =~ s/'s//g;

$text =~ s/--/ /g;

my $expected = <<EXPECTED;
1 But City It Jet Juliet Latino New Romeo Side Story Their Then West York adaptation any anything at award-winning away become before begin best classic climactic coexist control dance do doesn't end ending escalates families feuding form former friend gains gangs goes happened hatred heartbreaking highway hoping in know love lovers meet meeting neither no one plan planning point romantic rumble run secret sends sister streets strikes terribly their two under understanding until violence warring what when where white whoever wins with wrong younger
2 Bernardo Jets Riff Sharks The by it led tragedy
3 Maria Tony a can of stop
4 to
9 and the
EXPECTED



my %count;
$count{$_}++ for split(/\s/,$text);


my %frequencies;
for my $word ( keys %count )
{

     push @{$frequencies{$count{$word}}}, $word;
}

my $output;

for my $num ( sort {$a <=> $b} keys %frequencies )
{
     $output .= join(' ', $num, sort { $a cmp $b } @{$frequencies{$num}}) . $/;
}

is($output, $expected, 'Matched');
done_testing();
