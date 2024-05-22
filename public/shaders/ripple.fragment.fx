#version 300 es
precision mediump float;

// Input
in vec2 model_uv;
in float vTime;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec2 scaledCords = (model_uv * 2.0) - 1.0;
    // float radius = sqrt((scaledCords.x * scaledCords.x) + (scaledCords.y + scaledCords.y));
    // float radius = scaledCords.x - scaledCords.y;
    float radius = length(scaledCords);
    vec2 textureCordsOffset = scaledCords * (sin(radius * 30.0 - vTime * 5.0) + 0.5) / 60.0;
    vec2 finalCords = model_uv + textureCordsOffset;

    FragColor = texture(image, finalCords);
}
