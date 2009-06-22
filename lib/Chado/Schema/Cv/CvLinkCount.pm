package Chado::Schema::Cv::CvLinkCount;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cv_link_count");
__PACKAGE__->add_columns(
  "cv_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "relation_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 1024,
  },
  "relation_cv_name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "num_links",
  { data_type => "bigint", default_value => undef, is_nullable => 1, size => 8 },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wkSCIMNz4JdHXlBhISwrxg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
