#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);
    float roundR = round(color.x * 4.0) / 4.0;
    float roundG = round(color.y * 4.0) / 4.0;
    float roundB = round(color.z * 4.0) / 4.0;
    FragColor = vec4(roundR, roundG, roundB, 1.0);
}
