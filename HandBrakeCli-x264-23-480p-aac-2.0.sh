#!/bin/bash

INFILE=$(basename "$1")
INDIR=$(dirname "$1")
OUTDIR="$INDIR/enc"
OUTFILE="$OUTDIR/$INFILE.out.mp4"

mkdir -p "$OUTDIR" || exit 1

#HandBrakeCLI -i "$FILE" -f mp4 -s 1 --aencoder copy -e x265 --maxHeight 720 --decomb bob -o "$FILE.x265.mp4"

HandBrakeCLI -i "$INFILE" -f mp4 --subtitle scan --native-language eng --aencoder av_aac --mixdown stereo -e x264 -q 23 --maxWidth 720 --maxHeight 480 --decomb bob -o "$OUTFILE"

