# Zebrain contour

This is a really simple code to make the interface available at [http://wiki.ljp.upmc.fr/zebrain/](http://wiki.ljp.upmc.fr/zebrain/). It contains a collection of scripts used to produce the base svg files and the JavaScript that makes it interactive in browser. 

## Interface usage

Use the slider to scroll between layers. Hover your mouse over a contour to display it's area. In the text area, enter a list of space-separated integers corresponding to regions. Also allows keywords like "all", "none" and "vestibular" to display a pre-defined set of regions. Every feature is presented on this annotated screenshot. The interface is designed to be light and readable even on a small screen.

[![screenshot](./screenshot.svg.png)](http://wiki.ljp.upmc.fr/zebrain/)

## Script usage

If you want to produce yourself the base svg files (for example to make an overlay for some figures), here is the way to go:

You will need:

- bash
- MATLAB
- ImageJ
- potrace (`sudo apt install potrace`)
- python3
- a web browser (tested with Firefox and Chromium)

Clone the repo and run the scripts inside it as follows.

1. **download.sh** download `MaskDatabase.mat` (120Mo) and `Ref20131120pt14pl2.nrrd` (230Mo) from [Z-Brain Atlas](https://engertlab.fas.harvard.edu/Z-Brain/)
2. **export_zebrain.m** with _matlab_ export masks as PNG and correspondence table
3. **export.ijm** with _imagej_ export layers as JPEG
4. **vectorize.sh** with _potrace_ (inkscape) vectorize to svg
5. **extract.py** with _python_ combine and tag svgs
6. **combine.py** with _python_ combine all svgs in one file
7. **region-names.py** with _python_ convert region names to json
8. **serve.sh** with _python_ serve the files and open the browser

## Bug or feature request

Please [file an issue](https://github.com/LJPZebra/zebrain/issues/new) to report a bug or request a feature.