
//listing of all techniques and passes with embedded asm listings 

technique Technique1
{
    pass Default
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
            //
            // Parameters:
            //
            //   sampler2D uImage0;
            //
            //
            // Registers:
            //
            //   Name         Reg   Size
            //   ------------ ----- ----
            //   uImage0      s0       1
            //
            
                ps_2_0
                dcl v0
                dcl t0.xy
                dcl_2d s0
                texld r0, t0, s0
                mul r0, r0, v0
                mov oC0, r0
            
            // approximately 3 instruction slots used (1 texture, 2 arithmetic)
            };
    }
    pass ColorOnly
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
            //
            // Parameters:
            //
            //   sampler2D uImage0;
            //
            //
            // Registers:
            //
            //   Name         Reg   Size
            //   ------------ ----- ----
            //   uImage0      s0       1
            //
            
                ps_2_0
                dcl v0
                dcl t0.xy
                dcl_2d s0
                texld r0, t0, s0
                mul r0, r0.w, v0
                mov oC0, r0
            
            // approximately 3 instruction slots used (1 texture, 2 arithmetic)
            };
    }
    pass ArmorMartian
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColored
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredAndBlack
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredAndSilverTrim
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorSilverTrim
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorBrightnessColored
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredGradient
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredAndBlackGradient
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorBrightnessGradient
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredRainbow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorBrightnessRainbow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorLivingRainbow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorInvert
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorLivingOcean
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorLivingFlame
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorWisp
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorHighContrastGlow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorPlaid
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorDev
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorPlaid
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorReflectiveColor
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorBasicColor
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorHades
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorTwilight
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorAcid
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorMushroom
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
            //
            // Parameters:
            //
            //   float3 uColor;
            //   sampler2D uImage0;
            //
            //
            // Registers:
            //
            //   Name         Reg   Size
            //   ------------ ----- ----
            //   uColor       c0       1
            //   uImage0      s0       1
            //
            
                ps_2_0
                def c1, 0.333333343, -0.300000012, 1.66666663, 1
                def c2, -2, 3, 0.25, 0
                def c3, 0.5, 0, 0, 0
                dcl v0
                dcl t0.xy
                dcl_2d s0
                texld r0, t0, s0
                add r1.w, r0.y, r0.x
                add r1.x, r0.z, r1.w
                mad r1.x, r1.x, c1.x, c1.y
                mul_sat r1.y, r1.x, c1.z
                mad r1.z, r1.y, c2.x, c2.y
                mul r1.y, r1.y, r1.y
                mad r1.y, r1.z, -r1.y, c1.w
                mul r0.xyz, r0, c2.z
                mad r2.xyz, c0, r1.y, -r0
                mad r0.xyz, r1.y, r2, r0
                cmp r1.xyz, r1.x, r0, c2.w
                mov r1.w, c1.w
                mul r0, r0.w, r1
                min r1, r0, c1.w
                max r0.xyz, v0, v0.w
                lrp r2.xyz, c3.x, r0, v0
                mov r2.w, v0.w
                mul r0, r1, r2
                mov oC0, r0
            
            // approximately 20 instruction slots used (1 texture, 19 arithmetic)
            };
    }
    pass ArmorPhase
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorReflective
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorSolar
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorNebula
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorVortex
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorStardust
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorVoid
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorShiftingSands
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorShiftingPearlsands
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorFog
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorHallowBoss
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorMirage
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorMidnightRainbow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorColoredAndSilverTrimGradient
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorPolarized
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorGel
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorFlow
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorForceField
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ArmorLoki
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass ForceField
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass WaterProcessor
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass WaterDistortionObject
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass HallowBoss
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass TitaniumStorm
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass QueenSlime
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass MagicMissile
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass FinalFractal
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass FinalFractalVertex
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass MaskedFade
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
    pass RainbowTownSlime
    {
        //No embedded vertex shader
        pixelshader = 
            asm {
            //
            // Generated by Microsoft (R) HLSL Shader Compiler 10.1
                ps_2_0
                def c0, 0, 0, 0, 0
                mov r0, c0.x
                mov oC0, r0
            
            // approximately 2 instruction slots used
            };
    }
}

