#!/usr/bin/python3

from string import Template

sourcedir = "EXTRACT"
catimg ="" # emtpy string for concatenating imgs
catsvg = "" # empty string for concatenating svgs

for z in range(1,139): # layer 001 ... 138
    catimg += f"""<img id="img-{z:03d}" src="./JPEG/layer{z-1:03d}.jpg"/>\n"""
    with open(f"{sourcedir}/layer_{z:03d}.svg") as svg:
        catsvg += svg.read() + "\n"

template = Template(open("template.html", "r").read())
output = open("index.html", "w")
output.write(template.substitute(slices = catimg, SVGs = catsvg))
output.close()
