﻿using System.Collections.Generic;
using System.Text;
using AutoMapper;
using TextbookManage.Domain.Models;
using TextbookManage.Domain.Models.JiaoWu;

namespace TextbookManage.Applications.AdapterProfile
{
    /// <summary>
    /// 班级列表，转为班级名称
    /// 如：2012软件1班，2012软件2班
    /// </summary>
    public class ProfessionalClassesConvert : ITypeConverter<IEnumerable<ProfessionalClass>, string>
    {
        public string Convert(ResolutionContext context)
        {
            IEnumerable<ProfessionalClass> classes;

            if (context.SourceType == typeof(IEnumerable<ProfessionalClass>))
                classes = context.SourceValue as IEnumerable<ProfessionalClass>;
            else
                classes = new List<ProfessionalClass>();

            var name = new StringBuilder();
            foreach (var item in classes)
            {
                name.Append(item.Name);
                name.Append(",");
            }
            name.Remove(name.Length - 1, 1);
            return name.ToString();
        }
    }


}
