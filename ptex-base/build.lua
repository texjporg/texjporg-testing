#!/usr/bin/env texlua

-- Build script for ptex-base packages

-- Identify the bundle and module
-- Just filler as this is purely a location for tests
module = "ptex-base"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Non-standard settings
checkdeps   =
  {
--    maindir .. "/some/subdirectory/of/dependent/package",
  }
checksearch = true

checkengines    = checkengines
  or {"eptex", "euptex"}
checkformat  = "tex"

-- In ptex-base testing, stop processing at the first error
checkopts = "-interaction=batchmode -halt-on-error"

-- Load the common build code
dofile(maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
