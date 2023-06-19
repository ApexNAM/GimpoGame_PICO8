pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
bullet={}

function bullet.new(sx,sy,st)
 local self=
 {
  x=sx,
  y=sy,
  z=-1,
  w=8,
  h=8,
  istop=st,
  is_del=false
 }
 
 self.start=function()
 
 end
 
 self.update=function()
  if self.istop then
   self.y-=2
   
   if self.y<=5 then
    self.is_del=true
   end
  else
   self.y+=2
   
   if self.y>=110 then
    self.is_del=true
   end
  end
  
  if self.is_del then
   del(all_objects,self)
  end
  
  for obj in all(all_objects) do
   if obj.tag=="enemy"then
    if self.coll(obj) then
     if obj.isdead then
       if self.istop then
        obj.y+=4
       else
        obj.y-=4
       end
     else
      obj.hp-=10
     end
     
     del(all_objects,self)
    end
   end
  end
 end
 
 self.draw=function()
  spr(2,self.x,self.y,1,1)
 end
 
 self.coll=function(t)
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
