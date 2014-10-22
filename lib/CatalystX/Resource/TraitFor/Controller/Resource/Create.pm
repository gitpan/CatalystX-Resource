package CatalystX::Resource::TraitFor::Controller::Resource::Create;
{
    $CatalystX::Resource::TraitFor::Controller::Resource::Create::VERSION = '0.002002';
}

use MooseX::MethodAttributes::Role;
use namespace::autoclean;

# ABSTRACT: a create action for your resource

requires qw/
    resultset_key
    resource_key
    form
    /;

has 'activate_fields_create' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    default => sub { [] },
);

sub create : Method('GET') Method('POST') Chained('base') PathPart('create')
    Args(0) {
    my ( $self, $c ) = @_;
    my $resource = $c->stash->{ $self->resultset_key }->new_result( {} );
    $c->stash(
        $self->resource_key => $resource,
        set_create_msg      => 1,
    );
    $self->form( $c, $self->activate_fields_create );
}

1;

__END__
=pod

=head1 NAME

CatalystX::Resource::TraitFor::Controller::Resource::Create - a create action for your resource

=head1 VERSION

version 0.002002

=head1 ATTRIBUTES

=head2 activate_fields_create

hashref of form fields to activate in the create form
e.g. ['password', 'password_confirm']
default = []
Can be overriden with $c->stash->{activate_form_fields}

Example: You only want admins to be able to change a field.
Disable field by default in HTML::FormHandler.

=head1 ACTIONS

=head2 create

create a resource

=head1 AUTHOR

David Schmidt <davewood@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by David Schmidt.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

