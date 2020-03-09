using System;
using System.IO;
using System.Linq;

namespace FIcon.Icons
{
    public static class IcoWriter
    {
        /// <summary>
        /// Create an ICO file from a set of PNG files
        /// </summary>
        /// <param name="images">An array of PNG files</param>
        /// <returns>The binary content of an ICO file, can be directly written to a file</returns>
        public static byte[] IcoFromPNGs(PNGIcoImage[] images)
        {
            var icoDir = new ICONDIR((ushort)images.Length);

            uint imageOffset =
                                      6 + // Header
                16 * (uint)images.Length; // Each ICONDIRENTRY is 16 bytes long

            var memStream = new MemoryStream();
            var binWriter = new BinaryWriter(memStream);

            for (int i = 0; i < images.Length; i++)
            {
                var entry = new ICONDIRENTRY();
                entry.bWidth = images[i].width;
                entry.bHeight = images[i].height;
                entry.dwBytesInRes = images[i].Length;
                entry.dwImageOffset = imageOffset;

                icoDir.idEntries[i] = entry;

                binWriter.Write(images[i].data);

                imageOffset += images[i].Length;
            }

            binWriter.Flush();

            var imageData = memStream.ToArray();

            binWriter.Close();
            memStream.Close();
            binWriter.Dispose();
            memStream.Dispose();

            var dirData = icoDir.ToArray();

            return Combine(dirData, imageData);
        }

        private static byte[] Combine(params byte[][] arrays)
        {
            byte[] ret = new byte[arrays.Sum(x => x.Length)];
            int offset = 0;
            foreach (byte[] data in arrays)
            {
                Buffer.BlockCopy(data, 0, ret, offset, data.Length);
                offset += data.Length;
            }

            return ret;
        }
    }
}
