json.array!(@quotations) do |quotation|
  json.extract! quotation, :identification, :quotepremium,:policyexcess,:breakdowncover,:windscreenrepair,:excesspaid,:user_id,:vehicle
  json.url quotation_url(quotation, format: :json)
end
