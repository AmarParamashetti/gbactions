# Scripts

This directory contains set of python scripts for release-qualification testing.
To run the script, use command `python3 -m scripts.script_name` (without `.py` !!!) from project root

## Arguments

Most of the scripts by default support 3 arguments:
 - `retailer`: retailer-codename, e.g. `sunbrid`, `winter`, `wings`, eightyone etc, NOT real brand names like "sedanos" or "wakefern"
 - `env`: env type, e.g. `dev`, `qai`
 - `location-code-tom`: location-id of the MFC, against which the script is executed. To check available locations for particular retailer and env, run `python3 -m scripts.locations retailer env`

**To pass them, just mention them in appropriate order after script name in the command:**

```
python3 -m scripts.script_name retailer env location-code
```

Some of the scripts support additional arguments, they are mentioned in individual script descriptions below

## Scripts

### orderflow

To run: `python3 -m scripts.orderflow retailer env location-code-tom`, for example:

```
python3 -m scripts.orderflow abs qai 0068
```

Additionally, you can run orderflow script with your custom tom-ids. They will be checked for validity and treated accordingly in order flow - if they are FLO items, stock will be cleared and dynamic addesses for putaway will be suggested, if they are weighted - weight value will be inserted into the barcode, etc. So don't hesitate!

To insert custom tom ids, add `p` argument and your tom-ids separated by space:

```
python3 -m scripts.orderflow abs qai 0068 p tom-id1 tom-id2
```

### inbound_flow


### itemmaster_upload


### generate_sc


### locations