/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

per = "";

estado  = noone;

enum PERIODO 
{
	MANHA,
	TARDE,
	NOITE,
	MADRUGADA
}

tempo = 0;

tempo_max = 6*6;

periodo  = PERIODO.MANHA;

roda_tempo = function()
{
	tempo++;
	
	if(tempo>= tempo_max)
	{
		
		tempo = 0;
		
		periodo++;
		
		if(periodo > PERIODO.MADRUGADA)
		{
			periodo = PERIODO.MANHA;
		}
		
	}
}

