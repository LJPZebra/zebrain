#!/usr/bin/python3

import xml.etree.ElementTree as ET
import os
import glob

# set root namespace to svg
ET.register_namespace('', 'http://www.w3.org/2000/svg')

# source and dest path
source = "SVG/"
dest = "EXTRACT/"
os.mkdir(dest)

# run across layers
for z in range(1,139):
    # create a svg for this layer
    ztag = f"{z:03d}"
    svg = ET.Element('svg')
    # base element attribute
    svg.attrib.update({"id": f"z-{ztag}", "height": "1406px", "width": "621px"})
    path = f"{source}{ztag}*"
    # run across regions
    for f in glob.iglob(path):
        print(f)
        xtag = f[4+len(source):7+len(source)]
        tree = ET.parse(f)
        r = tree.getroot()
        g = r[1]
        # group attribute
        # g.attrib.update({"fill": "rgba(0,0,0,0.5)", "id": f"x-{xtag}"})
        g.attrib.pop("fill")
        g.attrib.pop("stroke")
        g.attrib.update({"class": f"zone", "onclick": f"""clickedOn('x-{xtag}')"""}) # OPTI move onclick to JS ?
        svg.append(g)
    # output file
    SVG = ET.ElementTree(element=svg)
    SVG.write(f'{dest}layer_{ztag}.svg', 'utf-8')
