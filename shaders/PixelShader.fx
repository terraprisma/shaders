#include "shared.fxh"

sampler uImage0 : register(s0);
sampler uImage1 : register(s1);
float3 uColor;
float3 uSecondaryColor;
float uOpacity;
float2 uTargetPosition;
float uSaturation;
float uRotation;
float uTime;
float4 uSourceRect;
float2 uWorldPosition;
float uDirection;
float3 uLightSource;
float2 uImageSize0;
float2 uImageSize1;
float4 uLegacyArmorSourceRect;
float2 uLegacyArmorSheetSize;

float4 uShaderSpecificData;

PIXEL(Default)
(float4 sampleColor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    return tex2D(uImage0, coords) * sampleColor;
}

PIXEL(ColorOnly)
(float4 sampleColor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    return sampleColor * tex2D(uImage0, coords).a;
}

#pragma message(DOES_NOT_MATCH(ArmorMartian, Pixel));
PIXEL(ArmorMartian)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = {0, 2, 3, 0.5};
    float4 c1 = {1, 0, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;

    // texld r0, t0, s0
    r0 = tex2D(uImage0, t0);
    // add r1.w, r0.y, r0.x
    r1.w = r0.x + r0.y;
    // add r1.x, r0.z, r1.w
    r1.x = r0.z + r1.w;
    // max r1.y, r0.y, r0.z
    r1.y = max(r0.y, r0.z);
    // max r2.w, r0.x, r1.y
    r2.w = max(r0.x, r1.y);
    // mul r0.w, r0.w, v0.w
    r0.w = r0.w * v0.w;
    // add r1.x, r1.x, -r2.w
    r1.x = r1.x + -r2.w;
    // mad r1.y, r1.x, -c0.w, r2.w
    r1.y = mad(r1.x, -c0.w, r2.w);
    // mul r1.x, r1.x, c0.w
    r1.x = r1.x * c0.w;
    // mul r2.xyz, r0.w, c0
    r2.xyz = r0.w * c0.xyz;
    // mad r2.xyz, r1.y, r2, r1.x
    r2.xyz = mad(r1.y, r2, r1.x);
    // add r2.w, -r1.y, c1.x
    r2.w = -r1.y + c1.x;
    // add r1.xyz, -v0, c1.x
    r1.xyz = -v0 + c1.x;
    // mad r1.xyz, r1, -r2.w, c1.x
    r1.xyz = mad(r1, -r2.w, c1.x);
    // mul r0.xyz, r2, r1
    r0.xyz = r2.xyz * r1.xyz;

    return r0;
}

#pragma message(DOES_NOT_MATCH(ArmorColored, Pixel));
PIXEL(ArmorColored)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float3 c0 = uColor;
    float c1 = uSaturation;
    float4 c2;
    float3 c3 = uColor;
    float c4 = uSaturation;
    float4 c5 = {0.5, 1.5, 1, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    
    // preshader (start)
    // neg r0.xyz, c0.xyz
    r0.xyz = -c0.xyz;
    // add c0.xyz, (1, 1, 1), r0.xyz
    c0.xyz = 1 + r0.xyz;
    // neg r0.x, c1.x
    r0.x = -c1.x;
    // add r1.x, r0.x, (1)
    r1.x = r0.x + 1;
    // rcp r0.x, c1.x
    r0.x = 1 / c1.x;
    // cmp r2.x, r1.x, (1), r0.x
    r2.x = r1.x >= 0 ? r0.x : 1;
    // neg r0.x, r2.x
    r0.x = -r2.x;
    // mov c1.x, r2.x
    c1.x = r2.x;
    // add c2.x, r0.x, (1)
    c2.x = r0.x + 1;
    // preshader (end)

    // texld r0, t0, s0
    r0 = tex2D(uImage0, t0);
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
    // add r0.y, r2.w, -r2.x
    r0.y = -r2.x + r2.w;
    // mul r0.y, r0.y, c4.x
    r0.y = r0.y * c4.x;
    // mov r1.x, c1.x
    r1.x = c1.x;
    // mad r0.y, r0.y, r1.x, c2.x
    r0.y = mad(r0.y, r1.x, c2.x);
    // mad r0.z, r0.x, -c5.x, c5.y
    r0.z = mad(r0.x, -c5.x, c5.y);
    // mov r1.z, c5.z
    r1.z = c5.z;
    // mad r1.xyz, r0.z, -c0, r1.z
    r1.xyz = mad(r0.z, -c0, r1.z);
    // mad r1.w, r0.x, -c5.x, c5.x
    r1.w = mad(r0.x, -c5.x, c5.x);
    // mul r2.xyz, r0.x, c3
    r2.xyz = r0.x * c3;
    // cmp r1.xyz, r1.w, r2, r1
    r1.xyz = r1.w < 0 ? r1 : r2;
    // mad r1.xyz, r0.x, -c5.x, r1
    r1.xyz = mad(r0.x, -c5.x, r1);
    // mul r1.w, r0.x, c5.x
    r1.w = r0.x * c5.x;
    // mad r1.xyz, r0.y, r1, r1.w
    r1.xyz = mad(r0.y, r1, r1.w);
    // mov r1.w, c5.z
    r1.w = c5.z;
    // mul r0, r0.w, r1
    r0 = r0.w * r1;
    // mul r0, r0, v0
    r0 = r0 * v0;

    return r0;
}

