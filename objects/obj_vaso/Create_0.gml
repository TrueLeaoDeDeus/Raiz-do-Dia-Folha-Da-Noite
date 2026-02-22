/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
regado = 0;

varia = 1;

tempo = 0;

estado = noone;

randomize();

tempomax =random_range(100,200)

escolhido = irandom_range(5,12);

estado_osilante = function()
{
	varia  = lerp(varia,escolhido,0.01);
	
	tempo++;
	if(tempo > tempomax)
	{
		estado = estado_normal;
		tempo = 0;
	}
}

estado_normal = function()
{
	varia = 1;
	
	estado = estado_osilante;
}

estado = estado_osilante;