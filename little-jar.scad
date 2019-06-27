noozle_r=2;
$fn = 100;

inner_diameter=20;
thick=2;
height = 20;
handle_r=1;
handle_h=10;

outer_diameter = inner_diameter+thick*2;

noozle_r=2;

play=0.4;

module noozle() {
    sphere(r=noozle_r);
}



module handle() {
    translate([0,0,height])
    rotate([0,90,0])
    translate([0,0,-handle_h/2])
    cylinder(r=handle_r, h=handle_h);
}

module handles() {
    translate([0,outer_diameter/2,0])
    handle();
    
    translate([0,-outer_diameter/2,0])
    handle();
}


module base() {
    
    difference() {
        
        cylinder(r=outer_diameter/2, h=height);
        
        minkowski() {
            translate([0,0,thick+noozle_r])
            cylinder(r=inner_diameter/2-noozle_r, h=height);
            noozle();
        }
        
        handles();
        
    }
}

module cover() {
    difference() {
        union() {
            translate([0,0,height])
                cylinder(r=outer_diameter/2, h=thick);
            translate([0,0,height-thick])
                cylinder(r=inner_diameter/2-play, h=thick*2);
        }
        handles();
    }
    
    
}


//handles();
base();
translate([outer_diameter + 5,0,0])
    rotate([180,0,0])
    translate([0,0,-height-thick])
    cover();