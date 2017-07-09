# == Schema Information
#
# Table name: feeds
#
#  id                  :integer          not null, primary key
#  message             :text
#  external_id         :string
#  provider            :string
#  type                :string
#  author_uid          :string
#  provider_type       :string
#  provider_created_at :datetime
#  provider_updated_at :datetime
#  author_id           :integer
#  created_at          :datetime
#

require 'rails_helper'

RSpec.describe Feed, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
