package HTML::Mason::Request::Catalyst;
# ABSTRACT: Catalyst-aware HTML::Mason::Request object

use Moose;
use namespace::autoclean;

extends 'HTML::Mason::Request::Moosified';
with 'MasonX::RequestContext::Catalyst';

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

L<MasonX::RequestContext::Catalyst> is used to provide
a C<catalyst_ctx> attribute to be filled by the view when rendering
a component.

=cut

__PACKAGE__->meta->make_immutable;

1;
