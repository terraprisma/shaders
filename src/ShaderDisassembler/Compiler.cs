using System;
using System.IO;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace ShaderDisassembler;

public static unsafe partial class Compiler {
    // ReSharper disable MemberCanBePrivate.Local
    // ReSharper disable FieldCanBeMadeReadOnly.Local
    // ReSharper disable InconsistentNaming
    // ReSharper disable IdentifierTypo
    private delegate nint WndProc(nint hWnd, uint msg, nint wParam, nint lParam);

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    private struct WNDCLASS {
        public uint style;
        public IntPtr lpfnWndProc;
        public int cbClsExtra;
        public int cbWndExtra;
        public IntPtr hInstance;
        public IntPtr hIcon;
        public IntPtr hCursor;
        public IntPtr hbrBackground;

        [MarshalAs(UnmanagedType.LPWStr)]
        public string lpszMenuName;

        [MarshalAs(UnmanagedType.LPWStr)]
        public string lpszClassName;
    }

    [DllImport("User32.dll", EntryPoint = "RegisterClassW", SetLastError = true)]
    private static extern ushort RegisterClass(
        [In]
        ref WNDCLASS lpWndClass
    );

    [LibraryImport("User32.dll", EntryPoint = "CreateWindowExW", SetLastError = true, StringMarshalling = StringMarshalling.Utf16)]
    private static partial nint CreateWindowEx(
        uint dwExStyle,
        [MarshalAs(UnmanagedType.LPWStr)]
        string lpClassName,
        [MarshalAs(UnmanagedType.LPWStr)]
        string lpWindowName,
        uint dwStyle,
        int x,
        int y,
        int nWidth,
        int nHeight,
        nint hWndParent,
        nint hMenu,
        nint hInstance,
        nint lpParam
    );

    [LibraryImport("User32.dll", EntryPoint = "DefWindowProcW", SetLastError = true)]
    private static partial nint DefWindowProc(
        nint hWnd,
        uint uMsg,
        nint wParam,
        nint lParam
    );

    [LibraryImport("User32.dll", SetLastError = true)]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static partial bool DestroyWindow(
        nint hwnd
    );

    [LibraryImport("User32.dll", EntryPoint = "UnregisterClassW", SetLastError = true, StringMarshalling = StringMarshalling.Utf16)]
    [return: MarshalAs(UnmanagedType.Bool)]
    private static partial bool UnregisterClass(
        string lpClassName,
        nint hInstance
    );

    [LibraryImport("Kernel32.dll", EntryPoint = "GetModuleHandleW", SetLastError = true)]
    private static partial nint GetModuleHandle(
        nint lpModuleName
    );

    [StructLayout(LayoutKind.Sequential)]
    private struct D3DPRESENT_PARAMETERS {
        public uint BackBufferWidth;
        public uint BackBufferHeight;
        public uint BackBufferFormat;
        public uint BackBufferCount;
        public uint MultiSampleType;
        public uint MultiSampleQuality;
        public uint SwapEffect;
        public IntPtr hDeviceWindow;

        [MarshalAs(UnmanagedType.Bool)]
        public bool Windowed;

        [MarshalAs(UnmanagedType.Bool)]
        public bool EnableAutoDepthStencil;

        public uint AutoDepthStencilFormat;
        public uint Flags;
        public uint FullScreen_RefreshRateInHz;
        public uint PresentationInterval;
    }

    public const uint WS_OVERLAPPED = 0x00000000;
    public const uint WS_POPUP = 0x80000000;
    public const uint WS_CHILD = 0x40000000;
    public const uint WS_MINIMIZE = 0x20000000;
    public const uint WS_VISIBLE = 0x10000000;
    public const uint WS_DISABLED = 0x08000000;
    public const uint WS_CLIPSIBLINGS = 0x04000000;
    public const uint WS_CLIPCHILDREN = 0x02000000;
    public const uint WS_MAXIMIZE = 0x01000000;
    public const uint WS_CAPTION = 0x00C00000;     /* WS_BORDER | WS_DLGFRAME  */
    public const uint WS_BORDER = 0x00800000;
    public const uint WS_DLGFRAME = 0x00400000;
    public const uint WS_VSCROLL = 0x00200000;
    public const uint WS_HSCROLL = 0x00100000;
    public const uint WS_SYSMENU = 0x00080000;
    public const uint WS_THICKFRAME = 0x00040000;
    public const uint WS_GROUP = 0x00020000;
    public const uint WS_TABSTOP = 0x00010000;

