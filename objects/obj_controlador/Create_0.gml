
// Creando a minha surface.

surf		= noone;
momento		= 0;
tempo_dia_noite = .05236;
// Efeitos de escureser.

fase_atual = "";

dia_noite	= function()
{
	
	momento = (sin( tempo_dia_noite*get_timer()/1000000)+1)/2;
	
	if(momento>0.65)
	{
		fase_atual = "Noite";
	}
	else if(momento >0.35)
	{
		fase_atual = "Transisao";
	}
	else
	{
		fase_atual = "Dia";
	}
	
	

	
	// Checar se a minhasurface existe.
	if(surface_exists(surf))
	{

		// Vou desenhar a minha surface.
		surface_set_target(surf);
		
		draw_clear_alpha(c_black,0);

		// Mudando a cor do surface.
		draw_set_color(c_black);
		// Ajustando a tranparencia.
		draw_set_alpha(min(momento, 0.85));
		
		// Desenhando um retangulo na tela inteira.
		draw_rectangle(0,0,room_width,room_height,false);
		// Resetando a alpha.
		draw_set_alpha(1);
		// Resetando acor .
		draw_set_color(-1);
		
		if(instance_exists(obj_vaso))
		{
			with(obj_vaso)
			{
				gpu_set_blendmode(bm_subtract);
				
				var _tamanho = 40+ varia;
				
				draw_set_alpha(0.8);
				draw_circle(x,y,_tamanho,false);
				
				draw_set_alpha(0.5);
				draw_circle(x,y,_tamanho+10,false);
				
				draw_set_alpha(0.3);
				draw_circle(x,y,_tamanho+20,false);
				
				
				draw_set_alpha(1);
				gpu_set_blendmode(bm_normal);
			}
		}
		
		// Parei de senhhar a minha surface eu paro ela.
		surface_reset_target();
		draw_surface(surf,0,0);
		
	}
	else // Se a minha surface nao existe eu creo ela.
	{
		surf = surface_create(room_width, room_height);
	}
	

}


