using System;
using System.Runtime.InteropServices;

namespace FIcon
{
    public static class FolderIconChanger
    {
        [DllImport("Shell32.dll", CharSet = CharSet.Auto)]
        static extern uint SHGetSetFolderCustomSettings(ref LPSHFOLDERCUSTOMSETTINGS pfcs, string pszPath, uint dwReadWrite);

        const uint FCSM_ICONFILE = 0x10,
                   FCS_FORCEWRITE = 0x00000002,
                   FCS_WRITE = FCS_FORCEWRITE;

        [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
        struct LPSHFOLDERCUSTOMSETTINGS
        {
            public uint dwSize;
            public uint dwMask;
            public IntPtr pvid;
            public string pszWebViewTemplate;
            public uint cchWebViewTemplate;
            public string pszWebViewTemplateVersion;
            public string pszInfoTip;
            public uint cchInfoTip;
            public IntPtr pclsid;
            public uint dwFlags;
            public string pszIconFile;
            public uint cchIconFile;
            public int iIconIndex;
            public string pszLogo;
            public uint cchLogo;
        }

        public static uint ApplyFolderIcon(string targetFolderPath, string iconFilePath)
        {
            LPSHFOLDERCUSTOMSETTINGS FolderSettings = new LPSHFOLDERCUSTOMSETTINGS();
            FolderSettings.dwMask = FCSM_ICONFILE;
            FolderSettings.pszIconFile = iconFilePath;
            FolderSettings.iIconIndex = 0;

            string pszPath = targetFolderPath;
            uint HRESULT = SHGetSetFolderCustomSettings(ref FolderSettings, pszPath, FCS_WRITE);
            return HRESULT;
        }

        public static uint RemoveFolderIcon(string targetFolderPath)
        {
            LPSHFOLDERCUSTOMSETTINGS FolderSettings = new LPSHFOLDERCUSTOMSETTINGS();
            FolderSettings.dwMask = FCSM_ICONFILE;
            FolderSettings.pszIconFile = null;
            FolderSettings.iIconIndex = 0;

            string pszPath = targetFolderPath;
            uint HRESULT = SHGetSetFolderCustomSettings(ref FolderSettings, pszPath, FCS_WRITE);
            return HRESULT;
        }
    }
}