    public const uint WS_MINIMIZEBOX = 0x00020000;
    public const uint WS_MAXIMIZEBOX = 0x00010000;

    public const uint WS_TILED = WS_OVERLAPPED;
    public const uint WS_ICONIC = WS_MINIMIZE;
    public const uint WS_SIZEBOX = WS_THICKFRAME;
    public const uint WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW;

    // Common Window Styles

    public const uint WS_OVERLAPPEDWINDOW = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_THICKFRAME | WS_MINIMIZEBOX | WS_MAXIMIZEBOX;

    public const uint WS_POPUPWINDOW =  WS_POPUP | WS_BORDER | WS_SYSMENU;

    [StructLayout(LayoutKind.Sequential, Pack = 4)]
    public struct IDirect3D9 {
        public IntPtr* lpVtbl;
    }

    private delegate int DelegateIDirect3D9_CreateDevice(IDirect3D9* This, uint Adapter, uint DeviceType, nint hFocusWindow, uint BehaviorFlags, nint pPresentationParameters, nint ppReturnedDeviceInterface);

    private static int IDirect3D9_CreateDevice(IDirect3D9* p, uint Adapter, uint DeviceType, nint hFocusWindow, uint BehaviorFlags, D3DPRESENT_PARAMETERS* pPresentationParameters, IDirect3DDevice9** ppReturnedDeviceInterface) {
        var lpIDirect3D9_CreateDevice = (DelegateIDirect3D9_CreateDevice)Marshal.GetDelegateForFunctionPointer(
            p->lpVtbl[16],
            typeof(DelegateIDirect3D9_CreateDevice)
        );

        return lpIDirect3D9_CreateDevice(p, Adapter, DeviceType, hFocusWindow, BehaviorFlags, (nint)pPresentationParameters, (nint)ppReturnedDeviceInterface);
    }

    [StructLayout(LayoutKind.Sequential, Pack = 4)]
    public struct IDirect3DDevice9 {
        public IntPtr* lpVtbl;
    }

    [StructLayout(LayoutKind.Sequential, Pack = 4)]
    public struct ID3DXEffect {
        public IntPtr* lpVtbl;
    }

    [StructLayout(LayoutKind.Sequential, Pack = 4)]
    public struct ID3DXBuffer {
        public IntPtr* lpVtbl;
    }

    private delegate nint DelegateID3DXBuffer_GetBufferPointer(ID3DXBuffer* This);

    private static nint ID3DXBuffer_GetBufferPointer(ID3DXBuffer* p) {
        var lpDelegateID3DXBuffer_GetBufferPointer = (DelegateID3DXBuffer_GetBufferPointer)Marshal.GetDelegateForFunctionPointer(
            p->lpVtbl[3],
            typeof(DelegateID3DXBuffer_GetBufferPointer)
        );

        var retval = lpDelegateID3DXBuffer_GetBufferPointer(p);
        return retval;
    }

    [LibraryImport("d3d9.dll", EntryPoint = "Direct3DCreate9")]
    [UnmanagedCallConv(CallConvs = new [] { typeof(CallConvStdcall) })]
    private static partial IDirect3D9* Direct3DCreate9(
        uint SDKVersion
    );

    [LibraryImport("d3dx9_43.dll", EntryPoint = "D3DXCreateEffectFromFileW", StringMarshalling = StringMarshalling.Utf16)]
    [UnmanagedCallConv(CallConvs = new [] { typeof(CallConvStdcall) })]
    private static partial int D3DXCreateEffectFromFile(
        IDirect3DDevice9* pDevice,
        [MarshalAs(UnmanagedType.LPWStr)]
        string pSrcFile,
        nint pDefines,
        nint pInclude,
        uint Flags,
        nint pPool,
        ID3DXEffect** ppEffect,
        ID3DXBuffer** ppCompilationErrors
    );

    [LibraryImport("d3dx9_43.dll", EntryPoint = "D3DXCreateEffect", StringMarshalling = StringMarshalling.Utf16)]
    [UnmanagedCallConv(CallConvs = new [] { typeof(CallConvStdcall) })]
    private static partial int D3DXCreateEffect(
        IDirect3DDevice9* pDevice,
        void* pSrcData,
        nint SrcDataLen,
        nint pDefines,
        nint pInclude,
        uint Flags,
        nint pPool,
        ID3DXEffect** ppEffect,
        ID3DXBuffer** ppCompilationErrors
    );

    [LibraryImport("d3dx9_43.dll")]
    [UnmanagedCallConv(CallConvs = new [] { typeof(CallConvStdcall) })]
    private static partial int D3DXDisassembleEffect(
        ID3DXEffect* pEffect,
        [MarshalAs(UnmanagedType.Bool)]
        bool EnableColorCode,
        ID3DXBuffer** ppDisassembly
    );

