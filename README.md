## wzulfikar/kit

[WIP]

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

# run the command you want
kit qotd
```
