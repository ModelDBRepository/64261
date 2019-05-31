set term post land enhanced color 10
set output " Data/bfstdp_demo_sin-0.0_20071217_1201.weights.ps"

set label 1001 '{/Helvetica-Bold=10 bfstdp\_defaultG}' at screen 0.15,0.6

set pm3d map
unset colorbox
unset xtics
unset ytics
unset key

set tmargin 0
set bmargin 0
set lmargin 0
set rmargin 0
set cbtics 0.02
set cbrange [0:0.02]

xtotalsize = 0.8
ytotalsize = 0.69

set size xtotalsize,ytotalsize
ny = 3	# number in the y direction
bx = 1	# number of blocks in the x-direction
nbx = 5	# plots per block
intrablock = -0.3  # negative because of all the white space
interblock = -0.1  # around pm3d plots.
ysep = -0.3

set multiplot

#nbx*bx*xsize + (bx-1)*interblock*xsize + bx*intrablock*xsize = xtotalsize
#xsize(nbx*bx + (bx-1)*interblock + bx*intrablock) = xtotalsize
xsize = xtotalsize/(nbx*bx + (bx-1)*interblock + bx*intrablock)
#ny*ysize + (ny-1)*ysep*ysize = ytotalsize
ysize = ytotalsize/(ny + ysep*(ny-1))
set size xsize,ysize
ox1 = 0
#ox2 = xsize*(nbx + intrablock + interblock)
#ox3 = 2*ox2
dox = xsize*(1+intrablock)
oy1 = ytotalsize - ysize
oy2 = ytotalsize - ysize*(2+ysep)
oy3 = 0

# First row ############################################
set origin ox1,oy1
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_0.conn2.w" matrix
unset label 1001

# Second row ###########################################
set origin ox1,oy2
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_0.conn1.w" matrix
set origin ox1+dox,oy2
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_1000000.conn1.w" matrix
set origin ox1+2*dox,oy2
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_2000000.conn1.w" matrix
set origin ox1+3*dox,oy2
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_3000000.conn1.w" matrix
set origin ox1+4*dox,oy2
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_4000000.conn1.w" matrix

# Third row ############################################

set origin ox1,oy3
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_5000000.conn1.w" matrix
set origin ox1+dox,oy3
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_6000000.conn1.w" matrix
set origin ox1+2*dox,oy3
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_7000000.conn1.w" matrix
set origin ox1+3*dox,oy3
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_8000000.conn1.w" matrix


# set labels before last plot
ytoplabel = ytotalsize-0.04
oxlabel = 0.02
set label 1 '{Conn2: {/Helvetica-Italic t} = 0 s}' at screen ox1+oxlabel,ytoplabel-oy3
set label 2 '{Conn1: {/Helvetica-Italic t} = 0 s}' at screen ox1+oxlabel,ytoplabel-oy2
set label 3 '{{/Helvetica-Italic t} = 1000 s}' at screen ox1+dox+oxlabel,ytoplabel-oy2
set label 4 '{{/Helvetica-Italic t} = 2000 s}' at screen ox1+2*dox+oxlabel,ytoplabel-oy2
set label 5 '{{/Helvetica-Italic t} = 3000 s}' at screen ox1+3*dox+oxlabel,ytoplabel-oy2
set label 6 '{{/Helvetica-Italic t} = 4000 s}' at screen ox1+4*dox+oxlabel,ytoplabel-oy2
set label 7 '{{/Helvetica-Italic t} = 5000 s}' at screen ox1+oxlabel,ytoplabel-oy1
set label 8 '{{/Helvetica-Italic t} = 6000 s}' at screen ox1+dox+oxlabel,ytoplabel-oy1
set label 9 '{{/Helvetica-Italic t} = 7000 s}' at screen ox1+2*dox+oxlabel,ytoplabel-oy1
set label 10 '{{/Helvetica-Italic t} = 8000 s}' at screen ox1+3*dox+oxlabel,ytoplabel-oy1
set label 11 '{{/Helvetica-Italic t} = 10000 s}' at screen ox1+4*dox+oxlabel,ytoplabel-oy1

set origin ox1+4*dox,oy3
set colorbox
set xtics 30
spl "Data/bfstdp_demo_sin-0.0_20071217_1201_10000000.conn1.w" matrix
