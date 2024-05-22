#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec2 scaledCords = model_uv * 2.0 - 1.0;
    float theta = atan(scaledCords.y, scaledCords.x);
    float radius = pow(sqrt(scaledCords.x * scaledCords.x + scaledCords.y * scaledCords.y), 1.5);
    vec2 fish_eye = vec2(radius * cos(theta), radius * sin(theta));
    vec2 scaled_fish_eye = 0.5 * (fish_eye + 1.0);
    // Color
    FragColor = texture(image, scaled_fish_eye);
}
