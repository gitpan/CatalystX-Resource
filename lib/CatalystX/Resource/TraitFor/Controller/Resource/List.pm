package CatalystX::Resource::TraitFor::Controller::Resource::List;
{
    $CatalystX::Resource::TraitFor::Controller::Resource::List::VERSION = '0.001_006';
}

use MooseX::MethodAttributes::Role;
use namespace::autoclean;

# ABSTRACT: a list action for your resource

requires qw/
    resources_key
    resultset_key
    /;

sub list : Method('GET') Chained('base') PathPart('list') Args(0) {
    my ( $self, $c ) = @_;
    $c->stash(
        $self->resources_key => [ $c->stash->{ $self->resultset_key }->all ]
    );
}

1;

__END__

=pod

=head1 NAME

CatalystX::Resource::TraitFor::Controller::Resource::List - a list action for your resource

=head1 VERSION

version 0.001_006

=head1 ACTIONS

=head2 list

display list (index) of all resources

=head1 AUTHOR

David Schmidt <davewood@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by David Schmidt.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
