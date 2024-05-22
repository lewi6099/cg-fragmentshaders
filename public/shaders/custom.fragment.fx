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
    // assign warm colors to bright areas and cool colors to dark areas
    vec3 thermalColor = vec3(0.0);
    thermalColor.r = 1.0 - luminance; // Red
    thermalColor.g = 1.0 - abs(0.5 - luminance) * 2.0; // Green
    thermalColor.b = luminance; // Blue
    FragColor = vec4(thermalColor, color.a);
}
