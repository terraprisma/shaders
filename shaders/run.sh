#!/usr/bin/env bash

dir=$(readlink -m $(dirname "$0"))

cd ../src/ShaderDisassembler
dotnet run -c Release $dir PixelShader ScreenShader TileShader