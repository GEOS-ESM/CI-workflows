help([[
]])

local pkgName    = myModuleName()
local pkgVersion = myModuleVersion()
local pkgNameVer = myModuleFullName()

local CIroot = "/discover/nobackup/gmao_ci/swell/nightly"
local rbase = pathJoin(CIroot, pkgVersion, "swell")

local base = subprocess("realpath " .. rbase)
local pythondir = "python3.9"

prepend_path("PATH", pathJoin(base,"bin"))
prepend_path("PYTHONPATH", pathJoin(base,"lib",pythondir,"site-packages"))
prepend_path("SUITEPATH", pathJoin(base,"lib",pythondir,"site-packages","swell","suites"))
prepend_path("SUITESPATH", pathJoin(base,"lib",pythondir,"site-packages","swell","suites"))

whatis("Name: ".. pkgName)
whatis("Version: " .. pkgVersion)
whatis("Category: Software")
whatis("Description: GMAO Coupled DA workflow suites ")
