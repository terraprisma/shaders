using System;
using System.Diagnostics;
using System.IO;
using System.Linq;

namespace ShaderDisassembler;

internal static class Program {
    [STAThread]
    internal static void Main(string[] args) {
        Directory.SetCurrentDirectory(args[0]);

        var shaders = args.Skip(1).ToArray();
        Console.WriteLine($"Disassembling and compiling {shaders.Length} shaders: {string.Join(", ", shaders)}");
        Console.WriteLine();

        Compiler.Initialize();

        var fxc = new FileInfo("fxc.exe");
        if (!fxc.Exists) {
            Console.WriteLine("ERROR: fxc.exe not found!");
            return;
        }

        foreach (var shaderName in shaders) {
            var shaderCso = new FileInfo(shaderName + ".cso");
            var shaderAsm = new FileInfo(shaderName + ".asm");
            var shaderFx = new FileInfo(shaderName + ".fx");
            var shaderNewCso = new FileInfo(shaderName + ".new.cso");
            var shaderNewAsm = new FileInfo(shaderName + ".new.asm");

            Console.WriteLine("Handling " + shaderName);

            if (!shaderCso.Exists) {
                Console.WriteLine($"    ERROR: Shader file {shaderCso.FullName} does not exist!");
                continue;
            }

            Console.WriteLine($"    Disassembling {shaderCso.Name} to {shaderAsm.Name}");
            {
                var disassembly = Compiler.Disassemble(shaderCso.FullName, true);
                File.WriteAllText(shaderAsm.FullName, disassembly);
            }

            Console.WriteLine($"    Compiling {shaderFx.Name} to {shaderNewCso.Name}");
            {
                if (!shaderFx.Exists) {
                    Console.WriteLine($"    ERROR: Shader file {shaderFx.FullName} does not exist!");
                    continue;
                }

                var proc = new Process {
                    StartInfo = new ProcessStartInfo {
                        FileName = fxc.FullName,
                        Arguments = $"\"{shaderFx.FullName}\" /T fx_2_0 /nologo /Fo \"{shaderNewCso.FullName}\"",
                        UseShellExecute = false,
                        RedirectStandardOutput = true,
                        RedirectStandardError = true,
                        CreateNoWindow = true,
                    },
                };

                Console.WriteLine($"    Running command: fxc {proc.StartInfo.Arguments}");
                Console.WriteLine("    {");
                {
                    proc.Start();

                    while (!proc.StandardError.EndOfStream)
                        Console.WriteLine("        " + proc.StandardError.ReadLine());
                    
                    while (!proc.StandardOutput.EndOfStream)
                        Console.WriteLine("        " + proc.StandardOutput.ReadLine());

                    proc.WaitForExit();
                    Console.WriteLine($"        exit code: {proc.ExitCode}");
                }

                Console.WriteLine("    }");
            }

            Console.WriteLine($"    Disassembling {shaderNewCso.Name} to {shaderNewAsm.Name}");
            {
                var disassembly = Compiler.Disassemble(shaderNewCso.FullName, false);
                File.WriteAllText(shaderNewAsm.FullName, disassembly);
            }
        }
    }
}
