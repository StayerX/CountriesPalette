class CountrySerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :longitude,
             :latitude,
             :two_char_code
end
