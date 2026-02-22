/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
velh		= 4;
velv		= 4;
dx			= 0; 
dy			= 0;

atual = 0;
spr_lita = [spr_regador
			,spr_arado,
			spr_arma];

molhado = 60
tempo = molhado;
var _item = instance_create_layer(x,y,layer,obj_item);

_item.sprite_index = spr_lita[0];

mover = function()
{
	lista_colisoes = [obj_vaso,obj_planta];
	
	var _left	= keyboard_check(ord("A"));
	var _right	= keyboard_check(ord("D"));

	var _up		= keyboard_check(ord("W"));
	var _down	= keyboard_check(ord("S"));
	
	dx = (_right-_left)*velh; 
	dy = (_down-_up)*velv;
	
	var move_x = true;
	for (var i = 0; i< array_length(lista_colisoes); i++)
	{
		  
		if(place_meeting(x+dx,y,lista_colisoes[i]))
		{
			move_x = false;
			break;
		}
	}
	if(move_x )
	{
		x+= dx;
	}
	var move_y = true;
	
	for(var j = 0; j< array_length(lista_colisoes);j++)
	{
		if(place_meeting(x,y+dy,lista_colisoes[j]))
		{
			move_y = false;
			break;
		}
		
	}
	
	if(move_y )
	{
		y+= dy;
	}
} 

muda_item = function()
{
	var _space = keyboard_check(vk_space);
	
	var _id_item =  instance_find(obj_item,0);
	if(_id_item==noone) exit;
	

	if(keyboard_check_pressed(vk_up)) atual++;
	if(keyboard_check_pressed(vk_down)) atual--;

	atual = clamp(atual,0,array_length(spr_lita)-1);
	
		_id_item.sprite_index = spr_lita[atual];
	
	
	
	if(_space)
	{
		with(obj_item)
		{
			image_speed = 4
		}
		
		
		
	}
	else
	{
		with(obj_item)
		{
			image_index = 0;
		}
	}
	
}

regando = function()
{
	if(instance_exists(obj_vaso))
	{
		var _vaso = instance_nearest(x,y,obj_vaso);
		if(_vaso == noone) exit;
		
		var _dist = point_distance(x,y,_vaso.x,_vaso.y)
		
		//show_debug_message(_dist);
		
		var _space = keyboard_check(vk_space);
		
		if(_dist <80 and _space)
		{
			tempo--;
			if(_space and tempo < 0)
			{
				tempo = molhado;
				// fazer medidor.
				
					with(_vaso)
					{
						// regado e uma avariavel do obj vaso
						if(regado< image_number-1)
						{
							image_index++;
							regado++
						}
						
	
					}
					
				
					
			}	
		}
	}
}