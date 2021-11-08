/// @description Insert description here
// You can write your code in this editor

//if cooldown_attack <= 0 {
//	var attack = instance_create_layer(x,y,"Effects_Fg",obj_miniboss_projectile)
//	attack.direction = point_direction(x,y,obj_bacteria.x,obj_bacteria.y)
//	attack.speed = 2
//	cooldown_attack= current_cooldown //it will fire every current_cooldown seconds.
//}	
//else {
//	cooldown_attack -= global.seconds_passed	
//}


if knockback_timer > 0 {
	knockback_timer -= global.seconds_passed	
}
else {
	knockback = false
	knockback_timer = 0	
}



//control spread angles 
bb = max(1,bullets-1);
aa = max(1,total_arrays-1);

a_ang = (array_spread/aa);
b_ang = (spread/bb);

if (shoot=0) {//fire rate control
    for (var j=0;j<total_arrays;j++) {//loop for each array
        for (var i=0;i<bullets;i++) {//loop for each bullet
            //determine the point where the bullets will fire from
            xx = x+x_offset+lengthdir_x(object_width,base_angle+(b_ang*i)+(a_ang*j)+start_angle);
            yy = y+y_offset+lengthdir_y(object_height,base_angle+(b_ang*i)+(a_ang*j)+start_angle);
            
            bullet = instance_create_layer(xx,yy,"Effects_Fg",bullet_object);//create a bullet at the desired location
            bullet.direction = base_angle+(b_ang*i)+(a_ang*j)+start_angle;//give that bullet the desired direction
            bullet.image_angle = base_angle+(b_ang*i)+(a_ang*j)+start_angle;//set the bullet's image_angle so it faces the same direction
            bullet.speed = bullet_speed;//give the bullet the desired speed
            bullet.acc = bullet_accel;
        }
    }
    
    base_angle += spin;//spin the arrays
    
    spin += spin_mod;//increase or decrease spin speed
    
    if (spin_rev = 1) {//if spin reverse is enables
        if (spin < -max_spin_spd || spin > max_spin_spd) {//reverse the spin once it reaches a certain speed
            spin_mod = -spin_mod;
        }
    }
}

shoot += 1;//fire rate control

if (shoot >= fire_rate) {//once shoot reaches our fire rate
    shoot = 0;//set it to 0 to shoot again
}


if (myHP > 350) {
	if (ring_shoot=0) {
		ring_shoot += 1;
		for (var i=0;i<20;i++) {//loop for each bullet
			//determine the point where the bullets will fire from
			xx = x+lengthdir_x(0,18*i);
			yy = y+lengthdir_y(0,18*i);
            
			bullet = instance_create_layer(xx,yy,"Effects_Fg",bullet_object);//create a bullet at the desired location
			bullet.direction = 18*i;//give that bullet the desired direction
			bullet.image_angle = 18*i;//set the bullet's image_angle so it faces the same direction
			bullet.speed = 1.5;//give the bullet the desired speed
		}
	}

	ring_shoot += 1;//fire rate control

	if (ring_shoot >= ring_shoot_rate) {//once shoot reaches our fire rate
	    ring_shoot = 0;//set it to 0 to shoot again
	}
}

if (myHP < 700) && (myHP > 350) {
	
	
	bullets = 4;
	spread = 30;
}

if (myHP <= 350) {
	
	//spawn a ring enemy!!
	if !instance_exists(obj_enemy_ring) {
		instance_create_layer(304,562,"Entities", obj_enemy_ring)
	}
	
	bullet_accel = -0.01;
	
	bullets = 2;
	spread = 180;
	
	total_arrays = 1;
	array_spread = 0;
	
	spin = 8;
	
	fire_rate = 10;
}
/**
if myHP <= 0 {
	instance_destroy()
}
**/