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
    float luminance = 0.299 * color.x + 0.587 * color.y + 0.114 * color.z;
    FragColor = vec4(luminance, luminance, luminance, 1.0);
}
