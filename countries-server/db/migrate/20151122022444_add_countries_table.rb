class AddCountriesTable < ActiveRecord::Migration
  def change
    create_table :countries do |c|
      c.string :name
      c.string :two_char_code
      c.decimal :longitude
      c.decimal :latitude
    end
  end
end
