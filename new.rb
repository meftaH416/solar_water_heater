require 'csv'

srcc = "SRCC Collectors.csv"

# seeing headers
headers = CSV.foreach(srcc).first
puts headers

## loading the dataframe and read each column value
df = []
CSV.foreach(srcc, headers: true) do |row|
  df << row
end

puts df[0]["FRta"]

## Creating simple function
def swh(frta, frul, iam)
  return (frta.to_f * frul.to_f * iam.to_f)
end

puts swh(df[0]["FRta"], df[0]["FRUL"], df[0]["IAM"])