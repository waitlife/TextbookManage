// <copyright file="TextbookApplTest.cs">Copyright ©  2012</copyright>
using System;
using Microsoft.Pex.Framework;
using Microsoft.Pex.Framework.Validation;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using TextbookManage.Applications.Impl;
using TextbookManage.ViewModels;

namespace TextbookManage.Applications.Impl.Tests
{
    /// <summary>此类包含 TextbookAppl 的参数化单元测试</summary>
    [PexClass(typeof(TextbookAppl))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(InvalidOperationException))]
    [PexAllowedExceptionFromTypeUnderTest(typeof(ArgumentException), AcceptExceptionSubtypes = true)]
    [TestClass]
    public partial class TextbookApplTest
    {
        /// <summary>测试 Modify(TextbookView) 的存根</summary>
        [PexMethod]
        public ResponseView ModifyTest([PexAssumeUnderTest]TextbookAppl target, TextbookView textbook)
        {
            ResponseView result = target.Modify(textbook);
            return result;
            // TODO: 将断言添加到 方法 TextbookApplTest.ModifyTest(TextbookAppl, TextbookView)
        }
    }
}
