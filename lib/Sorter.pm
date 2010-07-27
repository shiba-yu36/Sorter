package Sorter;
use strict;
use warnings;



sub new {
    my $class = shift;
    bless {}, $class;
}

sub set_values {
    my ($self, @args) = @_;
    $self->{values} = \@args;
}

sub get_values {
    my $self = shift;
    return if !$self->{values};
    return @{ $self->{values} };
}

1;
