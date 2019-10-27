-- Common settings for texjporg development repo, used by l3build script

stdengine    = stdengine    or "eptex"

checkdeps   = checkdeps   or
  {
--    maindir .. "/some/subdirectory/of/dependent/package",
  }

checkengines    = checkengines
  or {"pdftex", "xetex", "luatex", "ptex", "uptex"}
checksuppfiles  = checksuppfiles  or
  {
    "regression-test.cfg",
    "regression-test.tex"
  }

if checksearch == nil then
  checksearch = false
end
