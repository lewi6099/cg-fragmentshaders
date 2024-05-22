#version 300 es
precision highp float;

// Attributes
in vec3 position;
in vec2 uv;

uniform float time;
// Output
out vec2 model_uv;
out float vTime;

void main() {
    // Pass UV coordinate onto the fragment shader
    model_uv = uv;
    vTime = time;

    // Don't transform - expecting a fullscreen quad in 2D screen-space 
    gl_Position = vec4(position, 1.0);
}
