using FIcon.CommonDialogs;
using FIcon.Icons;
using FIcon.Util;
using Microsoft.Win32;
using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Interop;

namespace FIcon
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private const int GWL_EXSTYLE = -20;
        private const int WS_EX_NOACTIVATE = 0x08000000;

        [DllImport("user32.dll")]
        public static extern IntPtr SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

        [DllImport("user32.dll")]
        public static extern int GetWindowLong(IntPtr hWnd, int nIndex);

        public MainWindow()
        {
            InitializeComponent();
            Loaded += MainWindow_Loaded;
        }

        protected override void OnSourceInitialized(EventArgs e)
        {
            base.OnSourceInitialized(e);

            WindowInteropHelper helper = new WindowInteropHelper(this);
            SetWindowLong(helper.Handle, GWL_EXSTYLE, GetWindowLong(helper.Handle, GWL_EXSTYLE) | WS_EX_NOACTIVATE);
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            string[] args = Environment.GetCommandLineArgs().Skip(1).ToArray();

            if (args.Length > 0)
            {
                if (args[0].ToLower() == "/about")
                {
                    AboutBox.Spawn();
                }
                else if (args[0].ToLower() == "/untag")
                {
                    if (args.Length > 1)
                        TagFolder(args[1], null);
                }
                else if (args[0].ToLower() == "/tag:custom")
                {
                    if (args.Length > 1)
                    {
                        var od = new OpenFileDialog()
                        {
                            Filter = "PNG Files|*.png",
                            Multiselect = true,
                            Title = "Select icon(s) for folder"
                        };
                        if (od.ShowDialog() == true)
                        {
                            var icoFileDir = Environment.ExpandEnvironmentVariables(@"%appdata%\ficon\generated_icons\");
                            var icoFileName = Guid.NewGuid().ToString() + ".ico";
                            var icoFile = Path.Combine(icoFileDir, icoFileName);

                            Directory.CreateDirectory(icoFileDir);

                            try
                            {
                                var _icons_0 = od.FileNames.Select(x => PNGIcoImage.FromFile(x));
                                var iconsCountPrev = _icons_0.Count();
                                var icons = _icons_0.Distinct(new IconSizeComparer()).ToArray();
                                var iconsCountAfter = icons.Length;

                                var sizesPrev = string.Join("\r\n", _icons_0.Select(x => x.width.ToString()).ToArray());
                                var sizesAfter = string.Join("\r\n", icons.Select(x => x.width.ToString()).ToArray());

                                var dbgInfo = string.Format("---\r\n{0} -> {1}\r\n---\r\n{2}\r\n---\r\n{3}", iconsCountPrev, iconsCountAfter, sizesPrev, sizesAfter);

                                if (
                                    iconsCountPrev == iconsCountAfter ||
                                    MessageBox.Show(
                                        string.Format(
                                            "One or more images have been resized to the same size (allowed sizes are: {0}). This might to an image not showing up correctly. Do you want to continue anyway?\r\n{1}",
                                            string.Join(", ", ImageResizeHelper.ALLOWED_SIZES),
                                            dbgInfo),
                                        "", MessageBoxButton.YesNo, MessageBoxImage.Warning) == MessageBoxResult.Yes
                                )
                                {
                                    var icoData = IcoWriter.IcoFromPNGs(icons);
                                    File.WriteAllBytes(icoFile, icoData);

                                    FolderIconChanger.ApplyFolderIcon(args[1], icoFile);
                                }
                            } catch (Exception ex)
                            {
                                if (ex is ImageNotSquareException)
                                    MessageBox.Show("One or more images are not square. All images for an icon have to be square!", "Ficon", MessageBoxButton.OK, MessageBoxImage.Warning);
                                else
                                    MessageBox.Show("The following error occured:\r\n" + ex.ToString(), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                            }
                        }
                    }
                }
                else if (args[0].ToLower().StartsWith("/tag:"))
                {
                    var tagColor = args[0].Substring(5);

                    if (args.Length > 1)
                        switch (tagColor)
                        {
                            case "red":
                            case "orange":
                            case "yellow":
                            case "green":
                            case "mint":
                            case "aqua":
                            case "blue":
                            case "purple":
                            case "pink":
                            case "black":
                            case "white":
                            case "babyblue":
                            case "cherry":
                            case "lemon":
                            case "peach":
                                TagFolder(args[1], tagColor);
                                break;
                            default:
                                MessageBox.Show("Invalid tag colour!", "", MessageBoxButton.OK, MessageBoxImage.Information);
                                break;
                        }
                }
                else
                    MessageBox.Show("Invalid command line option", "FIcon", MessageBoxButton.OK, MessageBoxImage.Exclamation);
            }
            else
                MessageBox.Show("FIcon cannot be run directly", "FIcon", MessageBoxButton.OK, MessageBoxImage.Exclamation);

            Close();
        }

        private void TagFolder(string folder, string color)
        {
            if (color == null)
            {
                FolderIconChanger.RemoveFolderIcon(folder);
                return;
            }
            var loc = Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
            FolderIconChanger.ApplyFolderIcon(folder, Path.Combine(loc, "icons", "folder_" + color + ".ico"));
        }
    }
}
