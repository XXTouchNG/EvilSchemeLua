local _M = {}
local PATH = require "path"
local _PATH = PATH.new("/")

_M.setup = function (preset)
	local tweak_plist = "/Library/MobileSubstrate/DynamicLibraries/ZZ_EvilScheme.plist"
	local installer_root = "/var/mobile/Media/1ferver/lua/scripts/plugins/EvilScheme/packages"
	local presets_root = "/var/mobile/Media/1ferver/lua/scripts/plugins/EvilScheme/presets"
	local preset_path = _PATH.join(presets_root, preset .. ".tar")
	if not _PATH.exists(preset_path) then
		return false, "preset not found"
	end
	if not _PATH.exists(tweak_plist) then
		os.execute("dpkg -i \'" .. installer_root .. "\'/*.deb")
		os.execute("sbreload || killall -9 SpringBoard")
		sys.sleep(5)
	end
	os.execute("tar -xf \'" .. preset_path .. "\' -C /")
	return true, nil
end

return _M