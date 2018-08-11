using TextbookManage.Infrastructure.TypeAdapter;
using Microsoft.Pex.Framework.Using;
// <copyright file="PexAssemblyInfo.cs">Copyright ©  2012</copyright>
using Microsoft.Pex.Framework.Coverage;
using Microsoft.Pex.Framework.Creatable;
using Microsoft.Pex.Framework.Instrumentation;
using Microsoft.Pex.Framework.Settings;
using Microsoft.Pex.Framework.Validation;

// Microsoft.Pex.Framework.Settings
[assembly: PexAssemblySettings(TestFramework = "MSTestv2")]

// Microsoft.Pex.Framework.Instrumentation
[assembly: PexAssemblyUnderTest("TextbookManage.Applications")]
[assembly: PexInstrumentAssembly("System.Core")]
[assembly: PexInstrumentAssembly("TextbookManage.ViewModels")]
[assembly: PexInstrumentAssembly("AutoMapper")]
[assembly: PexInstrumentAssembly("TextbookManage.IApplications")]
[assembly: PexInstrumentAssembly("TextbookManage.Domain")]
[assembly: PexInstrumentAssembly("TextbookManage.Infrastructure")]

// Microsoft.Pex.Framework.Creatable
[assembly: PexCreatableFactoryForDelegates]

// Microsoft.Pex.Framework.Validation
[assembly: PexAllowedContractRequiresFailureAtTypeUnderTestSurface]
[assembly: PexAllowedXmlDocumentedException]

// Microsoft.Pex.Framework.Coverage
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "System.Core")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "TextbookManage.ViewModels")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "AutoMapper")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "TextbookManage.IApplications")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "TextbookManage.Domain")]
[assembly: PexCoverageFilterAssembly(PexCoverageDomain.UserOrTestCode, "TextbookManage.Infrastructure")]
[assembly: PexUseType(typeof(AutoMapperTypeAdapter))]

