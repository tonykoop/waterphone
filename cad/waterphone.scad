// waterphone.scad — schematic build-ENVELOPE master (concept only)
// ===========================================================================
// UNITS: inches. OpenSCAD units are generic.
//
// SOURCE OF TRUTH: design.md (Concept, Mechanism, Parametric Intent),
//   bom.csv / cut-list.csv (subsystems: resonator bowl, central neck, rod
//   field, fill/seal). family/design table asserts NO exact dimensions.
//
// !!! HONESTY BOUNDARY — READ BEFORE USE !!!
//   This packet is L2 CONCEPT / pending_measurement. design.md explicitly
//   asserts NO exact dimensions, rod lengths, rod pitches, rod count, fill
//   volumes, or acoustic targets. EVERY numeric parameter below is a labeled
//   ASSUMPTION for envelope/scale visualization ONLY — none is a design claim.
//   Rod TUNING, rod COUNT, rod PITCH, spacing map, bowl form, wall, and neck
//   geometry are all measurement-gated (design.md Measurement Plan) and OUT OF
//   SCOPE as fabrication authority.
//
// AUTHORITY: pending_measurement (concept envelope). NOT fabrication authority.
//   Do NOT cut, weld, machine, or order stock from this file.
// ===========================================================================

// ---- ASSUMPTION parameters (placeholder envelope only; NOT design claims) --
bowl_od_in       = 12.0;  // ASSUMPTION — bowl outer diameter (envelope scale)
bowl_depth_in    = 4.0;   // ASSUMPTION — resonator bowl depth
bowl_wall_in     = 0.10;  // ASSUMPTION — wall thickness placeholder
rim_lip_in       = 0.5;   // ASSUMPTION — rim band height where rods mount

neck_len_in      = 6.0;   // ASSUMPTION — central neck / handle length
neck_od_in       = 1.25;  // ASSUMPTION — neck outer diameter

rod_count        = 24;    // ASSUMPTION — envelope rod count (design asserts none)
rod_len_min_in   = 2.0;   // ASSUMPTION — shortest rod (envelope only)
rod_len_max_in   = 6.0;   // ASSUMPTION — longest rod (envelope only)
rod_dia_in       = 0.1875;// ASSUMPTION — rod diameter placeholder
rod_rim_inset_in = 0.4;   // ASSUMPTION — radial inset of rod ring from OD

$fn = 96;

// ---- Modules --------------------------------------------------------------
module bowl() {
    // shallow resonator bowl envelope (hemispherical cap section)
    difference() {
        union() {
            // bowl wall
            difference() {
                scale([1,1,bowl_depth_in/(bowl_od_in/2)])
                    sphere(r = bowl_od_in/2);
                scale([1,1,bowl_depth_in/(bowl_od_in/2)])
                    sphere(r = bowl_od_in/2 - bowl_wall_in);
                translate([0,0,0]) cylinder(h=bowl_od_in, r=bowl_od_in, center=true); // keep upper half
            }
            // rim band
            translate([0,0,0]) difference() {
                cylinder(h = rim_lip_in, r = bowl_od_in/2);
                translate([0,0,-0.01]) cylinder(h = rim_lip_in+0.02, r = bowl_od_in/2 - bowl_wall_in);
            }
        }
    }
}

module neck() {
    // central fill/handle neck rising from bowl base
    translate([0,0,-neck_len_in]) cylinder(h = neck_len_in, d = neck_od_in);
}

// Rod field: N vertical rods around the rim, ASSUMPTION lengths graded around
// the ring (envelope only — NOT a tuned schedule).
module rod_field() {
    r_ring = bowl_od_in/2 - rod_rim_inset_in;
    for (i = [0 : rod_count-1]) {
        ang = i * 360/rod_count;
        // graded placeholder length (triangle wave), purely for envelope shape
        f = abs(((i % rod_count) / (rod_count-1)) * 2 - 1); // 0..1..0
        L = rod_len_min_in + (rod_len_max_in - rod_len_min_in) * (1 - f);
        rotate([0,0,ang])
            translate([r_ring, 0, rim_lip_in])
                cylinder(h = L, d = rod_dia_in);
    }
}

// ---- Top-level assembly ---------------------------------------------------
module waterphone() {
    bowl();
    neck();
    rod_field();
}

waterphone();
