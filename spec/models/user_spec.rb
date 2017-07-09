# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  nick_name           :string
#  phone               :string
#  avatar              :string
#  email               :string
#  encrypted_password  :string
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