    private const ushort D3D_SDK_VERSION = 32;
    private const uint D3DFMT_D24S8 = 75;
    private const uint D3DFMT_X8R8G8B8 = 22;
    private const uint D3DSWAPEFFECT_DISCARD = 1;
    private const uint D3DPRESENT_INTERVAL_IMMEDIATE = 0x80000000u;
    private const uint D3DDEVTYPE_NULLREF = 4;
    private const uint D3DCREATE_SOFTWARE_VERTEXPROCESSING = 0x00000020u;
    private const uint WM_DESTROY = 0x0002;

    [DllImport("User32.dll")]
    private static extern void PostQuitMessage(int nExitCode);

    private static D3DPRESENT_PARAMETERS g_D3DPresentParameters;
    private static IDirect3D9* g_D3D = null;
    private static IDirect3DDevice9* g_D3DDevice = null;
    private static nint g_hWnd = nint.Zero;
    private static WndProc _wndProc;

    private const string g_szClassName = "shadersdecomp548hxs09qxw";
    // ReSharper restore FieldCanBeMadeReadOnly.Local
    // ReSharper restore MemberCanBePrivate.Local
    // ReSharper restore InconsistentNaming
    // ReSharper restore IdentifierTypo

    private static nint WindowProc(nint hWnd, uint uMsg, nint wParam, nint lParam) {
        switch (uMsg) {
            case WM_DESTROY:
                PostQuitMessage(0);
                return nint.Zero;

            default:
                return DefWindowProc(hWnd, uMsg, wParam, lParam);
        }
    }

    internal static void Initialize() {
        _wndProc = WindowProc;
        var wc = new WNDCLASS {
            lpszClassName = g_szClassName,
            lpfnWndProc = Marshal.GetFunctionPointerForDelegate(_wndProc),
            hInstance = GetModuleHandle(nint.Zero),
        };

        RegisterClass(ref wc);

        g_hWnd = CreateWindowEx(
            0,
            g_szClassName,
            "Shader Decompiler",
            WS_OVERLAPPEDWINDOW,
            20,
            20,
            800,
            600,
            0,
            0,
            GetModuleHandle(nint.Zero),
            0
        );

        g_D3D = Direct3DCreate9(D3D_SDK_VERSION);
        g_D3DPresentParameters = new D3DPRESENT_PARAMETERS {
            AutoDepthStencilFormat = D3DFMT_D24S8,
            BackBufferCount = 1,
            BackBufferFormat = D3DFMT_X8R8G8B8,
            BackBufferWidth = 32,
            BackBufferHeight = 32,
            EnableAutoDepthStencil = false,
            Flags = 0,
            FullScreen_RefreshRateInHz = 0,
            hDeviceWindow = g_hWnd,
            PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE,
            SwapEffect = D3DSWAPEFFECT_DISCARD,
            Windowed = true,
        };

        fixed (D3DPRESENT_PARAMETERS* pD3DPresentParams = &g_D3DPresentParameters) {
            fixed (IDirect3DDevice9** ppD3DDevice = &g_D3DDevice) {
                IDirect3D9_CreateDevice(g_D3D, 0, D3DDEVTYPE_NULLREF, g_hWnd, D3DCREATE_SOFTWARE_VERTEXPROCESSING, pD3DPresentParams, ppD3DDevice);
            }
        }
    }

    public static string Disassemble(string path) {
        ID3DXEffect* effect = null;
        ID3DXBuffer* error = null;
        ID3DXBuffer* disassembler = null;
        // D3DXCreateEffectFromFile(g_D3DDevice, path, nint.Zero, nint.Zero, 0, nint.Zero, &effect, &error);
        var bytes = File.ReadAllBytes(path);
        fixed (byte* pBytes = bytes) {
            var skip = BitConverter.ToUInt32(bytes, 4);
            D3DXCreateEffect(g_D3DDevice, pBytes + skip, (nint)(bytes.Length - skip), nint.Zero, nint.Zero, 0, nint.Zero, &effect, &error);
        }
        if (error != null) {
            var message = Marshal.PtrToStringAnsi(ID3DXBuffer_GetBufferPointer(error));
            throw new Exception(message);
        }
        D3DXDisassembleEffect(effect, false, &disassembler);
        var source = Marshal.PtrToStringAnsi(ID3DXBuffer_GetBufferPointer(disassembler));
        return source!;
    }
}
