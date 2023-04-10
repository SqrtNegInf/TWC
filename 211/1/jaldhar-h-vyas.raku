#!/usr/bin/env raku

# added example, needed to be native/shaped array, or problems?

sub diagonal(@matrix, $r, $c, $row, $col) {
    my $i = $row;
    my $j = $col;
    my $same = @matrix[$i;$j];

    while $i < $r && $j < $c {
        if @matrix[$i;$j] != $same {
            return False;
        }
        $i++;
        $j++;
    }
    return True;
}

#sub MAIN(
my $r = 3,
my $c = 4,
#my @args = [ <4 3 2 1>, <5 4 3 2>, <6 5 4 3> ]; # no
 my @args[3;4] = [ <4 3 2 1>, <5 4 3 2>, <6 5 4 3> ];

#) {

    my @matrix = @args.batch($c);

 
    for 0 ..^ $c -> $col {
        unless diagonal(@matrix, $r, $c, 0, $col) {
            say 'false';
            exit;
        }
    }

    for 1 ..^ $r -> $row {
        unless diagonal(@matrix, $r, $c, $row, 0) {
            say 'false';
            exit;
        }
    }

   say 'true';
#}
