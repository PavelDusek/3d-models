import openscad as o
import math

hose_diameter   =  13
spike_height    = 150
spike_thickness =  13
irrigator_hole  =   1

def rad2deg( angle ):
    return 180*angle/math.pi

# Hose connector
o.cyl( diameter = hose_diameter, height = 4 * hose_diameter )
outer = o.result()

o.cyl( diameter = (3/4)*hose_diameter, height = 6 * hose_diameter )
o.translate(0, 0, -1*hose_diameter)
inner = o.result()

o.cyl( diameter = irrigator_hole, height = hose_diameter )
o.rotate(0, 90, 0)
o.translate( 0, 0, 2*hose_diameter )
ir_hole = o.result()

o.difference( [outer, inner, ir_hole] )
o.rotate(0, 90, 0)
o.color("blue")
o.translate(-2*hose_diameter, 0, spike_height - 0.5*hose_diameter)
hose_connector = o.result()

# Spike
o.box( 2 * spike_thickness, spike_thickness, spike_height )
o.color("green")
o.translate(-1*spike_thickness, 0, 0)
spike0 = o.result()

o.box( spike_thickness, 3*spike_thickness, spike_height )
o.color("red")
o.translate(0*spike_thickness, -1, 0)
o.rotate( 0, rad2deg( math.atan(spike_thickness/spike_height) ), 0)
spike1 = o.result()

o.box( spike_thickness, 3*spike_thickness, spike_height )
o.color("yellow")
o.translate(-1*spike_thickness, -1, 0)
o.rotate( 0, -1 * rad2deg( math.atan(spike_thickness/spike_height) ), 0)
spike2 = o.result()

o.cyl( diameter = hose_diameter, height = 4 * hose_diameter )
o.rotate(0, 90, 0)
o.translate(-2*hose_diameter, 0, spike_height - 0.5*hose_diameter)
o.color("green")
outer = o.result()

o.cone( 1.5*spike_thickness, 2*spike_height-0.1*spike_thickness )
o.rotate(180, 0, 0)
o.translate(0, 0, spike_height)
cone1 = o.result()

o.cone( 0.75*spike_thickness, spike_height )
o.rotate(180, 0, 0)
o.translate(0, 0.5*spike_thickness, spike_height)
cone2 = o.result()

o.difference( [spike0, spike1, spike2, outer, cone1] )
spike = o.result()

o.output([hose_connector, spike, cone2])

