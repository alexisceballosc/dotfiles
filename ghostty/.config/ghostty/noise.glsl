void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 color = texture(iChannel0, uv);

    float luma = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    float noise = fract(sin(dot(fragCoord + fract(iTime * 0.5), vec2(12.9898, 78.233))) * 43758.5453);
    noise = (noise - 0.5) * 0.06;

    float isBg = 1.0 - smoothstep(0.0, 0.15, luma);
    fragColor = vec4(color.rgb + noise * isBg, color.a);
}