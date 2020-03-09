using FIcon.Icons;
using System.Collections.Generic;

namespace FIcon
{
    public class IconSizeComparer : IEqualityComparer<PNGIcoImage>
    {
        public bool Equals(PNGIcoImage x, PNGIcoImage y)
        {
            return x.width == y.width && x.height == y.height;
        }

        public int GetHashCode(PNGIcoImage obj)
        {
            return obj.width.GetHashCode();
        }
    }
}