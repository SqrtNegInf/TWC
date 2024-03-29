#!/usr/bin/env perl
use v5.36;

my $S = $ARGV[0] || "25525511135";
my @V = ipv4_partition($S);
print sprintf("%s = %s\n", $S, join (", ", @V));

sub ipv4_partition {
    my ($ipv4_string) = @_;

    my @valid = ();
    my $ipv4  = '';
    foreach my $i (1 .. length($ipv4_string)-3) {
        foreach my $j ($i+1 .. length($ipv4_string)-2) {
            foreach my $k ($j+1 .. length($ipv4_string)-1) {
                $ipv4 = substr($ipv4, 0, $k) . "." . substr($ipv4, $k)
                    if (length($ipv4) >= $k);
                $ipv4 = substr($ipv4, 0, $j) . "." . substr($ipv4, $j)
                    if (length($ipv4) >= $j);
                $ipv4 = substr($ipv4, 0, $i) . "." . substr($ipv4, $i)
                    if (length($ipv4) >= $i);

                push @valid, $ipv4 if is_valid($ipv4);
                $ipv4 = $ipv4_string;
            }
        }
    }

    return @valid;
}

sub is_valid {
    my ($ipv4) = @_;
    return 0 if (length($ipv4) == 0);

    foreach my $octet (split /\./, $ipv4) {
        return 0 if ((length($octet) > 3)
                     ||
                     ($octet > 255)
                     ||
                     (length($octet) > 1 && $octet =~ /^0/));
    }

    return 1;
}
