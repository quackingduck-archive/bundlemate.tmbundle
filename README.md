Bundlemate is a weirdly name weird piece of software.

What it does is take `bundle.yaml` source file as input and produce a bunch of
files and folders that make up a textmate bundle as output.

If it doesn't make sense to you why someone might want to do that then that's
good news! You can close this browser window now and continue with your life.
Thanks for stopping by.

---

Bundlemate's own `bundle.yaml` requires bundlemate to be installed before it
can built. From TextMate, install the bundle, open the `bundle.yaml` file and
hit command+shift+b and it will be rebuilt.

It can also be built from outside of TextMate. Just run `make` from the
command line.

---

The bundle compiler is written in ruby, the source code is in the `Support`
folder of this project. It runs fine on the default OSX install of ruby and
has no external dependencies.
