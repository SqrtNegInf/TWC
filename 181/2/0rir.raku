#!/usr/bin/env raku

my $expect = " 
        Output:
2022-08-02
2022-08-05
2022-08-06
2022-08-08
2022-08-10
";


my $filename = $?FILE.IO.parent.cleanup.add: 'temperature.txt' ;

sub report-hotter-today-than-yesterday( $filename ) {
    my @in = grep { .defined and $_ ne '' }, sort lines slurp $filename;

    for @in -> $i is rw {
        my ($d, $t) = $i.split: ', ', 2;
        $d = Date.new: $d;
        $i =  $d => $t;
    }
    say "    Output:";
    for @in.rotor( 2 => -1) {
        next unless .[0].key +1 == .[1].key;
        next unless .[0].value < .[1].value;
        say  .[1].key;
    }
}

report-hotter-today-than-yesterday( $filename );
exit;
