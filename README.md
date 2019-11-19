# How I made this

1. download data from zebrain (`MaskDatabase.mat` and `xxx.nrrd`)
2. with matlab export masks as PNG and correspondence table (`export_zebrain.m`)
3. with imagej export layers as JPEG (open `.nrrd` and export image sequence)
4. with potrace vectorize to svg (`vectorize.sh`)
5. with python combine and tag svgs (`extract.py`)
6. with python combine all svgs in one file (`combine.py`)
7. with python convert region names to json (`region-names.py`)
8. with javascript manage slider events and display region name on click
9. with python launch a local server `python -m http.server`


## TODO
- set colors according to hierarchy
- be size-agnostic (allow resize of base image)
- put svg small regions above larger ones
- allow loading html as a single file (include json in file)
