pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
g_enemy={}

function g_enemy.new(sx,sy)
 local self=
 {
  x=sx,
  y=sy,
  w=8,
  h=8,
  z=-1,
  hp=100,
  isdead=false,
  wait_shoot_time=5.0,
  tag="enemy",
  rnd_x=rnd(2,110),
  is_right=false
 }
 
 self.start=function()
 
  local rnd_val = flr(rnd(2))+1
  
  if rnd_val == 1 then
   self.is_right=true
  elseif rnd_val == 2 then
   self.is_right=false
  end
 
 end
 
 self.update=function()
 
  if not self.isdead then
	  self.wait_shoot_time-=0.025
	  
	  if self.wait_shoot_time<=0.0 then
	   local rnd_val = flr(rnd(2))+1
	  
		  if rnd_val == 1 then
		   self.is_right=true
		  elseif rnd_val == 2 then
		   self.is_right=false
		  end
		  
		  if self.y<100 then
		 	 self.y+=0.5
		 	end
		 	
		 	for p in all(all_objects) do
	   	if p.tag == "player" then
	    	if p.y<self.y then
	      local eb=e_bullet.new(self.x,self.y,true)
	    	 eb.start()
	    	 add(all_objects,eb)
	    	elseif p.y>self.y then
	      local eb=e_bullet.new(self.x,self.y,false)
	    	 eb.start()
	    	 add(all_objects,eb)
	    	end
	   	end
		  end
		 	
		  self.wait_shoot_time=5.0
		 end
	  
	  if self.is_right then 
	   self.x+=0.25
	   
	   if self.x>110 then
	    self.is_right=false
	   end
	  else
	   self.x-=0.25
	   
	   if self.x<5 then
	    self.is_right=true
	   end
	  end
		
	  if self.hp<=0 then
	   self.isdead=true
	  end
	 end
 end
 
 self.draw=function()
  spr(3,self.x,self.y,1,1)
 end
 
 return self
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
