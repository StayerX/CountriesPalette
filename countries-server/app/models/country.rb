class Country < ActiveRecord::Base
  def self.find_with_join
    Country.find_by_sql("select * from countries left join country_datas on countries.name = country_datas.name")
  end
end
