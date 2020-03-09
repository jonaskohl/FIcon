using System;
using System.Runtime.Serialization;

namespace FIcon
{
    public class ImageNotSquareException : Exception
    {
        public ImageNotSquareException()
        {
        }

        public ImageNotSquareException(string message) : base(message)
        {
        }

        public ImageNotSquareException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected ImageNotSquareException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}
