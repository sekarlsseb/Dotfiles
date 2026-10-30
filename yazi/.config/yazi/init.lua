function Linemode:all_info()
	local cha = self._file.cha

	-- Size
	local size = self._file:size()
	local size_str = size and ya.readable_size(size) or "-"

	-- Modified time
	local time = math.floor(cha.mtime or 0)
	local time_str
	if time == 0 then
		time_str = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time_str = os.date("%b %d %H:%M", time)
	else
		time_str = os.date("%b %d  %Y", time)
	end

	-- Permissions
	local perm = cha:perm() or ""

	-- Owner (user:group)
	local owner = ""
	if ya.user_name and cha.uid then
		owner = (ya.user_name(cha.uid) or cha.uid) .. ":" .. (ya.group_name(cha.gid) or cha.gid)
	end

	return string.format("%s %s %s %s", perm, owner, size_str, time_str)
end
