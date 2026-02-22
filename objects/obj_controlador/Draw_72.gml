/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _cor_fundo;

switch(periodo)
{
	case PERIODO.MANHA:
	per = "Manha";
		_cor_fundo = make_color_rgb(180,220,255);
	break;
	
	case PERIODO.TARDE:
	per = "Tarde";
		_cor_fundo = make_color_rgb(255,210,140);
	break;
	
	case PERIODO.NOITE:
	per = "Noite";
		_cor_fundo = make_color_rgb(60,80,120);
	break; 
	
	case PERIODO.MADRUGADA:
	per = "Madrugada";
		_cor_fundo = make_color_rgb(20,30,60);
	break;
	
	
}	
draw_set_color(_cor_fundo);
draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
draw_set_color(c_white);


