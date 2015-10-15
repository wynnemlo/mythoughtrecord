json.array! @thoughtrecords do |thoughtrecord|
  json.id thoughtrecord.id
  json.situation thoughtrecord.situation
  json.feelings thoughtrecord.feelings
  json.unhelpfulthoughts thoughtrecord.unhelpfulthoughts
  json.supportingfacts thoughtrecord.supportingfacts
  json.disprovingfacts thoughtrecord.disprovingfacts
  json.altperspective thoughtrecord.altperspective
  json.outcome thoughtrecord.outcome
  json.created_at easy_datetime(thoughtrecord.created_at)
end