#pragma message(DOES_NOT_MATCH(ArmorColoredAndBlack, Pixel));
PIXEL(ArmorColoredAndBlack)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float3 c0 = uColor;
    float c1 = uSaturation;
    float4 c2;
    float3 c3 = uColor;
    float c4 = uSaturation;
    float4 c5 = {0.5, 1.5, 1, 0};
    float4 c6 = {0.660000026, 0.330000013, 0, 0};

    float4 r0;
    float4 r1;
    float4 r2;
    float4 r3;

    // preshader (start)
    // neg r0.xyz, c0.xyz
    r0.xyz = -c0.xyz;
    // add c0.xyz, (1, 1, 1), r0.xyz
    c0.xyz = 1 + r0.xyz;
    // neg r0.x, c1.x
    r0.x = -c1.x;
    // add r1.x, r0.x, (1)
    r1.x = r0.x + 1;
    // rcp r0.x, c1.x
    r0.x = 1 / c1.x;
    // cmp r2.x, r1.x, (1), r0.x
    r2.x = r1.x >= 0 ? 1 : r0.x;
    // neg r0.x, r2.x
    r0.x = -r2.x;
    // mov c1.x, r2.x
    c1.x = r2.x;
    // add c2.x, r0.x, (1)
    c2.x = r0.x + 1;
    // preshader (end)

    // texld r0, t0, s0
    r0 = tex2D(uImage0, t0);
    // max r1.w, r0.y, r0.z
    r1.w = max(r0.y, r0.z);
    // max r2.w, r0.x, r1.w
    r2.w = max(r0.x, r1.w);
    // min r1.x, r0.z, r0.y
    r1.x = min(r0.y, r0.z);
    // min r2.x, r1.x, r0.x
    r2.x = min(r0.x, r1.x);
    // add r1.x, r2.w, r2.x
    r1.x = r2.x + r2.w;
    // add r1.y, r2.w, -r2.x
    r1.y = -r2.x + r2.w;
    // mad r1.z, r1.x, -c5.x, c5.y
    r1.z = mad(r1.x, -c5.x, c5.y);
    // mov r1.w, c5.z
    r1.w = c5.z;
    // mad r2.xyz, r1.z, -c0, r1.w
    r2.xyz = mad(r1.z, -c0, r1.w);
    // mad r2.w, r1.x, -c5.x, c5.x
    r2.w = mad(r1.x, -c5.x, c5.x);
    // mul r3.xyz, r1.x, c3
    r3.xyz = r1.x * c3;
    // cmp r2.xyz, r2.w, r3, r2
    r2.xyz = r2.w >= 0 ? r3 : r2;
    // mad r2.xyz, r1.x, -c5.x, r2
    r2.xyz = mad(r1.x, -c5.x, r2);
    // mul r2.w, r1.x, c5.x
    r2.w = mul(r1.x, c5.x);
    // mul r1.x, r1.y, c4.x
    r1.x = mul(r1.y, c4.x);
    // mad r1.y, r1.y, c6.x, c6.y
    r1.y = mad(r1.y, c6.x, c6.y);
    // mov r3.x, c1.x
    r3.x = c1.x;
    // mad r1.x, r1.x, r3.x, c2.x
    r1.x = mad(r1.x, r3.x, c2.x);
    // mad r2.xyz, r1.x, r2, r2.w
    r2.xyz = mad(r1.x, r2, r2.w);
    // mul r2.xyz, r0.w, r2
    r2.xyz = r0.w * r2;
    // mul r0.xyz, r1.y, r2
    r0.xyz = r1.y * r2;
    // mul r0, r0, v0
    r0 = r0 * v0;

    return r0;
}

