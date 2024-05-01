#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(none singleton);

my @examples = (
    {line1 => 'Mango is sweet', line2 => 'Mango is sour' },
    {line1 => 'Mango Mango', line2 => 'Orange'},
    {line1 => 'Mango is Mango', line2 => 'Orange is Orange'},
);

sub uncommon_words {
    my @words1 = split / /, lc(shift); #line1;
    my @words2 = split / /, lc(shift); #line2;
    my @uniq1 = singleton @words1;
    my @uniq2 = singleton @words2;
    my @uncommons;

    foreach my $word (@uniq1) {
        push @uncommons, $word if none {$_ eq $word} @words2;
    }
    foreach my $word (@uniq2) {
        push @uncommons, $word if none {$_ eq $word} @words1;
    }
    
    return \@uncommons;
}

for my $elements (@examples) {
    my $uw = uncommon_words $elements->{line1}, $elements->{line2};

    say 'Input : line1 = ', $elements->{line1};
    say '        line2 = ', $elements->{line2};
    say 'Output : ', join ' ', sort { $a cmp $b } (@$uw);
    say ' ';
}
