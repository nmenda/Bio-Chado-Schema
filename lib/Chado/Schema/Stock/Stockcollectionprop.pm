package Chado::Schema::Stock::Stockcollectionprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("stockcollectionprop");
__PACKAGE__->add_columns(
  "stockcollectionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('stockcollectionprop_stockcollectionprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "stockcollection_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("stockcollectionprop_id");
__PACKAGE__->add_unique_constraint("stockcollectionprop_pkey", ["stockcollectionprop_id"]);
__PACKAGE__->add_unique_constraint(
  "stockcollectionprop_c1",
  ["stockcollection_id", "type_id", "rank"],
);
__PACKAGE__->belongs_to(
  "stockcollection_id",
  "Chado::Schema::Stock::Stockcollection",
  { stockcollection_id => "stockcollection_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7HlZWIzQ5yj3AI78qRdHNw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
