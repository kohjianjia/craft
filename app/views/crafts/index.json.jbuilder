json.array! @crafts do |craft|
	json.lat craft.latitude
	json.lng craft.longitude
	json.title craft.title
end