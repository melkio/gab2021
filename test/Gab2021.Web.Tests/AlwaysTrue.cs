using NUnit.Framework;

namespace Gab2021.Web.Tests
{
    [TestFixture]
    public class AlwaysTrue
    {
        [Test]
        public void Run()
        {
            Assert.True(true);
        }
    }
}