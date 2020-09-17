require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  table = CSV.parse(File.read(filename), headers:true)

  medalist_table = Array.new(table.length) do |i|
    row = Hash.new()
    %w(ID Name Height Team Year City Sport Event Medal).each{|header| row[header] = table[i][header]}
    row
  end

  return medalist_table
end

def total_medals_per_team(olympic_data)
  total_medals = Hash.new()

  olympic_data.filter{ |row| row['Medal'] != 'NA'}.group_by{|row| row['Team']}.each do |team, rows|
    total_medals[team] = rows.length
  end

  return total_medals
end

def get_all_gold_medalists(olympic_data)
  olympic_data.filter{ |row| row['Medal'] == 'Gold'}
end

