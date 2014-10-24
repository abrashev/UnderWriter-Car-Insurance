json.array!(@users) do |user|
  json.extract! user, :title, :surname, :firstname, :phone, :dateofbirth, :licencetype, :licenceperiod, :occupation,:incidents,:address
  json.url user_url(user, format: :json)
end
