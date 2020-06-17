#!/usr/bin/python3

import glob
import math
import json

input = "SVG/*"
lr = [] # list of (layer, region) tuples

for i in glob.iglob(input):
    print(i[4:]) # print name
    l = int(i[4:7]) # layer
    r = int(i[8:11]) # region
    lr.append((l-1,r)) # add to list (start counting from 0)

regions_by_layer = {} # dictionnary layer -> regions
layers_by_region = {} # dictionnary region -> layers
region_center = {} # dictionnay region -> middle layer

for i in range(138): # initialize layers
    regions_by_layer[i] = []

for i in range(1,295): # initialize region
    layers_by_region[i] = []

for (l,r) in lr: # fill in dicts
    regions_by_layer[l].append(r)
    layers_by_region[r].append(l)

def mean(array):
    return sum(array)/len(array)

for i in range(1,295): # search middle
    region_center[i] = math.floor(mean(layers_by_region[i]))

combined = { # combine all in one dict
    "regions_by_layer": regions_by_layer,
    "layers_by_region": layers_by_region,
    "region_center": region_center,
}

# export to json file
output = open("region-center.json", "w")
output.write(json.dumps(combined))
