-- Dump table to string
function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

function Image(elem)
	-- Edit the image urls to remove the baseurl
	-- So pandoc can actually find the files
	elem.src = string.gsub(elem.src, "^/", "")

	-- Make the images all 40% width
	elem.attributes["style"] = "width: 100px;"

	return elem
end
