pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- player code

player={}

function player.new()
 local self=
 {
 	x=64,
 	y=50,
 	z=0,
 	w=8,
 	h=8,
 	gravity=0.1,
 	vy=-2.0,
 	isgrounded=false,
 	velocity=0.0,
 	acc=0.5,
 	isleft=false,
 	tag="player",
 	hp=100,
 	isdead=false
 }
 
 self.start=function()
 
 end
 
 self.update=function()
 
  if not self.isgrounded then 
	  self.vy+=self.gravity
	  self.y+=self.vy
	  
	  if self.y >=110 then
	  	self.y=110
	  	self.vy=-2.0
	  	self.isgrounded=true
	  end
	 end
	 
	 if not self.isdead then
		 if btn(⬅️) then
		  self.velocity-=self.acc
		  self.velocity=max(self.velocity,-2)
		  
		  self.isleft=true
		 
		 elseif btn(➡️) then
		  self.velocity+=self.acc
		  self.velocity=min(self.velocity,2)
		
		  self.isleft=false
		  
		 else
		  self.velocity=0.0
		 end
		 
		 self.x+=self.velocity
		 self.x=clamp(self.x,2,120)
		
		 
		 if btnp(🅾️) and self.isgrounded then
		  self.y-=8
		  self.vy=-2.0
		  self.isgrounded=false
		 end
		 
		 if btnp(⬆️) then
	  	local bt=bullet.new(p.x,p.y,true)
	  	bt.start()
	  	add(all_objects,bt)
	 	elseif btnp(⬇️) then
	 	 local bd=bullet.new(p.x,p.y,false)
	  	bd.start()
	  	add(all_objects,bd)
	 	end
	 	
	 	for e in all(all_objects) do
	   if e.tag=="enemy" then
	    if self.coll_e(e) and e.isdead then
	     self.y-=32
	     self.vy=-2.0
		    self.isgrounded=false
		    
		    del(all_objects,e)
	    end 
	   end
	   
	   if e.tag=="clear" then
	    if self.coll_e(e) then
		    if btnp(❎) and not e.is_clear then
		     e.is_clear=true
		    end
		   end
	   end
	  end
	  
	  if self.hp<=0 then
	   self.hp=0
	   self.isdead=true
	  end
	 end
 end
 
 self.draw=function()
  spr(1,self.x,self.y,1,1,self.isleft,false)
  print("hp:"..self.hp,10,120,7)

 end
 
 self.coll_e=function(t)
  return self.x < t.x+t.w and
         t.x<self.x+self.w and
         self.y<t.y+t.h and
         t.y<self.y+self.h
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
