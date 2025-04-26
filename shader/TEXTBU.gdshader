shader_type canvas_item;

uniform float height = 6.0;
uniform float frequency = 40.0;
uniform float speed = -6.0;

void vertex() {
 VERTEX.y += height * sin((frequency * UV.x) + (speed * TIME));
}