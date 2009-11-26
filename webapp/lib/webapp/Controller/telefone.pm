
package webapp::Controller::telefone;

use strict;
use warnings;
use parent 'Catalyst::Controller';

# Nos estamos utilizando um mecanismo muito interessante neste 
# exemplo, que recomendo a utilizacao, o Chained.
# Nao iremos entrar tao afundo sobre ele, porem ele ajuda
# manusearmos os argumentos passados pela URI.
# Por tanto, vamos criar uma rotina "base" no qual todas as 
# requisicoes passaram por ela (Chained()).
# search.cpan.org/dist/Catalyst-Runtime/lib/Catalyst/DispatchType/Chained.pm
sub base :Chained('/') CaptureArgs(0) PathPart('telefone') {
	my ($self, $c) = @_;
	
	$c->stash->{collection} = $c->model('DB::telefones');
}

sub list :Chained('base') Args(0)  {
	my ($self, $c) = @_;
	my $key = $c->req->param('key') || ""; 

	my $items = $c->stash->{collection}->search_like({
					nome => "\%$key\%",
					telefone => "\%$key\%"
					});
	$c->stash->{key} = $key;
	$c->stash->{items} = $items;
}

sub destroy :Chained('base') :Args(1) {
	my ($self, $c, $id) = @_;
	my $row = $c->stash->{collection}->find({ id => $id });
	$row->delete if $row;
}

sub edit :Chained('base') :Args(1) {
	my ($self, $c, $id) = @_;

	my $row = $c->stash->{row} = $c->stash->{collection}->find({id => $id});
	$c->stash->{template} = "telefone/create.tt";

	$c->detach() unless $c->req->method eq 'POST';

	my $parameters;
	$parameters->{nome} = $c->req->param('nome');
	$parameters->{telefone} = $c->req->param('telefone');

	$row->update($parameters);
	$c->stash->{template} = "telefone/edit_ok.tt";
}

sub create :Chained('base') :Args(0) {
	my ($self, $c) = @_;
	$c->detach() unless $c->req->method eq 'POST';

	my $parameters;
	$parameters->{nome} = $c->req->param('nome');
	$parameters->{telefone} = $c->req->param('telefone');

	my $row = $c->stash->{collection}->new($parameters);	
	$row->insert;	

	$c->stash->{template} = "telefone/create_ok.tt";
}

sub index :Path :Args(0) {
	my ($self, $c) = @_;
	
	$c->res->redirect(
		$c->uri_for(
			$c->controller->action_for('list')
		)
	);
}

1;

