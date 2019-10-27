#!/usr/bin/env texlua

-- Build script for texjporg files

-- No bundle or module here, but these have to be defined
bundle  = "texjporg"
module  = ""

-- A couple of custom variables: the order here is set up for 'importance'
bundles      = { }
checkbundles =
  {
    "ptex-base",
    "dev-plain",
    "dev-latex"
  }

-- Location of main directory: use Unix-style path separators
maindir = "."

-- A custom main function
function main(target)
  local errorlevel
  if target == "check" then
    errorlevel = call(checkbundles, "check")
  else
    help ()
  end
  if errorlevel ~=0 then
    os.exit(1)
  end
end

-- Find and run the build system
kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
