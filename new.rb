require 'csv'

## csv file path containing all the collector info 
srcc = "SRCC Collectors.csv"

# seeing headers
headers = CSV.foreach(srcc).first
#puts headers

## loading the dataframe and read each column value
df = []
CSV.foreach(srcc, headers: true) do |ii|
  df << ii
end

#puts df[0]["FRta"]

## Creating name list
collector_name = []
df.each do |i|
  collector_name.append(i['Name'])
end
# puts collector_name[0,10]

# 5-Area, 6-FRta, 7-FRUL, 8-IAM
class SELECT_COLL
  attr_accessor :df, :name 

  def initialize(df, name)
    @df = df
    @name = name 
    @area = 0
    @frta = 0
    @frul = 0
    @iam = 0
  end

  def main_func
    df.each do |ii|
      if ii['Name'] == name
        @area = ii[5]
        @frta = ii[6]
        @frul = ii[7]
        @iam = ii[8]
        break
      end
    end
  end

  def name
    @name
  end

  def area 
    @area
  end

  def frta 
    @frta
  end

  def frul 
    @frul
  end

  def iam 
    @iam
  end
end

# Calling the function

puts '*'*50
puts 'selected collector'
puts df[200]

collector_name = df[200]['Name']
# Calling the CLASS
collector = SELECT_COLL.new(df,collector_name)
collector.main_func
puts '-'*50
puts collector_name
area, frta, frul, iam = collector.area, collector.frta, collector.frul, collector.iam
puts "Area: #{area}, FRta: #{frta}, FRUL: #{frul}, IAM: #{iam}"

