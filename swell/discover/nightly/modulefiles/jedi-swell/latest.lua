help([[
]])

local base = subprocess("realpath /discover/nobackup/jardizzo/CI/swell/nightly/latest/jedi_build/build-intel-release")
local pythondir = "python3.9"

prepend_path("PATH", pathJoin(base,"bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(base,"lib"))
prepend_path("PYTHONPATH", pathJoin(base,"lib",pythondir))
prepend_path("PYTHONPATH", pathJoin(base,"lib",pythondir,"pyioda"))

whatis("Name: JEDI Bundle")
whatis("Version: latest")
whatis("Category: library")
whatis("Description: JEDI Bundle Build")
