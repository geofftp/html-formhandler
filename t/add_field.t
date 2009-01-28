use Test::More  tests => 2;

use HTML::FormHandler::Field::Text;
use HTML::FormHandler::Field;

{
   package My::Form;
   use HTML::FormHandler::Moose;
   extends 'HTML::FormHandler';

   has '+name' => ( default => 'testform' );
   sub field_list {
       {
           fields    => {
               meat        => 'Text',
               starch      => { required => 1 },
               fruit       => 'Select',
           },
       }
   }

   sub options_fruit {
       return (
           1   => 'apples',
           2   => 'oranges',
           3   => 'kiwi',
       );
   }
}

my $form = My::Form->new;

ok( $form, 'get form' );

my $field = HTML::FormHandler::Field::Text->new( name => 'Testfield' );

$form->add_field($field);

ok( $form->field_exists('Testfield'), 'form now has test field' );


