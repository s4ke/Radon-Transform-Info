python plotting.py
ffmpeg -v warning -i %%02d.png -i ../palette.png -lavfi "paletteuse,setpts=6*PTS" -y ../ctscan.gif