// Hugo A. Antolini  - Buenos Aires, Argentina, 2018(c)

// Resolución del renderizado
$fn=100;

// Variables de dimensiones
radextcirculo=21;  // Radio exterior del circulo del engrane
radintcirculo=15;  // Radio interior del circulo del engrane
altocirculo=5;     // Alto del engrane
dientes=14;        // Cantidad de dientes del engrane
basediente=5;      // Lado de la base del diente
techodiente=3.5;   // Lado del techo del diente
altodiente=5;      // Alto del diente

// Primitiva para la creación del cilindro del engrane
module tubo(ext_rad=radextcirculo,int_rad=radintcirculo,alto=altocirculo) {
    difference() {
        cylinder(r=ext_rad, h=alto, center=true);
        cylinder(r=int_rad, h=alto+3, center=true);
    }
}


// Primitivas para la creación de los dientes del engrane
module diente(base=basediente, techo=techodiente, alto=altodiente){
    rad1 = sqrt((base * base / 2));
    rad2 = sqrt((techo * techo / 2));
    rotate([0,0,45]) cylinder(h=alto, r1=rad1, r2=rad2, center=true, $fn=4);
}
module pardientes(){
    union(){
        translate([radextcirculo,0,0]) rotate([0,90,0]) diente();
        translate([-radextcirculo,0,0]) rotate([0,-90,0]) diente();
    }
}


// Primitiva de los tubos en cruz en el centro
module cruz(){
    difference(){
        union(){
            rotate([0,90,0]) cylinder(r=(altocirculo-1)/2, h=radintcirculo*2, center=true);
            rotate([90,90,0]) cylinder(r=(altocirculo-1)/2, h=radintcirculo*2, center=true);
            cylinder(r=(altocirculo-1), h=altocirculo, center=true);
        };
        cylinder(r=altocirculo-2.2, h=altocirculo+1, center=true);
    }
}


// Modulo principal, dibujo de las partes
// Cilindro del engrane
color("red") tubo();

// Dientes del engrane
for (i=[0:dientes/2]) {
    color("blue") rotate([0,0,360/dientes*i]) pardientes();
}

// Tubos en Cruz al centro
color("green") cruz();

// Escuadra equilatera
rotate([0,0,90]) difference() {
    translate([0,0,0.25]) cylinder(h=5.5, r=radintcirculo+1 , center=true, $fn=3);
    cylinder(h=13, r=radintcirculo-7 , center=true, $fn=3);
}

// Cabeza del compas
translate([0,-radintcirculo,1]) cube(size=[3, 3, 3], center=true);
translate([0,-radintcirculo+2.5,1]) rotate([-90,0,0]) diente(base=3,techo=2.2,alto=2);

// Brazos del copas
translate([-3.9,-3,1.5]) rotate([0,0,15]) cube([1.5,radextcirculo+4,1.5], center=true);
translate([3.9,-3,1.5]) rotate([0,0,-15]) cube([1.5,radextcirculo+4,1.5], center=true);

// Puntas del compas
translate([-8,radintcirculo-2.7,1.5]) rotate([0,0,15]) difference(){
    cube([1.5,7,1.5], center=true);
    translate([-0.75,0,0]) rotate([0,0,-20]) cube([2,7,2], center=true);
}
translate([8,radintcirculo-2.7,1.5]) rotate([0,0,-15]) difference(){
    cube([1.5,7,1.5], center=true);
    translate([0.75,0,0]) rotate([0,0,20]) cube([2,7,2], center=true);
}

// Texto de arriba:  INSTITUTO
i=86;   // Angulo de inicio de la palabra
r=9.1;    // Grados que rota cada letra
a=-0.5;   // Altura de la letra

rotate(i,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("I", font="Ubuntu Mono:style=Bold");
rotate(i-r*1,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("N", font="Ubuntu Mono:style=Bold");
rotate(i-r*2,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("S", font="Ubuntu Mono:style=Bold");
rotate(i-r*3,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("T", font="Ubuntu Mono:style=Bold");
rotate(i-r*4,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("I", font="Ubuntu Mono:style=Bold");
rotate(i-r*5,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("T", font="Ubuntu Mono:style=Bold");
rotate(i-r*6,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("U", font="Ubuntu Mono:style=Bold");
rotate(i-r*7,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("T", font="Ubuntu Mono:style=Bold");
rotate(i-r*8,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("O", font="Ubuntu Mono:style=Bold");

// Texto de arriba: INDUSTRIAL
rotate(i-r*10,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("I", font="Ubuntu Mono:style=Bold");
rotate(i-r*11,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("N", font="Ubuntu Mono:style=Bold");
rotate(i-r*12,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("D", font="Ubuntu Mono:style=Bold");
rotate(i-r*13,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("U", font="Ubuntu Mono:style=Bold");
rotate(i-r*14,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("S", font="Ubuntu Mono:style=Bold");
rotate(i-r*15,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("T", font="Ubuntu Mono:style=Bold");
rotate(i-r*16,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("R", font="Ubuntu Mono:style=Bold");
rotate(i-r*17,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("I", font="Ubuntu Mono:style=Bold");
rotate(i-r*18,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("A", font="Ubuntu Mono:style=Bold");
rotate(i-r*19,[0,0,1]) translate([1.4,-radintcirculo-0.9,a]) scale([0.4,0.4,1]) linear_extrude(4) rotate(180) text("L", font="Ubuntu Mono:style=Bold");

// Texto de Abajo: LUIS
j=-67;
s=10.5;

rotate(j,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("L", font="Ubuntu Mono:style=Bold");
rotate(j+s*1,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("U", font="Ubuntu Mono:style=Bold");
rotate(j+s*2,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("I", font="Ubuntu Mono:style=Bold");
rotate(j+s*3,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("S", font="Ubuntu Mono:style=Bold");

rotate(j+s*5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("A", font="Ubuntu Mono:style=Bold");
rotate(j+s*6,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text(".", font="Ubuntu Mono:style=Bold");

rotate(j+s*7.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("H", font="Ubuntu Mono:style=Bold");
rotate(j+s*8.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("U", font="Ubuntu Mono:style=Bold");
rotate(j+s*9.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("E", font="Ubuntu Mono:style=Bold");
rotate(j+s*10.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("R", font="Ubuntu Mono:style=Bold");
rotate(j+s*11.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("G", font="Ubuntu Mono:style=Bold");
rotate(j+s*12.5,[0,0,1]) translate([1.4,radintcirculo+4.7,a]) scale([0.45,0.45,1]) linear_extrude(4) rotate(180) text("O", font="Ubuntu Mono:style=Bold");


// Pasa Aro del llavero
rotate([0,90,0]) translate([0,-radextcirculo-3,0]) difference(){
    cube([5,7,2.5], center=true);
    translate([0,-0.3,0]) cube([3.5,3.5,6], center=true);
}