PIXEL(ArmorColoredAndSilverTrim)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorSilverTrim)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorBrightnessColored)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float3 c0 = uColor;
    float4 c1 = {0.333333343, 0, 0, 0};

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // add r1.w, r0.y, r0.x
    r1.w = r0.x + r0.y;
    // add r1.x, r0.z, r1.w
    r1.x = r0.z + r1.w;
    // mul r1.x, r1.x, c1.x
    r1.x = r1.x * c1.x;
    // mul r1.xyz, r1.x, c0
    r1.xyz = r1.x * c0;
    // mul r0.xyz, r0.w, r1
    r0.xyz = r0.w * r1.xyz;
    // mul r0, r0, v0
    r0 = r0 * v0;

    return r0;
}

PIXEL(ArmorColoredGradient)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorColoredAndBlackGradient)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorBrightnessGradient)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorColoredRainbow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorBrightnessRainbow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorLivingRainbow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorInvert)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = {1, 0, 0, 0};

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // mov r1.w, c0.x
    r1.w = c0.x;
    // add r1.xyz, -r0, c0.x
    r1.xyz = -r0 + c0.x;
    // mul r0, r0.w, r1
    r0 = r0.w * r1;
    // mul r0, r0, v0
    r0 = r0 * v0;

    return r0;
}

PIXEL(ArmorLivingOcean)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorLivingFlame)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorWisp)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorHighContrastGlow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorPlaid)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorDev)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

// Vanilla defines ArmorPlaid as a pass twice...?
/*PIXEL(ArmorPlaid)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}*/

PIXEL(ArmorReflectiveColor)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorBasicColor)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float3 c0 = uColor;
    float c1 = uOpacity;

    float4 r0 = tex2D(uImage0, t0);

    // mul r0.xyz, r0, c0
    r0.xyz = r0.xyz * c0;
    // mul r0, r0, v0
    r0 = r0 * v0;
    // mul r0, r0, c1.x
    r0 = r0 * c1.x;

    return r0;
}

