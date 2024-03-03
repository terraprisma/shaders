using System;
using System.IO;
using System.Linq;

namespace ShaderDisassembler;

internal static class Program {
    [STAThread]
    internal static void Main() {
        Compiler.Initialize();
        
        var shaders = new[] { "PixelShader.cso", "ScreenShader.cso", "TileShader.cso" };
        var shaderFiles = shaders.Select(x => new FileInfo(Path.GetFullPath(x)));
        Console.WriteLine($"Disassembling {shaders.Length} shader: {string.Join(", ", shaders)}");

        foreach (var shaderFile in shaderFiles) {
            if (!shaderFile.Exists) {
                Console.WriteLine($"ERROR: Shader file {shaderFile.FullName} does not exist!");
            }

            var disassembly = Compiler.Disassemble(shaderFile.FullName);
            var disassemblyFile = new FileInfo(Path.Combine(shaderFile.DirectoryName!, $"{shaderFile.Name}.disassembly.txt"));
            File.WriteAllText(disassemblyFile.FullName, disassembly);
            Console.WriteLine($"Disassembled {shaderFile.Name} to {disassemblyFile.Name}");
        }
    }
}
