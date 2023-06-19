pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
game_manager={}

function game_manager.new()

 local self=
 {
  z=0,
  levels=
  {
	  {
	   0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,1,0,0,0,0,1,0,0,1,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	  },
	  {
	   0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,
	   0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
	   0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,
	   0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
	   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	  }
	 },
	 
	 c_level_idx=1
	}
	
	 self.create_e=function(current_level)
		 local level_data = self.levels[current_level]
		  
		 for y=0,7 do
		  for x=0,15 do
		    
		   local tile_idx=level_data[y*16+x+1]
		    
		   if tile_idx==1 then
			   local e = g_enemy.new(x*8,y*8)
			   e.start()
			   add(all_objects,e)
			  end
			  
			  if tile_idx==2 then
			   local cb = clear_button.new(x*8,y*8)
			   cb.start()
			   add(all_objects,cb)
			  end
		  end
		 end
		end
	 
	 self.start=function()
	  self.create_e(1)
	 end
	 
	 self.update=function()
	  for obj in all(all_objects) do
	   if obj.tag == "clear" then
	    if obj.is_clear then
	     self.clear_e()
	     
	     if self.c_level_idx<2 then
		     self.c_level_idx+=1
		     self.create_e(self.c_level_idx)
				  elseif self.c_level_idx==2 then
				   c_game_states=game_states[2]
				  end
				  
				  del(all_objects,obj)
	    end 
	   end
	   
	   if obj.tag == "player" then
	    if obj.isdead then
	     self.clear_e()
	     c_game_states=game_states[3]
	    end
	   end
	  end
	 
	 end
	 
	 self.draw=function()
	 end
	 
	 self.clear_e=function()
	  for obj in all(all_objects) do
	   if obj.tag == "enemy" then
	    del(all_objects,obj)
	   end
	  end
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