PIXEL(ArmorHades)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorTwilight)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorAcid)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorMushroom)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float3 c0 = uColor;
    float4 c1 = {0.333333343, -0.300000012, 1.66666663, 1};
    float4 c2 = {-2, 3, 0.25, 0};
    float4 c3 = {0.5, 0, 0, 0};

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;
    float4 r2;

    // add r1.w, r0.y, r0.x
    r1.w = r0.x + r0.y;
    // add r1.x, r0.z, r1.w
    r1.x = r0.z + r1.w;
    // mad r1.x, r1.x, c1.x, c1.y
    r1.x = mad(r1.x, c1.x, c1.y);
    // mul_sat r1.y, r1.x, c1.z
    r1.y = saturate(r1.x * c1.z);
    // mad r1.z, r1.y, c2.x, c2.y
    r1.z = mad(r1.y, c2.x, c2.y);
    // mul r1.y, r1.y, r1.y
    r1.y = r1.y * r1.y;
    // mad r1.y, r1.z, -r1.y, c1.w
    r1.y = mad(r1.z, -r1.y, c1.w);
    // mul r0.xyz, r0, c2.z
    r0.xyz = r0 * c2.z;
    // mad r2.xyz, c0, r1.y, -r0
    r2.xyz = mad(c0, r1.y, -r0);
    // mad r0.xyz, r1.y, r2, r0
    r0.xyz = mad(r1.y, r2, r0);
    // cmp r1.xyz, r1.x, r0, c2.w
    r1.xyz = r1.x < 0 ? c2.w : r0;
    // mov r1.w, c1.w
    r1.w = c1.w;
    // mul r0, r0.w, r1
    r0 = r0.w * r1;
    // min r1, r0, c1.w
    r1 = min(r0, c1.w);
    // max r0.xyz, v0, v0.w
    r0.xyz = max(v0, v0.w);
    // lrp r2.xyz, c3.x, r0, v0
    r2.xyz = v0 + c3.x * (r0 - v0);
    // mov r2.w, v0.w
    r2.w = v0.w;
    // mul r0, r1, r2
    r0 = r1 * r2;

    return r0;
}

PIXEL(ArmorPhase)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorReflective)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorSolar)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorNebula)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorVortex)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorStardust)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorVoid)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorShiftingSands)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorShiftingPearlsands)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorFog)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorHallowBoss)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorMirage)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorMidnightRainbow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorColoredAndSilverTrimGradient)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorPolarized)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = {0.333333343, 0.600000024, 0.166666672, 0.5};
    float4 c1 = {1, 0, 0, 0};

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // add r0.x, r0.y, r0.x
    r0.x = r0.x + r0.y;
    // add r0.x, r0.z, r0.x
    r0.x = r0.x + r0.z;
    // mad r0.y, r0.x, -c0.x, c0.y
    r0.y = mad(r0.x, -c0.x, c0.y);
    // mul r0.z, r0.x, c0.z
    r0.z = r0.x * c0.z;
    // mad r0.x, r0.x, c0.z, c0.w
    r0.x = mad(r0.x, c0.z, c0.w);
    // cmp r1.xyz, r0.y, r0.z, r0.x
    r1.xyz = r0.y < 0 ? r0.x : r0.z;
    // mov r1.w, c1.x
    r1.w = c1.x;
    // mul r0, r0.w, r1
    r0 = r0.w * r1;
    // mul r0, r0, v0
    r0 = r0 * v0;

    return r0;
}

PIXEL(ArmorGel)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorFlow)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorForceField)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorLoki)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ForceField)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(WaterProcessor)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(WaterDistortionObject)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(HallowBoss)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float c0 = uTime;
    float4 c1 = {0.5, 0, 0, 0};

    float4 r0 = tex2D(uImage0, t0);
    float4 r1;

    // add r0.x, r0.x, c0.x
    r0.x = r0.x + c0.x;
    // abs r0.y, r0.x
    r0.y = abs(r0.x);
    // frc r0.y, r0.y
    r0.y = frac(r0.y);
    // cmp r0.x, r0.x, r0.y, -r0.y
    r0.x = r0.x < 0 ? -r0.y : r0.y;
    // mov r0.y, c1.x
    r0.y = 0.5;
    // texld r1, r0, s1
    r1 = tex2D(uImage1, r0.xy);
    // mul r1, r1, v0
    r1 = r1 * v0;
    // mul r0, r0.w, r1
    r0 = r1 * r0.w;

    return r0;
}

PIXEL(TitaniumStorm)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(QueenSlime)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(MagicMissile)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FinalFractal)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(FinalFractalVertex)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

