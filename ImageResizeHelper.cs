using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FIcon.Util
{
    public static class ImageResizeHelper
    {
        public static readonly int[] ALLOWED_SIZES = new int[16] { 16, 20, 24, 28, 30, 31, 32, 40, 42, 47, 48, 56, 60, 63, 84, 256 };

        private static int ToNearestAllowed(int num)
        {
            return (from diffItem in
                          (from number in ALLOWED_SIZES
                              select new
                              {
                                  number,
                                  difference = Math.Abs(number - num)
                              })
                          orderby diffItem.difference
                          select diffItem).First().number;
        }

        public static Image ToNearestAllowed(Image sourceImage, bool disposeSourceImage = true)
        {
            var imageSize = sourceImage.Size;

            if (!IsSquare(imageSize))
                throw new Exception("Image must be square");

            int rounded;
            if (imageSize.Width >= 256)
                rounded = 256;
            else
                rounded = ToNearestAllowed(imageSize.Width);

            var destImage = new Bitmap(rounded, rounded);
            using (var g = Graphics.FromImage(destImage))
            {
                g.InterpolationMode = InterpolationMode.HighQualityBilinear;
                g.DrawImage(sourceImage, new Rectangle(0, 0, rounded, rounded));
            }

            if (disposeSourceImage)
                sourceImage.Dispose();

            return destImage;
        }

        public static Image ToNearestPowerOfTwo(Image sourceImage, bool disposeSourceImage = true)
        {
            var imageSize = sourceImage.Size;

            if (!IsSquare(imageSize))
                throw new Exception("Image must be square");

            int rounded;
            if (imageSize.Width >= 256)
                rounded = 256;
            else
                rounded = ToNearestPowerOfTwo(imageSize.Width);

            var destImage = new Bitmap(rounded, rounded);
            using (var g = Graphics.FromImage(destImage))
            {
                g.InterpolationMode = InterpolationMode.HighQualityBilinear;
                g.DrawImage(sourceImage, new Rectangle(0, 0, rounded, rounded));
            }

            if (disposeSourceImage)
                sourceImage.Dispose();

            return destImage;
        }

        private static bool IsSquare(Size s)
        {
            return s.Width == s.Height;
        }

        private static int ToNextPowerOfTwo(int num)
        {
            if (num < 0) return 0;
            --num;
            num |= num >> 1;
            num |= num >> 2;
            num |= num >> 4;
            num |= num >> 8;
            num |= num >> 16;
            return num + 1;
        }

        private static int ToNearestPowerOfTwo(int num)
        {
            var next = ToNextPowerOfTwo(num);
            int prev = next >> 1;
            return next - num < num - prev ? next : prev;
        }
    }
}
