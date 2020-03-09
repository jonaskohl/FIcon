using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace FIcon.Icons
{
    internal struct ICONDIR
    {
        internal ushort idCount;
        internal ICONDIRENTRY[] idEntries;

        internal ICONDIR(ushort imageCount)
        {
            idCount = imageCount;
            idEntries = new ICONDIRENTRY[imageCount];
        }

        internal byte[] ToArray()
        {
            var memStream = new MemoryStream();
            var binWriter = new BinaryWriter(memStream);

            binWriter.Write((ushort)0); // idReserved, always 0
            binWriter.Write((ushort)1); // idType, always 1 as were are only writing ICO and not CUR
            binWriter.Write(idCount);
            binWriter.Write(idEntries.SelectMany(x => x.ToArray()).ToArray());

            binWriter.Flush();

            var data = memStream.ToArray();

            binWriter.Close();
            memStream.Close();
            binWriter.Dispose();
            memStream.Dispose();

            return data;
        }
    }

    internal struct ICONDIRENTRY
    {
        internal byte bWidth;
        internal byte bHeight;
        internal uint dwBytesInRes;
        internal uint dwImageOffset;

        internal byte[] ToArray()
        {
            var memStream = new MemoryStream();
            var binWriter = new BinaryWriter(memStream);

            binWriter.Write(bWidth);
            binWriter.Write(bHeight);
            binWriter.Write((byte)0);   // bColorCount, we're not using a palette, so this is 0
            binWriter.Write((byte)0);   // bReserved, is always to be 0
            binWriter.Write((ushort)0); // wPlanes, is 0 when using 8bpp PNG
            binWriter.Write((ushort)0); // wBitCount, goes unused and is therefore 0
            binWriter.Write(dwBytesInRes);
            binWriter.Write(dwImageOffset);

            binWriter.Flush();

            var data = memStream.ToArray();

            binWriter.Close();
            memStream.Close();
            binWriter.Dispose();
            memStream.Dispose();

            return data;
        }
    }
}
