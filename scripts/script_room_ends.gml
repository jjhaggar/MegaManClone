/// Room ends

var nueva_room = argument0; // Se recoge el argumento en una variable

audio_stop_all(); // Se detiene la música y los sonidos

if (room_exists (nueva_room)) //  Si la nueva habitación existe
{
    room_goto(nueva_room); // ... se carga esa habitación
}


