class PoptartSerializer < ActiveModel::Serializer
  attributes :flavor, :sprinkles
  root false
end
