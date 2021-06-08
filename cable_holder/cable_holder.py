import openscad as o

cable_diameter = 5
cable_dim   =  2*cable_diameter

thickness   = 10 
screw1      =  8 #width of the screw head
screw2      =  4 #width of the screw body
screwhead   =  5 #height of the screw head
screwlength = 10 #length of the screw body

o.cone_truncated( diameter1 = screw1, diameter2 = screw2, height = screwhead )
head = o.result()
o.cyl( diameter = screw2, height = screwlength )
o.translate(0, 0, screwhead )
body = o.result()
o.union([head, body])
o.rotate(0, -90, 0)
o.translate(0.1*thickness + screwhead, 0.75*(cable_dim+thickness), 0.5*thickness)
screw_obj1 = o.result()

o.cone_truncated( diameter1 = screw1, diameter2 = screw2, height = screwhead )
head = o.result()
o.cyl( diameter = screw2, height = screwlength )
o.translate(0, 0, screwhead )
body = o.result()
o.union([head, body])
o.rotate(0, -90, 0)
o.translate(0.1*thickness + screwhead, -0.75*(cable_dim+thickness), 0.5*thickness)
screw_obj2 = o.result()

o.cyl(cable_dim+thickness, thickness)
o.color("white")
outer = o.result()

o.cyl(cable_dim, thickness+2)
o.translate(0, 0, -1)
inner = o.result()

o.box(0.5*thickness, 1.5*thickness, thickness)
o.translate(0, 0.5*(cable_dim+thickness)-0.5*thickness, 0)
o.color("white")
screwhole = o.result()
o.difference([screwhole, screw_obj1])
screwhole1 = o.result()

o.box(0.5*thickness, 1.5*thickness, thickness)
o.translate(0, -1*cable_dim-thickness, 0)
o.color("white")
screwhole = o.result()
o.difference([screwhole, screw_obj2])
screwhole2 = o.result()

o.box(2*(cable_dim+thickness), 2*(cable_dim+thickness), thickness+2)
o.translate(-2*(cable_dim+thickness), -1*(cable_dim+thickness), -1)
b = o.result()

o.difference([outer, inner, b])
holder = o.result()

o.output([holder, screwhole1, screwhole2])
