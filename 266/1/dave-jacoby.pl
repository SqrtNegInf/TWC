#!/usr/bin/env perl
use v5.36;

my @examples = (

    [ 'Mango is sweet',      'Mango is sour' ],
    [ 'Mango Mango',         'Orange' ],
    [ 'Mango is Mango',      'Orange is Orange' ],
    [ 'Mango is not Orange', 'Orange isn\'t Mango' ],
);

for my $example (@examples) {
    my @output = uncommon_words(@$example);
    my $output = join ', ', map { qq{'$_'} }
        map { my $z = $_; $z =~ s/\'/\\\'/gmix; $z } @output;
    say <<"END";
    Input:  \$line1 = '$example->[0]'
            \$line2 = '$example->[1]'
    Output: ($output)
END
}

sub uncommon_words (@strings) {
    my %hash;
    my @output = map { $hash{$_}++; $_ } map { split /\s+/mix, $_ } @strings;
    @output = grep { $hash{$_} == 1 } @output;
    return '' unless scalar @output;
    return return @output;
}