#pragma message(DOES_NOT_MATCH(MaskedFade, Pixel));
PIXEL(MaskedFade)
(float4 v0 : COLOR0, float2 t0 : TEXCOORD0) : COLOR0
{
    float4 c0 = uShaderSpecificData;

    float4 r0;
    float4 r1;

    // mov r0.x, t0.x
    r0.x = t0.x;
    // mad r0.y, t0.y, c0.x, c0.y
    r0.y = mad(t0.y, c0.x, c0.y);
    // add r1.x, t0.x, c0.z
    r1.x = t0.x + c0.z;
    // add r1.y, t0.y, c0.w
    r1.y = t0.y + c0.w;
    // texld r0, r0, s1
    r0 = tex2D(uImage1, r0.xy);
    // texld r1, r1, s0
    r1 = tex2D(uImage0, r1.xy);
    // mul r1, r1, v0
    r1 = r1 * v0;
    // mul r0, r0.w, r1
    r0 = r0.w * r1;

    return r0;
}

PIXEL(RainbowTownSlime)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

TECHNIQUE(Technique1)
{
    PASS_PIXEL(Default)
    PASS_PIXEL(ColorOnly)
    PASS_PIXEL(ArmorMartian)
    PASS_PIXEL(ArmorColored)
    PASS_PIXEL(ArmorColoredAndBlack)
    PASS_PIXEL(ArmorColoredAndSilverTrim)
    PASS_PIXEL(ArmorSilverTrim)
    PASS_PIXEL(ArmorBrightnessColored)
    PASS_PIXEL(ArmorColoredGradient)
    PASS_PIXEL(ArmorColoredAndBlackGradient)
    PASS_PIXEL(ArmorBrightnessGradient)
    PASS_PIXEL(ArmorColoredRainbow)
    PASS_PIXEL(ArmorBrightnessRainbow)
    PASS_PIXEL(ArmorLivingRainbow)
    PASS_PIXEL(ArmorInvert)
    PASS_PIXEL(ArmorLivingOcean)
    PASS_PIXEL(ArmorLivingFlame)
    PASS_PIXEL(ArmorWisp)
    PASS_PIXEL(ArmorHighContrastGlow)
    PASS_PIXEL(ArmorPlaid)
    PASS_PIXEL(ArmorDev)
    PASS_PIXEL(ArmorPlaid)
    PASS_PIXEL(ArmorReflectiveColor)
    PASS_PIXEL(ArmorBasicColor)
    PASS_PIXEL(ArmorHades)
    PASS_PIXEL(ArmorTwilight)
    PASS_PIXEL(ArmorAcid)
    PASS_PIXEL(ArmorMushroom)
    PASS_PIXEL(ArmorPhase)
    PASS_PIXEL(ArmorReflective)
    PASS_PIXEL(ArmorSolar)
    PASS_PIXEL(ArmorNebula)
    PASS_PIXEL(ArmorVortex)
    PASS_PIXEL(ArmorStardust)
    PASS_PIXEL(ArmorVoid)
    PASS_PIXEL(ArmorShiftingSands)
    PASS_PIXEL(ArmorShiftingPearlsands)
    PASS_PIXEL(ArmorFog)
    PASS_PIXEL(ArmorHallowBoss)
    PASS_PIXEL(ArmorMirage)
    PASS_PIXEL(ArmorMidnightRainbow)
    PASS_PIXEL(ArmorColoredAndSilverTrimGradient)
    PASS_PIXEL(ArmorPolarized)
    PASS_PIXEL(ArmorGel)
    PASS_PIXEL(ArmorFlow)
    PASS_PIXEL(ArmorForceField)
    PASS_PIXEL(ArmorLoki)
    PASS_PIXEL(ForceField)
    PASS_PIXEL(WaterProcessor)
    PASS_PIXEL(WaterDistortionObject)
    PASS_PIXEL(HallowBoss)
    PASS_PIXEL(TitaniumStorm)
    PASS_PIXEL(QueenSlime)
    PASS_PIXEL(MagicMissile)
    PASS_PIXEL(FinalFractal)
    PASS_PIXEL(FinalFractalVertex)
    PASS_PIXEL(MaskedFade)
    PASS_PIXEL(RainbowTownSlime)
}