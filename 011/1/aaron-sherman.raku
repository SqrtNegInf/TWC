#!/usr/bin/env raku

# Note that this is the only place we keep the
# units, so everything else except comments has
# to derive even the abbreviations from this lookup.
our %knowns = (
    unit => <F C>,
    freezing => [32, 0],
    boiling => [212, 100] );

proto MAIN($input?) {*}

multi MAIN(
        #= Convert the given value e.g. 37C
        Str $input where m/<after \d><alpha>$/
) {
    my $value = +$input.substr(0,*-1);
    my $from = $input.substr(*-1);
    my $units = %knowns<unit>.join('/');
    die "$from is not one of $units" if !%knowns<unit>.grep: * eq $from;
    my $to = %knowns<unit>.grep({$_ ne $input}).first;
    say "$value$from in $to: {convert($value, :$to)}";
}

multi MAIN(
        #= Show conversion for given unit e.g. C
        Str $input where $input eq [|] |%knowns<unit>
) {
    my $to = %knowns<unit>.grep({$_ ne $input}).first;
    my $conversion = conversion(:$to);
    my $scale = $conversion<scale>.nude.join('/');
    say "Conversion to $to: {$input}*{$scale} + {$conversion<offset>}";
}

#= by default show crossover for units
multi MAIN() {
    my $units = %knowns<unit>.join('/');
    say "$units cross over at {crossover}";
}

sub other-unit($unit) { return %knowns<unit>.grep({$_ ne $unit}).first }

sub convert($value, :$to where $to eq [|] |%knowns<unit>) {
    my $conv = conversion(:$to);
    return $value*$conv<scale> + $conv<offset>;
}

sub crossover() {
    my $conv = conversion(:to<F>);
    return $conv<offset>/(1-$conv<scale>);
}

sub conversion(:$to where $to eq [|] |%knowns<unit>) {
    my $to-index = %knowns<unit>.first: * eq $to, :k;
    # Get the offset between the two
    my $offset = [-] |%knowns<freezing>;
    my $scale = [/] (|%knowns<boiling> <<->> |%knowns<freezing>);
    if !$to-index {
        return { scale => $scale, offset => $offset, index => $to-index };
    } else {
        return { scale => 1/$scale, offset => -$offset, index => $to-index };
    }
}
