#!/usr/bin/env raku

role MonthRole {
    method has-five-full-weekends {
        # The month must have 31 days.
        return False unless self.days-in-month == 31;
        # The month must begin on a Friday.
        my $date = self.day == 1 ?? self !! Date.new( self.year, self.month, 1 );
        return $date.day-of-week == 5;
    }

    method month-name-short {
        given self.month {
            when  1 { 'Jan' }
            when  2 { 'Feb' }
            when  3 { 'Mar' }
            when  4 { 'Apr' }
            when  5 { 'May' }
            when  6 { 'Jun' }
            when  7 { 'Jul' }
            when  8 { 'Aug' }
            when  9 { 'Sep' }
            when 10 { 'Oct' }
            when 11 { 'Nov' }
            when 12 { 'Dec' }
        }
    }
}

sub find-months( $from, $to ) {
    my @matches;
    for $from .. $to -> $year {
        for 1 .. 12 -> $month {
            my $date = Date.new($year,$month,1) but MonthRole;
            push @matches, $date if $date.has-five-full-weekends;
        }
    }
    return @matches;
}

sub MAIN( $from = 1900, $to = 2019 ) {
    my @matches = find-months( $from, $to );
    say "Found @matches.elems() months with 5 full weekends";
    for @matches.classify( { .year } ).pairs.sort({ .key }) -> $pair {
        say "{$pair.key}: { $pair.value>>.month-name-short.join(', ') }";
    }
}


