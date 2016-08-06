/// Empezar a tocar una música con retardo

// El retardo se asigna al iniciar la alarma[0] del objeto obj_audio
// La música a iniciar se asigna con la variable global.musica_a_reproducir
// El canal se asigna con la variable global.musica_a_reproducir_canal
// Que loopee o no se asigna con la variable global.musica_a_reproducir_loop

var musica = global.mus_a_reproducir;
var musica_canal =  global.mus_a_reproducir_canal;
var musica_loop = global.mus_a_reproducir_loop;

global.musica = audio_play_sound(musica, musica_canal, musica_loop); 
