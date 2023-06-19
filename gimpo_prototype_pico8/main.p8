pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- just shooting game

#include g_manager.p8
#include c_math.p8
#include player.p8
#include bullet.p8
#include e_bullet.p8
#include g_enemy.p8
#include clear_button.p8

game_states=
{
 "in_game",
 "clear_game",
 "game_over"
}

c_game_states=game_states[1]

gm=game_manager.new()
p=player.new()
all_objects={p,gm}

function _init()

 for obj in all(all_objects) do
  obj.start()
 end
end

function _update60()
	if c_game_states==game_states[1] then
	 for obj in all(all_objects) do
	  obj.update()
	 end
	end
end

function _draw()
 cls()
 
 if c_game_states==game_states[1] then
	 customsort(all_objects, sortinglayer)
		
	 for obj in all(all_objects) do
	  obj.draw()
	 end
	elseif c_game_states==game_states[2] then
  print("game clear!",40,50,rnd(16))
	elseif c_game_states==game_states[3] then
 	print("game over!",45,50,8)
	end
end

function customsort(tbl, comparefunc)
  local function partition(arr, low, high)
    local pivot = arr[high]
    local i = low - 1

    for j = low, high - 1 do
      if comparefunc(arr[j], pivot) then
        i = i + 1
        arr[i], arr[j] = arr[j], arr[i]
      end
    end

    arr[i + 1], arr[high] = arr[high], arr[i + 1]
    return i + 1
  end

  local function quicksort(arr, low, high)
    if low < high then
      local pivotindex = partition(arr, low, high)
      quicksort(arr, low, pivotindex - 1)
      quicksort(arr, pivotindex + 1, high)
    end
  end

  quicksort(tbl, 1, #tbl)
end

function sortinglayer(a, b)
  return a.z < b.z
end
__gfx__
0000000000444000000000000a0000a00c0000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004ff000000000000a0000a0c00cc00c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700004ff00000000000a444444a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000001f1000000a9000498998940c0cc0c00009800000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000001110000009a000498998940c0cc0c00008900000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000055500000000000a444444a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000505000000000000a0000a0c00cc00c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000d0d000000000000a0000a00c0000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
