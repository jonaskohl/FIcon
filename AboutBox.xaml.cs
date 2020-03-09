using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.IO;
using System.Diagnostics;
using System.Threading;

namespace FIcon
{
    /// <summary>
    /// Interaction logic for AboutBox.xaml
    /// </summary>
    public partial class AboutBox : Window
    {
        public AboutBox()
        {
            InitializeComponent();
            Loaded += AboutBox_Loaded;
            websiteLink.RequestNavigate += WebsiteLink_RequestNavigate;
        }

        private void WebsiteLink_RequestNavigate(object sender, System.Windows.Navigation.RequestNavigateEventArgs e)
        {
            Process.Start(e.Uri.AbsoluteUri);
        }

        private void AboutBox_Loaded(object sender, RoutedEventArgs e)
        {
            var ver = Assembly.GetExecutingAssembly().GetName().Version.ToString();
            var fvi = FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location);
            version.Text = ver;
            copyright.Text = fvi.LegalCopyright;
        }

        public static void Spawn()
        {
            var w = new AboutBox();
            w.Focusable = true;
            w.Focus();
            w.Activate();

            Task.Run(() =>
            {
                Thread.Sleep(100);
                w.Dispatcher.Invoke(() =>
                {
                    w.Focus();
                    w.Activate();
                });
            });

            w.ShowDialog();
        }
    }
}
