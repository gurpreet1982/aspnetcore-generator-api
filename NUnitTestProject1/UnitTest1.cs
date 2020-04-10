using api.Controllers;
using System.Linq;
using NUnit.Framework;

namespace NUnitTestProject1
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void CountShouldControlNumberofResults()
        {
            var range = new Range { Count = 3 };
            var generated = range.Of(() => "");
            Assert.AreEqual(3, generated.Count());
            

        }
    }
}