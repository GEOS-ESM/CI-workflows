help([[
]])

local pkgName    = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

local CIroot = "/discover/nobackup/jardizzo/CI/swell/nightly"
local rbase = pathJoin(CIroot, pkgVersion, "jedi_build/build-intel-release")

local base = subprocess("realpath " .. rbase)
local pythondir = "python3.9"

prepend_path("PATH", pathJoin(base,"bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base,"lib"))
prepend_path("PYTHONPATH", pathJoin(base,"lib",pythondir))
prepend_path("PYTHONPATH", pathJoin(base,"lib",pythondir,"pyioda"))

whatis("Name: ".. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: Library")
whatis("Description: JEDI Bundle Build")
