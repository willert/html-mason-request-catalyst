package HTML::Mason::Request::Catalyst;
# ABSTRACT: Catalyst-aware HTML::Mason::Request object

use Moose;
use MooseX::NonMoose;

use namespace::autoclean;

extends 'HTML::Mason::Request';
with 'MasonX::TraitFor::Request::Catalyst::Context';

=head1 SYNOPSIS

    # In your view:

    package MyApp::View::Mason;
    use Moose;
    extends 'Catalyst::View::HTML::Mason';

    __PACKAGE__->config(
        request_class => 'HTML::Mason::Request::Catalyst',
    );
    __PACKAGE__->meta->make_immutable;

    1;

    # In your component

    <% $m->catalyst_ctx->uri_for( '/' ) %>

=head1 DESCRIPTION

B<HTML::Mason::Request::Catalyst> provides a Catalyst-aware request object
for L<HTML::Mason> resp. L<HTML::Mason>-based L<Catalyst::View> classes.

The class itself is a small wrapper around L<HTML::Mason::Request> and uses
L<MooseX::NonMoose> to moosify the request class.
L<MasonX::TraitFor::Request::Catalyst::Context> is used to provide
a C<catalyst_ctx> attribute to be filled by the view when rendering
a component.

=cut

sub FOREIGNBUILDARGS {
  my ( $class, %args ) = @_;

  # remove attributes from base class constructor because
  # Mason applies strict attribute checking and will bail
  # out on unknown options
  delete $args{ $_ } for map{ $_->init_arg || $_->name }
    grep{ $_->has_init_arg } $class->meta->get_all_attributes;

  return %args;
}

__PACKAGE__->meta->make_immutable;

1;
