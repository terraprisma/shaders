#include "shared.fxh"

sampler uImage0 : register(s0);

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

PIXEL(ArmorMartian)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorColored)
() : COLOR0
{
    PIXEL_SHADER_TODO;
}

PIXEL(ArmorColoredAndBlack)
() : COLOR0
{
    PIXEL_SHADER_TODO;
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
() : COLOR0
{
    PIXEL_SHADER_TODO;
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
    float4 c0 = { 1, 0, 0, 0 };

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
() : COLOR0
{
    PIXEL_SHADER_TODO;
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
() : COLOR0
{
    PIXEL_SHADER_TODO;
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
() : COLOR0
{
    PIXEL_SHADER_TODO;
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
() : COLOR0
{
    PIXEL_SHADER_TODO;
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

PIXEL(MaskedFade)
() : COLOR0
{
    PIXEL_SHADER_TODO;
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