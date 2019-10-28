#!/usr/bin/env texlua

-- for debugging
--local orig_execute = os.execute
--os.execute = function(...) 
--  print("EXE", ...); return orig_execute(...)
--end

-- Build script for dev-plain packages

-- Identify the bundle and module
-- Just filler as this is purely a location for tests
module = "dev-plain"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."

-- Non-standard settings
checkdeps   =
  {
--    maindir .. "/some/subdirectory/of/dependent/package",
  }
checksearch = true

specialformats = specialformats or {}
specialformats.ep = specialformats.ep or
{
  ["eptex"] = {binary="eptex", format = "eptex", options="" },
  ["euptex"] = {binary="euptex", format = "euptex", options="" },
  ["eptex-beta-empty"] = {binary="eptex-beta", format = "eptex-beta", options="-translate-file=empty.tcx" },
  ["eptex-beta-cp227"] = {binary="eptex-beta", format = "eptex-beta",  options="-translate-file=cp227.tcx" },
  ["euptex-beta-empty"] = {binary="euptex-beta", format = "euptex-beta",  options="-translate-file=empty.tcx" },
  ["euptex-beta-cp227"] = {binary="euptex-beta", format = "euptex-beta",  options="-translate-file=cp227.tcx" }
}
  
checkengines    = checkengines
  or {"eptex", "euptex", "eptex-beta-cp227", "euptex-beta-cp227","eptex-beta-empty", "euptex-beta-empty"}
checkformat  = "ep"

-- If we want to stop processing at the first error
-- checkopts = "-interaction=batchmode -halt-on-error"

-- Load the common build code
dofile(maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
