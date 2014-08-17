# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  phone       :string(255)
#  information :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Client do
  pending "add some examples to (or delete) #{__FILE__}"
end
