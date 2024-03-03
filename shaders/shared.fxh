#define TECHNIQUE(name) technique name
#define PASS_NONE(name) pass name
#define PASS_PIXEL(name) \
    pass name { PixelShader = compile ps_2_0 PixelShader_##name(); }
#define PASS_VERTEX(name) \
    pass name { VertexShader = compile vs_2_0 VertexShader_##name(); }
#define PASS_BOTH(name)                                      \
    pass name                                                \
    {                                                        \
        PixelShader = compile ps_2_0 PixelShader_##name();   \
        VertexShader = compile vs_2_0 VertexShader_##name(); \
    }

#define PIXEL(name) float4 PixelShader_##name

#define PIXEL_SHADER_TODO return float4(0, 0, 0, 0)