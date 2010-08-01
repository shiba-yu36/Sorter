package Sorter;
use strict;
use warnings;



sub new {
    my $class = shift;
    bless {
        values => [],
    }, $class;
}

sub set_values {
    my ($self, @args) = @_;
    $self->{values} = \@args;
    return @{ $self->{values} };
}

sub get_values {
    my $self = shift;
    return @{ $self->{values} };
}

sub push {
    my ($self, $value) = @_;
    $self->set_values($self->get_values, $value);
    return $self;
}

sub sort {
    my $self = shift;
    my @values = $self->get_values;

    return @values if @values <= 1;

    my $left  = __PACKAGE__->new;
    my $right = __PACKAGE__->new;

    my $pivot = shift @values;              # とりあえず最初を取る感じで

    for my $value (@values) {
        $left->push($value)  if $value <= $pivot;
        $right->push($value) if $value > $pivot;
    }

    $self->set_values($left->sort, $pivot, $right->sort);
}

1;
