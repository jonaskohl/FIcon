using FIcon.Util;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace FIcon.Icons
{
    public class PNGIcoImage
    {
        public byte width; 
        public byte height;
        public byte[] data { get; private set; }

        /// <summary>
        /// Creates a PNGIcoImage from a PNG file
        /// </summary>
        /// <param name="path">The path to a PNG file</param>
        public static PNGIcoImage FromFile(string path)
        {
            var srcBmp = System.Drawing.Image.FromFile(path);
            var bmp = ImageResizeHelper.ToNearestAllowed(srcBmp);
            var tempPath = Path.GetTempFileName();

            var w = bmp.Width;
            var h = bmp.Height;

            bmp.Save(tempPath, ImageFormat.Png);
            bmp.Dispose();

            bmp.Dispose();
            return new PNGIcoImage()
            {
                width = getWidthHeight(w),
                height = getWidthHeight(h),
                data = File.ReadAllBytes(tempPath)
            };
        }

        /// <summary>
        /// The length of all binary PNG data from the loaded file
        /// </summary>
        public uint Length
        {
            get
            {
                return (uint)data.Length;
            }
        }

        private static byte getWidthHeight(int width)
        {
            if (width >= 256)
                return 0;
            return (byte)width;
        }

        private PNGIcoImage() { }
    }
}
