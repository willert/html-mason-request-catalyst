package MasonX::TraitFor::Request::Catalyst::Context;
# ABSTRACT: Catalyst context for Mason

use Moose::Role;
use namespace::autoclean;

=head1 SYNOPSIS

    # In your Mason plugin

    package MyApp::Mason::Plugin::Log;
    use base qw(HTML::Mason::Plugin);

    sub start_component_hook {
        my ($self, $context) = @_;
        my ( $m, $comp, $args ) = @{ $context };

        my $meta = eval{ Class::MOP::class_of( $m ) } or return;
        return unless $meta->does_role(
            'MasonX::TraitFor::Request::Catalyst::Context
        );

        $m->catalyst_ctx->log->debug( "Rendering $comp" );
    }


=head1 DESCRIPTION

B<MasonX::TraitFor::Request::Catalyst::Context> is a L<Moose::Role>
that provides a standard interface to access the catalyst context
from within mason requests.

=attr catalyst_ctx

The Catalyst context object associated with the current request

=cut

has catalyst_ctx => (
  is       => 'ro',
  isa      => 'Catalyst',
  required => 1,
  weak_ref => 1,
);

no Moose::Role;

1;

