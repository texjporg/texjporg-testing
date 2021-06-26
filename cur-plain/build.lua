#!/usr/bin/env texlua

-- Build script for cur-plain packages

-- Identify the bundle and module
-- Just filler as this is purely a location for tests
module = "cur-plain"
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
specialformats.kint = specialformats.kint or
{
  ["eptex-e"] = {binary="eptex", format = "eptex-e", options="-kanji-internal=euc" },
  ["eptex-s"] = {binary="eptex", format = "eptex-s", options="-kanji-internal=sjis" },
  ["euptex-e"] = {binary="euptex", format = "euptex-e", options="-kanji-internal=euc" },
  ["euptex-s"] = {binary="euptex", format = "euptex-s", options="-kanji-internal=sjis" },
  ["euptex-u"] = {binary="euptex", format = "euptex-u", options="-kanji-internal=uptex" },
}

checkengines = checkengines
  or {"eptex-e", "eptex-s", "euptex-e", "euptex-s","euptex-u"}
checkformat  = "kint"

-- If we want to stop processing at the first error
-- checkopts = "-interaction=batchmode -halt-on-error"

-- Load the common build code
dofile(maindir .. "/build-config.lua")

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
