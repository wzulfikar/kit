
██╗  ██╗██╗████████╗
██║ ██╔╝██║╚══██╔══╝
█████╔╝ ██║   ██║
██╔═██╗ ██║   ██║
██║  ██╗██║   ██║
╚═╝  ╚═╝╚═╝   ╚═╝

**kit: collection of utilities packaged in docker.**

If the size or the content aren't suitable for you, you can customize the `Dockerfile` –– remove packages, add, etc. and build your own `kit` image.

Sample usage:

```
# display quote of the day
docker run -it --rm wzulfikar/kit qotd

# crop image
docker run -it --rm -v $(pwd):/data wzulfikar/kit crop raspberry-pi-pinout.png 10x10+0+0
```

to shorten the command, use alias:

```
# add below snippet to your profile (ie. ~/.bashrc)
alias kit="docker run -it --rm -v $(pwd):/data wzulfikar/kit "
```

once the alias is created, you can execute programs available inside the kit from this command:

```
kit <command name>
```

for example, to show the content of this README file, run `kat`:

```
kit kat
```

## What's included?

You can see the content of `Dockerfile` for a complete list of what inside the kit. This list serve as "remarks" to provide more context on what the kit contains.

- wzulfikar/lab/bash
  - ocr
  - crop
  - collate
  - etc.
- harvest
- photon
