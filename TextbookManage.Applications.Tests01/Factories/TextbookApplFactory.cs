using TextbookManage.Domain.IRepositories.JiaoWu;
using TextbookManage.Infrastructure.TypeAdapter;
using TextbookManage.Applications.Impl;
using System;
using Microsoft.Pex.Framework;

namespace TextbookManage.Applications.Impl
{
    /// <summary>A factory for TextbookManage.Applications.Impl.TextbookAppl instances</summary>
    public static partial class TextbookApplFactory
    {
        /// <summary>A factory for TextbookManage.Applications.Impl.TextbookAppl instances</summary>
        [PexFactoryMethod(typeof(TextbookAppl))]
        public static TextbookAppl Create(
            ITypeAdapter adapter_iTypeAdapter,
            ITextbookRepository bookRepo_iTextbookRepository,
            IPressRepository pressRepo_iPressRepository
        )
        {
            TextbookAppl textbookAppl = new TextbookAppl(adapter_iTypeAdapter,
                                                         bookRepo_iTextbookRepository, pressRepo_iPressRepository);
            return textbookAppl;

            // TODO: Edit factory method of TextbookAppl
            // This method should be able to configure the object in all possible ways.
            // Add as many parameters as needed,
            // and assign their values to each field by using the API.
        }
    }
}
