#!/usr/bin/env perl
use v5.36;

my $argv = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';

# @array holds output from my translation/deconstruction of this work
# @expand holds output from the original
my @array = expand($argv);
my @expand = brace_expand($argv);

say $argv;
say '-' x length $argv;
say join "\n", @array;
say '-' x length $argv;
say join "\n", @expand;
say '-' x length $argv;
exit;

sub expand ($input) {
    my @stack = ( [ my $current = [''] ] );
    my @input = $input =~ /\G ((?:[^\\{,}]++ | \\(?:.|\z))++ | . )/gx;

    # (?:whatever)  -- non-grouping
    # [^\\{,}]++    -- match 1 or more characters that are not curly or comma
    # \z            -- match end of string
    # \\(?:.|\z))   -- escape characters
    # .             --  any character, which would have to be a comma or curly

    # (matching (more than one(one or more non-curly noncommas | 
    #       escaping chars and end of line)) ) or one of anything left

    for my $token (@input) {
        if ( $token eq '{' ) { push @stack, ( [ $current = [''] ] ) }
        elsif ( $token eq ',' && @stack > 1 ) {
            push @{ $stack[-1] }, ( $current = [''] );
        }
        elsif ( $token eq '}' && @stack > 1 ) {
            my $group = pop @stack;
            $current = $stack[-1][-1];

            # handle the case of brace pairs without commas:
            @{ $group->[0] } = map { "{$_}" } @{ $group->[0] }
                if @$group == 1;

            # this is the part where the most magic happens
            @$current = map {
                my $c = $_;
                map {
                    map { $c . $_ }
                        @$_
                } @$group;
            } @$current;
        }
        else {
            $_ .= $token for @$current;
        }
        #say $json->encode( [ $token, \@stack ] );
    }

    # where I'm seeing it, this just pops out the deepest subarray
    # because it's done by now. 
    # Oh, it handles missing close-braces
    while ( @stack > 1 ) {
        my $right = pop @{ $stack[-1] };
        my $sep;
        if   ( @{ $stack[-1] } ) { $sep = ',' }
        else                     { $sep = '{'; pop @stack }
        $current  = $stack[-1][-1];
        @$current = map {
            my $c = $_;
            map { $c . $sep . $_ } @$right;
        } @$current;
    }

    return @$current;
}

# the example code, which I did not modify
sub brace_expand {
    my $input = shift;
    my @stack = ( [ my $current = [''] ] );

    while ( $input =~ /\G ((?:[^\\{,}]++ | \\(?:.|\z))++ | . )/gx ) {

        if ( $1 eq '{' ) {
            push @stack, [ $current = [''] ];
        }
        elsif ( $1 eq ',' && @stack > 1 ) {
            push @{ $stack[-1] }, ( $current = [''] );
        }
        elsif ( $1 eq '}' && @stack > 1 ) {
            my $group = pop @stack;
            $current = $stack[-1][-1];

            # handle the case of brace pairs without commas:
            @{ $group->[0] } = map { "{$_}" } @{ $group->[0] }
                if @$group == 1;

            @$current = map {
                my $c = $_;
                map {
                    map { $c . $_ }
                        @$_
                } @$group;
            } @$current;
        }
        else { $_ .= $1 for @$current; }
    }

    # handle the case of missing closing braces:
    while ( @stack > 1 ) {
        my $right = pop @{ $stack[-1] };
        my $sep;
        if   ( @{ $stack[-1] } ) { $sep = ',' }
        else                     { $sep = '{'; pop @stack }
        $current  = $stack[-1][-1];
        @$current = map {
            my $c = $_;
            map { $c . $sep . $_ } @$right;
        } @$current;
    }

    return @$current;
}
