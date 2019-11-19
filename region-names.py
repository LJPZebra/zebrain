import json

# transform region_names.txt in region_names.json

file = open("region-names.txt", "r")
lines = file.readlines()
file.close()
region_names = {}

for line in lines:
    layerID = f"x-{line[0:3]}"
    name = line[4:-1]
    region_names.update({layerID: name})

output = open("region-names.json", "w")
output.write(json.dumps(region_names))
