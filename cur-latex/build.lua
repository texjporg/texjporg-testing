#!/usr/bin/env texlua

-- Build script for cur-latex packages

stdengine    = stdengine    or "ptex"

-- Identify the bundle and module
-- Just filler as this is purely a location for tests
module = "cur-latex"
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
  ["platex-e"] = {binary="eptex", format = "platex-e", options="-kanji-internal=euc" },
  ["platex-s"] = {binary="eptex", format = "platex-s", options="-kanji-internal=sjis" },
  ["uplatex-e"] = {binary="euptex", format = "uplatex-e", options="-kanji-internal=euc" },
  ["uplatex-s"] = {binary="euptex", format = "uplatex-s", options="-kanji-internal=sjis" },
  ["uplatex-u"] = {binary="euptex", format = "uplatex-u", options="-kanji-internal=uptex" },
}

checkengines = checkengines
  or {"platex-e", "platex-s", "uplatex-e", "uplatex-s","uplatex-u"}
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
