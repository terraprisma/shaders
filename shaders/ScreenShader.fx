#include "shared.fxh"

sampler uImage0 : register(s0); // The contents of the screen.
sampler uImage1 : register(s1); // Up to three extra textures you can use for various purposes (for instance as an overlay).
sampler uImage2 : register(s2);
sampler uImage3 : register(s3);
float3 uColor;
float3 uSecondaryColor;
float2 uScreenResolution;
float2 uScreenPosition; // The position of the camera.
float2 uTargetPosition; // The "target" of the shader, what this actually means tends to vary per shader.
float2 uDirection;
float uOpacity;
float uTime;
float uIntensity;
float uProgress;
float2 uImageSize1;
float2 uImageSize2;
float2 uImageSize3;
float2 uImageOffset;
float uSaturation;
float4 uSourceRect; // Doesn't seem to be used, but included for parity.
float2 uZoom;

PIXEL(Default)
(float4 sampleColor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    return tex2D(uImage0, coords) * sampleColor;
}

PIXEL(FilterTest)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = { -0.5, 0.200000003, 0.5, 0 };

    float4 r0;

    // add r0.xy, t0, c0.x
    r0.xy = t0 + c0.x;
    // mad r0.xy, r0, c0.y, c0.z
    r0.xy = mad(r0, c0.y, c0.z);
    // texld r0, r0, s0
    r0 = tex2D(uImage0, r0);

    return r0;
}

PIXEL(OverlayGlow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterColor)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterInvert)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float c0 = uOpacity;
    float4 c1 = { -1, -1, -1, 1 };
    float4 c2 = { 1, 1, 1, 0 };

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;
    float4 r2;

    // mov r1, c1
    r1 = c1;
    // mad r1, r0, r1, c2
    r1 = mad(r0, r1, c2);
    // lrp r2, c0.x, r1, r0
    r2 = lerp(r0, r1, c0.x);
    
    return r2;
}

PIXEL(FilterMoonLord)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterGraveyard)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float c0 = uOpacity;
    float c1 = uIntensity;
    float c2 = uProgress;
    float4 c3 = { 0.333333343, 0, 0, 0 };

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // add r1.w, r0.y, r0.x
    r1.w = r0.x + r0.y;
    // add r1.x, r0.z, r1.w
    r1.x = r0.z + r1.w;
    // mul r1.x, r1.x, c1.x
    r1.x = r1.x * c1.x;
    // mad r1.xyz, r1.x, c3.x, -r0
    r1.xyz = mad(r1.x, c3.x, -r0);
    // mad r1.xyz, c2.x, r1, r0
    r1.xyz = mad(c2.x, r1, r0);
    // mad r1.xyz, r1, r0.w, -r0
    r1.xyz = mad(r1, r0.w, -r0);
    // mad r0.xyz, c0.x, r1, r0
    r0.xyz = mad(c0.x, r1, r0);

    return r0;
}

PIXEL(FilterSepia)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterTower)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(MonoFix)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterBloodMoon)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterMiniTower)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterMoonLordShake)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterSandstormForeground)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterSandstormBackground)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterBlizzardForeground)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterBlizzardBackground)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterHeatDistortion)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterWaterDistortion)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(WaterDebugDraw)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = { -0.5, 0.400000006, 1, 0 };
    float4 c1 = { 2, -2, 0, 0 };

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // add r0.x, r0.x, c0.x
    r0.x = r0.x + c0.x;
    // mad r0.y, r0.z, -c0.y, c0.z
    r0.y = mad(r0.z, -c0.y, c0.z);
    // mul r0.x, r0.x, r0.y
    r0.x = r0.y * r0.x;
    // mul r0.x, r0.x, v0.w
    r0.x = r0.x * v0.w;
    // mul r0.xyz, r0.x, c1
    r0.xyz = r0.x * c1;
    // abs r0.w, r0.x
    r0.w = abs(r0.x);

    return r0;
}

PIXEL(FilterCrystalDestructionColor)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterCrystalDestructionVortex)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterCrystalWin)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterTest2)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = { 0.550000012, -0.100000001, 0, -0.25 };
    float4 c1 = { 0.0588235296, 0.219607845, 0.0588235296, 0 };
    float4 c2 = { 0.188235298, 0.384313732, 0.188235298, 0 };
    float4 c3 = { 0.545098066, 0.674509823, 0.0588235296, 0 };
    float4 c4 = { 0.607843161, 0.737254918, 0.0588235296, 0 };
    float4 c5 = { -0.5, -0.75, 1, 0 };

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;
    float4 r2;

    // max r1.w, r0.y, r0.z
    r1.w = max(r0.y, r0.z);
    // max r2.w, r0.x, r1.w
    r2.w = max(r0.x, r1.w);
    // min r1.x, r0.z, r0.y
    r1.x = min(r0.y, r0.z);
    // min r2.x, r1.x, r0.x
    r2.x = min(r0.x, r1.x);
    // add r0.x, r2.w, r2.x
    r0.x = r2.x + r2.w;
    // mad r0.x, r0.x, c0.x, c0.y
    r0.x = mad(r0.x, c0.x, c0.y);
    // max r1.x, r0.x, c0.z
    r1.x = max(r0.x, c0.z);
    // add r0.x, r1.x, c5.y
    r0.x = r1.x + c5.y;
    // mov r2.xyz, c4
    r2.xyz = c4;
    // cmp r0.xyz, r0.x, r2, c3
    r0.xyz = r0.x < 0 ? r2 : c3;
    // add r0.w, r1.x, c5.x
    r0.w = r1.x + c5.x;
    // add r1.x, r1.x, c0.w
    r1.x = r1.x + c0.w;
    // cmp r0.xyz, r0.w, r0, c2
    r0.xyz = r0.w < 0 ? c2 : r0;
    // cmp r0.xyz, r1.x, r0, c1
    r0.xyz = r1.x < 0 ? c1 : r0;
    // mov r0.w, c5.z
    r0.w = c5.z;

    return r0;
}

PIXEL(FilterTest3)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FilterCRT)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

TECHNIQUE(Technique1)
{
    PASS_PIXEL(Default)
    PASS_PIXEL(OverlayGlow)
    PASS_PIXEL(FilterColor)
    PASS_PIXEL(FilterInvert)
    PASS_PIXEL(FilterMoonLord)
    PASS_PIXEL(FilterGraveyard)
    PASS_PIXEL(FilterSepia)
    PASS_PIXEL(FilterTower)
    PASS_PIXEL(MonoFix)
    PASS_PIXEL(FilterBloodMoon)
    PASS_PIXEL(FilterMiniTower)
    PASS_PIXEL(FilterMoonLordShake)
    PASS_PIXEL(FilterSandstormForeground)
    PASS_PIXEL(FilterSandstormBackground)
    PASS_PIXEL(FilterBlizzardForeground)
    PASS_PIXEL(FilterBlizzardBackground)
    PASS_PIXEL(FilterHeatDistortion)
    PASS_PIXEL(FilterWaterDistortion)
    PASS_PIXEL(WaterDebugDraw)
    PASS_PIXEL(FilterCrystalDestructionColor)
    PASS_PIXEL(FilterCrystalDestructionVortex)
    PASS_PIXEL(FilterCrystalWin)
    PASS_PIXEL(FilterTest)
    PASS_PIXEL(FilterTest2)
    PASS_PIXEL(FilterTest3)
    PASS_PIXEL(FilterCRT)
}
