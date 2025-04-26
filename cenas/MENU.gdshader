shader_type canvas_item;

uniform float height = 4.0;
uniform float frequency = 5.0;
uniform float speed = -4.0;

void vertex() {
 VERTEX.y += height * sin((frequency * UV.x) + (speed * TIME));
} 